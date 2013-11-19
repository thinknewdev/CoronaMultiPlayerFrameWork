module(..., package.seeall)
---------------------------------------------------------------
-- GROUPS
---------------------------------------------------------------
print("WORKED")


local background = display.newImage(fPath.."mainbackground.png")
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



--local popup = display.newImage(assetPath.."popup.png")



local yourGroup = display.newGroup()

local localGroup = display.newGroup()


local function onSubmit( event )
        if ( "began" == event.phase ) then
                -- Note: this is the "keyboard appearing" event
                -- In some cases you may want to adjust the interface while the keyboard is open.
                
        elseif ( "submitted" == event.phase ) then
                -- Automatically tab to password field if user clicks "Return" on iPhone keyboard (convenient!)
                --director:changeScene("desktop","moveFromLeft")
				native.setKeyboardFocus( nil )
				local message = dbgame.checkUser(userField.text,emailField.text,passField.text)
				
				--local message = droiddb.checkUser("flashfreakmx","flashfreakmx@gmail.com","tranced")
				if message == "success" then
					--director:changeScene("desktop","moveFromLeft")
				end
        end
end



function registerPlayer ( event )
	if event.phase == "release" then
		setOption( "popuptype", "register", "screen" )
		director:openPopUp("popup", "moveFromTop",nil)
	end
end

local function onListMeComplete( event )
    if event.isError then
        native.showAlert( "Alert",  event.response.error.message, { "Try Again" }, nil )
    else
        -- This is me...
        print("Me: " .. event.response.name .. ", id: " .. event.response.id)
        
        -- Go get the first 10 friends from my friend list, and let me know if any
        -- of them have this app installed...
        native.showAlert( "Alert", event.response.id, { "Try Again" }, nil )

        local message = dbgame.checkFBUser(event.response)
	
		--local message = droiddb.checkUser("flashfreakmx","flashfreakmx@gmail.com","tranced")
		if message == "success" then
			--director:changeScene("desktop","moveFromLeft")
		end
        --libFacebook.request("me/friends", "GET", {fields = "name,installed,first_name, last_name", limit = 500,}, onListFriendsComplete )
    end
end

local function onLoginComplete( event )
	
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
    --native.showAlert( "Alert", tostring( event.isError ) , { "Try Again" }, nil ) 
-----------------------------------------------------------------------------------------
	-- After a successful login event, send the FB command
	-- Note: If the app is already logged in, we will still get a "login" phase
	--
    if ( "session" == event.type ) then
        -- event.phase is one of: "login", "loginFailed", "loginCancelled", "logout"
		statusMessage.textObject.text = event.phase		-- tjn Added
		
		print( "Session Status: " .. event.phase )
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		end
		
		-- Request the current logged in user's info
			facebook.request( "me" )
--			facebook.request( "me/friends" )		-- Alternate request

-----------------------------------------------------------------------------------------


    elseif ( "request" == event.type ) then

    	
        -- event.response is a JSON object from the FB server
        local response = event.response
		if ( not event.isError ) then
			    

	        	response = json.Decode( event.response )
	        
				statusMessage.textObject.text = response.name
				--native.showAlert( "Alert", response.name, { "Try Again" }, nil ) 
				dbgame.checkFBUser(response)

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

function registerFBPlayer ( event )
	if event.phase == "ended" then
	   fbCommand = GET_USER_INFO
	   facebook.login( appId, onLoginComplete, {"publish_stream,read_friendlists,friends_about_me,email"}  )
	end
end



local function touched ( event )
	if event.phase == "ended" then
		audio.play( selectSound )
		director:changeScene("desktop","crossfade")
	end
end

local function initVars ()
		local fbBtn = createBtn("icon_fb_purple.png","FACEBOOK")
		mainGroup:insert(fbBtn)
		fbBtn.x = (screenW /2) - (fbBtn.width/2)
		fbBtn.type = "facebook"
		fbBtn.y = 160
		fbBtn:addEventListener("touch",registerFBPlayer)

		local contactBtn = createBtn("icon_contacts_purple.png","EMAIL")
		mainGroup:insert(contactBtn)
		contactBtn.x = (screenW /2) - (contactBtn.width/2)
		contactBtn.y = fbBtn.y + (contactBtn.height)
		contactBtn.type = "email"
		contactBtn:addEventListener("touch",registerPlayer)

		local nameText = display.newText("--- Don't want to Register? ---", 0, 0, native.systemFont, 30)
		nameText:setTextColor(0, 0, 0)
		--nameText.text = "Don't want to Register?"
		nameText.x = screenW/2
		nameText.y = contactBtn.y + 150
		nameText.size = 15

		localGroup:insert(background)
		localGroup:insert(fbBtn)
		localGroup:insert(contactBtn)
		localGroup:insert(nameText)
		localGroup:insert(statusMessage)

end
---------------------------------------------------------------
-- CLEAN
---------------------------------------------------------------

function clean ( event )
	print("register cleaned")
	timer.performWithDelay(1, function() collectgarbage("collect") end)

end

---------------------------------------------------------------
-- NEW
---------------------------------------------------------------

function new()
	
	-----------------------------------
	-- Initiate variables
	-----------------------------------
	
	initVars()
	
	-----------------------------------
	-- MUST return a display.newGroup()
	-----------------------------------
	
	return localGroup
	
end