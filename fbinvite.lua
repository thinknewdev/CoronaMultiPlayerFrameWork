--
-- Project: AndroidOverkill
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2011 Adam Coburn. All Rights Reserved.
-- 
module(..., package.seeall)

require("pprint")


 
--setup top and bottom boundaries for the scrolling view
local topBoundary = display.screenOriginY +45
local bottomBoundary = display.screenOriginY + 48
 
--setup a group into which you can insert anything that needs to scroll
local scrollView = scrollView.new{ top=topBoundary, bottom=bottomBoundary }


local localGroup = display.newGroup()
local gridGroup = display.newGroup()

--local gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1, fadein=5000 }  )

local boxWidth = (screenW - 50) / 6
	
local gridHeight = screenH - 160

local count = 1



-- controls program flow --
local curGameFunction = nil
-----------------------------------
-- FUNCTIONS
-----------------------------------







local instructions = nil
 





---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------
local background = display.newImage(fPath.."popup_back.png")
--local background = display.newRect(0, 0, screenW, screenH)
--background:setFillColor(255, 255, 255)


local StatusMessageY = 420		-- position of status message


local function createStatusMessage( message, x, y )
	-- Show text, using default bold font of device (Helvetica on iPhone)
	local textObject = display.newText( message, 0, 0, native.systemFontBold, 24 )
	textObject:setTextColor( 255,255,255 )

	-- A trick to get text to be centered
	local group = display.newGroup()
	group.x = x
	group.y = y
	group:insert( textObject, true )

	-- Insert rounded rect behind textObject
	local r = 10
	local roundedRect = display.newRoundedRect( 0, 0, textObject.contentWidth + 2*r, textObject.contentHeight + 2*r, r )
	roundedRect:setFillColor( 55, 55, 55, 190 )
	group:insert( 1, roundedRect, true )

	group.textObject = textObject
	return group
end

local statusMessage = createStatusMessage( "   Not connected  ", 0.5*display.contentWidth, StatusMessageY )





local yourGroup = display.newGroup()

-----------------------------------------------------
-- Sample/test usage for lib_facebook
--
local function onFriendList( event )

--- Debug Event parameters printout --------------------------------------------------
--- Prints Events received up to 20 characters. Prints "..." and total count if longer
---
	print( "Facebook Listener events:" )

	--native.showAlert( "Alert", "GETS HERE", { "Try Again" }, nil )
	
	local maxStr = 20		-- set maximum string length
	local endStr
	
	for k,v in pairs( event ) do
		local valueString = tostring(v)
		if string.len(valueString) > maxStr then
			endStr = " ... #" .. tostring(string.len(valueString)) .. ")"
		else
			endStr = ")"
		end
		print( "   " .. tostring( k ) .. "(" .. tostring( string.sub(valueString, 1, maxStr ) ) .. endStr )
	end
--- End of debug Event routine -------------------------------------------------------

    print( "event.name", event.name ) -- "fbconnect"
    print( "event.type:", event.type ) -- type is either "session" or "request" or "dialog"
	print( "isError: " .. tostring( event.isError ) )
	print( "didComplete: " .. tostring( event.didComplete) )

	--native.showAlert( "Alert", event.type, { "Try Again" }, nil )  
-----------------------------------------------------------------------------------------
	-- After a successful login event, send the FB command
	-- Note: If the app is already logged in, we will still get a "login" phase
	--
    if ( "session" == event.type ) then
        -- event.phase is one of: "login", "loginFailed", "loginCancelled", "logout"
		--statusMessage.textObject.text = event.phase		-- tjn Added
		
		print( "Session Status: " .. event.phase )
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		else 

		end
		
		-- Request the current logged in user's info
		facebook.request("me/friends","GET",{fields = 'name,first_name,last_name,installed'})
		--facebook.request("me/friends")
-----------------------------------------------------------------------------------------

    elseif ( "request" == event.type ) then

    	
        -- event.response is a JSON object from the FB server
        local response = event.response
		if ( not event.isError ) then

	        	response = json.Decode( event.response )
               -- native.showAlert( "Alert",  response.data, { "Try Again" }, nil )  

	        	local friends = {}
				local data = response.data
				for i=1,#data do
					local friend = data[i]
					
					
			        pprint("FRIEND",friend)
			        statusMessage.textObject.text = friend.first_name
		            --print("Facebook friend: " .. friend.name .. ", id: " .. friend.id)
		            local friendBtn = createSBtn(string.upper(friend.first_name), 70)
					friendBtn.x = (screenW / 2) - (friendBtn.width /2)
					friendBtn.y = (friendBtn.height * i) + 8
					scrollView:insert(friendBtn)

					local playeravatar = display.loadRemoteImage("http://graph.facebook.com/"..friend.id.."/picture","GET",function( event) 
					--playeravatar 	= 
					--event.target.y = 85 * count
					scrollView:insert(event.target)
					--localGroup:insert(playerstats)
					end , friend.id..".png", system.DocumentsDirectory, 18, (friendBtn.height * i) + 15)
					
					--playeravatar.y = 85 * count
					count = count + 1
		            
		        end

		        statusMessage.textObject.text = #data 
	        
				
				

        else
        	-- Post Failed
			statusMessage.textObject.text = "Post failed"
			printTable( event.response, "Post Failed Response", 3 )
		end
		
	elseif ( "dialog" == event.type ) then
		-- showDialog response
		--
		print( "dialog response:", event.response )
		statusMessage.textObject.text = event.response
    end
end

local function initVars ()

	-----------------------------------
	-- Inserts
	-----------------------------------

	localGroup:insert(background)

	yourGroup.y = 50
	yourGroup.x = (screenW/2) - (yourGroup.width/2)

	localGroup:insert(yourGroup)
	localGroup:insert(scrollView)
	localGroup:insert(statusMessage)

end

---------------------------------------------------------------
-- CLEAN
---------------------------------------------------------------

function clean ( event )
	print("2 cleaned")
	timer.performWithDelay(1, function() collectgarbage("collect") end)

end

function new()
	
	-----------------------------------
	-- Initiate variables
	-----------------------------------
	
	initVars()
	facebook.login( appId, onFriendList, {"publish_stream"}  )
	-----------------------------------
	-- MUST return a display.newGroup()
	-----------------------------------
	
	return localGroup
	
end


			
