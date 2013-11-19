module(..., package.seeall)
--
-- Project: AndroidOverkill
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2011 Adam Coburn. All Rights Reserved.
-- 

--Include sqlite

local fetcheduser = nil;
local randurl = nil
 
--Handle the applicationExit event to close the db
local function onSystemEvent( event )
        if( event.type == "applicationExit" ) then              
            db:close()
        end
end
 
 
--Setup the table if it doesn't exist
--local tabledel = [[DELETE FROM user]]
--db:exec( tabledel )
--print(tabledel)
--local tabledel = [[REPLACE user (username) VALUES ('flashfreakmx')]]
--print(tabledel)
--db:exec( tabledel )
local tablesetup = [[CREATE TABLE IF NOT EXISTS user (id INTEGER PRIMARY KEY, username, password, email , facebookid, databaseid, wins, losses);]]
print(tablesetup)
db:exec( tablesetup )

for row in db:nrows("SELECT * FROM user") do
	  print(row.username)
	  print(row.facebookid)
	  print(row.gold)
	end
 
--Add rows with a auto index in 'id'. You don't need to specify a set of values because we're populating all of them
-- local testvalue = {}

-- local tablefill =[[INSERT INTO test VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[['); ]]
-- local tablefill2 =[[INSERT INTO test VALUES (NULL, ']]..testvalue[2]..[[',']]..testvalue[1]..[['); ]]
-- local tablefill3 =[[INSERT INTO test VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[3]..[['); ]]
-- db:exec( tablefill )
-- db:exec( tablefill2 )
-- db:exec( tablefill3 )

function createUser()
 print("created user")
 return 
end

function checkUser(email)
	print("check user")
	local message = "";

	randurl = "http://gameapi.thinknewgames.com/checkuserjson.php?e="..email
	network.request( randurl, "GET", function (event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print(t.users.action)
		if t.users.action == "retry" then
			native.showAlert( "Alert", "Could Not Create User or Credentials Do Not Match For Retrieval", { "Try Again" }, nil )
			message = t.users.action;
		end
		if t.users.action == "recover" then
			local userfill =[[INSERT OR REPLACE INTO user (email,databaseid) VALUES (']]..t.users.user.email..[[',']]..t.users.user.userid..[['); ]]
			db:exec( userfill )
			message = "success";
			timer.performWithDelay (1000, function ()

				director:changeScene("desktop","moveFromLeft")

			end)
			
		end
		if t.users.action == "register" then

			
			local xmlstring ="<addmember><email>"..email.."</email><gameid>"..myappid.."</gameid></addmember>"
			network.request("http://android.think-new.com/api/process.php?call="..url.escape(xmlstring).."&js=true", "GET", function (event)
			local t = json.Decode(event.response)
			local newuserfill =[[INSERT OR REPLACE INTO user (email,databaseid) VALUES (']]..email..[[',']]..t.users.user.userid..[['); ]]
				db:exec( newuserfill )
				message = "success";
			
				timer.performWithDelay (1000, function ()

				director:changeScene("desktop","moveFromLeft")

				end)
			end)
		end	
	end)
	
	--print all the table contents
	for row in db:nrows("SELECT * FROM user") do
	  print(row.username)
	  print(row.facebookid)
	  print(row.gold)
	end
	
	return message;
end

function checkFBUser(fbdata)
	print("check user")
	local message = "";

	randurl = "http://gameapi.thinknewgames.com/checkfbuserjson.php?fid="..fbdata.id.."&id="..myappid
	network.request( randurl, "GET", function (event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		--print(t.users.action)
	--	native.showAlert( "Alert", t.users.action, { "Try Again" }, nil ) 
		if t.users.action == "retry" then
			native.showAlert( "Alert", "Could Not Create User or Credentials Do Not Match For Retrieval", { "Try Again" }, nil )
			message = t.users.action;
		end
		if t.users.action == "recover" then
			local userfill =[[INSERT OR REPLACE INTO user (facebookid,databaseid) VALUES (']]..t.users.user.fbuser..[[',']]..t.users.user.userid..[['); ]]
			db:exec( userfill )
			message = "success";
			director:changeScene("desktop","moveFromLeft")

			
		end
		if t.users.action == "register" then

		
			local xmlstring ="<addmember><fbuser>"..fbdata.id.."</fbuser><username>"..fbdata.name.."</username><gameid>"..myappid.."</gameid></addmember>"
			network.request("http://gameapi.thinknewgames.com/processfb.php?call="..url.escape(xmlstring).."&js=true", "GET",function (devent)
				
				local t = json.Decode(devent.response)

				local newuserfill =[[INSERT OR REPLACE INTO user (facebookid,databaseid) VALUES (']]..t.users.user.fbuser..[[',']]..t.users.user.userid..[['); ]]
				db:exec( newuserfill )
				message = "success";
				director:changeScene("desktop","moveFromLeft")

			end)
		end	
	end)
	
	--print all the table contents
	for row in db:nrows("SELECT * FROM user") do
	  print(row.username)
	  print(row.facebookid)
	  print(row.gold)
	end
	
	return message;
end

function createRandom()
	print("CREATE RANDOM TRY")
	local xmlstring ="<addmember><username>1</username><password>1</password><email>1</email></addmember>"
	network.request("http://thinknewgames.com/gameapi/randomuser.php?call="..url.escape(xmlstring).."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.users.action)
		if(t.users.action  == "random") then
			print("CREATING RANDOM")
			local newuserfill =[[INSERT OR REPLACE INTO user (username) VALUES (']]..t.users.username..[['); ]]
			db:exec( newuserfill )
			message = "success";
			--showLoader()
			--loadPlayer()
			timer.performWithDelay (4000, showDesktop)
		end
	end)
	
end

function createInstance(tiles,playerid,challengerid,gameid)
	print("CREATE RANDOM TRY")
	network.request("http://thinknewgames.com/gameapi/createinstance.php?tiles="..tiles.."&player="..playerid.."&challenger="..challengerid.."&gameid="..gameid.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.words.move.message)
		setOption( "instanceid", t.words.move.instance, "screen" )
		director:closePopUp()
		director:changeScene("game","moveFromRight")
		
			
	end)
	
end


function createGame(gtype,phrase)
	print("CREATE RANDOM TRY")
	if  gtype == "random" then
		network.request("http://thinknewgames.com/gameapi/finduser.php?type="..gtype.."&id="..player.databaseid.."&js=true", "GET", function(event)
			print ( "RESPONSE: " .. event.response )
			local t = json.Decode(event.response)
			local message = t.users.action
			if message == "success" then

				local fullletters = {}
				print(lettercount)
				for i = 1, table.maxn(lettercount), 1 do
					--print(table.maxn(lettercount) .." :: " .. letters[i])
					for g = 1, lettercount[i], 1 do
						table.insert(fullletters,letters[i])
					end 
					
				end 

				table.shuffle(fullletters)
				table.shuffle(fullletters)
				table.shuffle(fullletters)

				createInstance(table.concat(fullletters, "-"),player.databaseid, t.users.user.userid,myappid)
				
			else 
				native.showAlert( "Alert", t.users.message, { "Try Again" }, nil ) 
			end
			
				
		end)
	else 
		network.request("http://thinknewgames.com/gameapi/finduser.php?type="..gtype.."&phrase="..phrase.."&js=true", "GET", function(event)
			print ( "RESPONSE: " .. event.response )
			local t = json.Decode(event.response)
			local message = t.users.action
			if message == "success" then

				local fullletters = {}
				print(lettercount)
				for i = 1, table.maxn(lettercount), 1 do
					--print(table.maxn(lettercount) .." :: " .. letters[i])
					for g = 1, lettercount[i], 1 do
						table.insert(fullletters,letters[i])
					end 
					
				end 

				table.shuffle(fullletters)
				table.shuffle(fullletters)
				table.shuffle(fullletters)

				createInstance(table.concat(fullletters, "-"),player.databaseid, t.users.user.userid,myappid)
			else 
				native.showAlert( "Alert", t.users.message, { "Try Again" }, nil ) 
			end
				
		end)
	end
	
end


function checkWord(word,tiles)
	print("CREATE RANDOM TRY")
	network.request("http://thinknewgames.com/gameapi/checkword.php?word="..word.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.words.word.message)
		if(t.words.word.message == "fail") then
			local alert = native.showAlert( "Word Check", t.words.word.message, 
                                        { "OK" }, nil )
			movetry = "fail"
		else 

			sendMove(word,tiles)
		
		end
			
	end)
	
end

function sendMove(word,tiles,tinstance)
	print("CREATE RANDOM TRY")
	network.request("http://thinknewgames.com/gameapi/sendmove.php?id="..tinstance.."&word="..word.."&device="..mydevice.."&tiles="..tiles.."&player="..player.databaseid.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
	end)
	
end

function fetchUser(user)
	print("check user")
	
	if fetcheduser == nil then
		network.request( "http://android.think-new.com/fetchuser.php?u="..user, "GET", function (event)
			print ( "User: " .. event.response )
			local t = json.Decode(event.response)
			--local thisuser = t.users.user
			--print("Test test: "..thisuser)
			myuser = t.users.user
			fetcheduser = true
			fetchUser(nil)
		end)
	else 
		print("working now")
		return true
	end
	
end



function facebookConnect(user,fbid)
	print("use item")
	local xmlstring ="<usefacebook><username>"..user.."</username><fbid>"..fbid.."</fbid></usefacebook>"
	network.request("http://android.think-new.com/api/updatefbuser.php?call="..url.escape(xmlstring).."&js=true", "GET")
	
end

function updateAvatar(user,bot,color,fbid)
	print("use item")
	local xmlstring ="<usefacebook><username>"..user.."</username><bot>"..bot.."</bot><color>"..color.."</color><fbid>"..fbid.."</fbid></usefacebook>"
	network.request("http://android.think-new.com/api/updatefbuser.php?call="..url.escape(xmlstring).."&js=true", "GET")
	
end


 
--print the sqlite version to the terminal
print( "version " .. sqlite3.version() )
 

 
--setup the system listener to catch applicationExit
Runtime:addEventListener( "system", onSystemEvent )
