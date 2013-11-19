--[[
 #
 # Helper methods for Tables and Arrays
 #
 # TableUtils.lua
 #

 
 # Permission is hereby granted, free of charge, to any person 
 # obtaining a copy of this software to deal in the Software without 
 # restriction, including without limitation the rights to use, 
 # copy, modify, merge, publish, distribute, sublicense, and/or 
 # sell copies of the Software, and to permit persons to whom the 
 # Software is furnished to do so.
 #
 # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 # EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 # OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 # IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
 # ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
 # CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
 # CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 Usage:
  Just require this module in your application:
        local TableUtils = require("TableUtils")
 
 And all methods below are available to use:
        TableUtils.keys(table)
        TableUtils.values(table)
        TableUtils.include(table, value)
        TableUtils.select(table, expression)
        TableUtils.reject(table, expression)
        
--]]
 
local type      = type
local error     = error
local string    = string
local table     = table
local pairs     = pairs
local tonumber  = tonumber
 
module("TableUtils")
 
------------------------------
-- Local Helper Function
------------------------------
local split = function(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) 
    pos = sp + 1
  end
  table.insert(arr,string.sub(str,pos)) 
  return arr
end
 
--[[
=====================================================================================
Checks if the given table contains the given value.
 
Usage:
        local names = { "Bob", "Joe", "Peter" }
        print( TableUtils.include(names, "Bob") )
        --> true
        print( TableUtils.include(names, "Bobbie") )
        --> false
 
Returns true or false
====================================================================================]]
function include(hash, value)
        local included = false
        for k,v in pairs(hash) do
                if v == value then
                        included = true
                        break
                end
        end
        return included
end
 
 
--[[
=====================================================================================
Selects values from the given table by the given expression.
 
The expression consists of three parts:
  1) the variable: Either "key" or "value"
  2) the operator: "==", "~=", "<", ">", "<=", ">="
  3) the value   : number, string, boolean
 
Usage:
        local hash = { one = 1, three = 3, 5, 8, bob = "Bob", "Joe", "Peter", true, true, false }
        print( TableUtils.select(hash, "value >= 3") )
        --> { three = 3, 5, 8 }
        print( TableUtils.select(hash, "value == true") )
        --> { true, true }
        print( TableUtils.select(hash, "value ~= true") )
        --> { false }
        print( TableUtils.select(hash, "value ~= Bob") )
        --> { "Joe", "Peter" }
        print( TableUtils.select(hash, "key == one") )
        --> { one = 1 }
 
This function is "smart" enough to return only the types of value
that was passed in the expression. In other words, if you
evaluated the expression with a number, numbers will be returned,
if the value was a string, strings will be returned, and so on.
=====================================================================================]]
function select(hash, expression)
        local k, v, key, opr, val, parts, valIsNum, vIsNum
        local ops = { "==", "~=", "<", ">", "<=", ">=" }
        local tmpTable = {}
        local result   = {}
        local valType  = "string"
        
        parts = split(" ", expression)
        key, opr, val = parts[1], parts[2], parts[3]
        key = key == "key"      
        
        -- exit if the operator passed is invalid 
        if not( include(ops, opr) ) then return({}) end
 
        -- if the value is a digit then we convert it to a number
        if string.match( val, "%d") then val = tonumber(val); valIsNum = true; valType = "number" end
        
        -- if the value is a boolean then we make it a boolean
        if (val == "true" or val == "false") then val = val == "true"; valType = "boolean" end
                
        -- iterates through the given table and manually validates the given expression.
        -- needs to validate this way because loadstring() isn't support by Corona
        for k,v in pairs(hash) do
                vIsNum = type(v) == "number"
                if opr == "==" then
                        if not(key) then if v == val then tmpTable[k] = v end else if k == val then tmpTable[k] = v end end
                elseif opr == "~=" then
                        if not(key) then if v ~= val then tmpTable[k] = v end else if k ~= val then tmpTable[k] = v end end
                elseif vIsNum and valIsNum and opr == "<" then
                        if not(key) then if v <  val then tmpTable[k] = v end end
                elseif vIsNum and valIsNum and opr == ">" then
                        if not(key) then if v >  val then tmpTable[k] = v end end
                elseif vIsNum and valIsNum and opr == "<=" then
                        if not(key) then if v <= val then tmpTable[k] = v end end
                elseif vIsNum and valIsNum and opr == ">=" then
                        if not(key) then if v >= val then tmpTable[k] = v end end
                end
        end
        
        -- only return the types of value that was given in the expression
        for k,v in pairs(tmpTable) do if type(v) == valType then result[k] = v end end
        
        return result
end
 
 
--[[
=====================================================================================
Similar to the select() function except that it rejects 
values from the given table by the given expression. In 
other words, this is a negative select() function.
 
Usage:
        local hash = { one = 1, three = 3, 5, 8, bob = "Bob", "Joe", "Peter", true, true, false }
        print( TableUtils.reject(hash, "value > 3") )
        --> { three = 3 }
        print( TableUtils.reject(hash, "value == true") )
        --> { false }
        print( TableUtils.reject(hash, "value ~= true") )
        --> { true, true }
        print( TableUtils.reject(hash, "value ~= Bob") )
        --> { bob = "Bob" }
=====================================================================================]]
function reject(hash, expression)
        local var, opr, val, parts
        
        parts = split(" ", expression)
        var, opr, val = parts[1], parts[2], parts[3]
        
        if         opr == "==" then opr = "~=" 
        elseif opr == "~=" then opr = "==" 
        elseif opr == "<"  then opr = ">="  
        elseif opr == ">"  then opr = "<="  
        elseif opr == "<=" then opr = ">" 
        elseif opr == ">=" then opr = "<" end
        
        return select(hash, var.." "..opr.." "..val)
end
 
 
--[[
=====================================================================================
Returns a new table with the values from the given table
 
Usage:
        local names = { first = "Bob", second = "Joe", "Doe" }
        print( TableUtils.values(names) )
        --> { "Bob", "Joe", "Doe" }
=====================================================================================]]
function values(hash)
        local array = {}
        for k,v in pairs(hash) do
                table.insert(array, v)
        end
        return array
end
 
 
--[[
=====================================================================================
Returns a new table with the keys from the given table
 
Usage:
        local names = { first = "Bob", second = "Joe", "Doe" }
        print( TableUtils.keys(names) )
        --> { 1, "first", "second" }
=====================================================================================]]
function keys(hash)
        local array = {}
        for k,v in pairs(hash) do
                table.insert(array, k)
        end
        return array
end
 
 
--[[
=====================================================================================
Checks if the given table is empty.
 
Usage:
        local names = { "Bob", "Joe", "Peter" }
        print( TableUtils.empty(names) )
        --> false
 
Returns true or false
=====================================================================================]]
function empty(hash)
        return #hash == 0
end