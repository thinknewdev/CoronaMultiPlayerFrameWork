CiderRunMode = {};CiderRunMode.runmode = true;CiderRunMode.assertImage = true;require "CiderDebugger";-- Project: AndroidOverkill
-- Description:
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2011 Adam Coburn. All Rights Reserved.
---- cpmgen main.lua

---------------------------------------------------------------
-- Database Info
---------------------------------------------------------------
screenW = display.contentWidth
screenH = display.contentHeight
height = display.contentHeight
width = display.contentWidth
myappid = 1


-- Facebook Commands
fbCommand = nil			-- forward reference
LOGOUT = 1
SHOW_DIALOG = 2
POST_MSG = 3
POST_PHOTO = 4
GET_USER_INFO = 5
GET_PLATFORM_INFO = 6



---------------------------------------------------------------
-- Register Globals
---------------------------------------------------------------

assetPath = "drawables/"
audioPath = "audio/"
fPath = "fassets/"

tiles_in_play = {}




--assetPath = ""
--audioPath = ""

require "sqlite3"

local http = require("socket.http")
local ltn12 = require("ltn12")
player = {}

url = require("socket.url")

--Open data.db.  If the file doesn't exist it will be created
local path = system.pathForFile("icerage.db", system.DocumentsDirectory)
db = sqlite3.open( path ) 

dbgame = require("dbhandle")



require "options"
local mime = require( "mime" )
json = require("Json")
 
-- Here is the implementation of Push Notification in Corona SDK
local launchArgs = ...
APPKEY = ""
APPLICATIONSECRET = ""
 
if launchArgs and launchArgs.notification then
        -- The code below will only trigger if your app is dead and not active at all
        -- *********************************************************************************
        --native.showAlert( "launchArgs", Json.Encode( launchArgs.notification ), { "OK" } )
        --[[ notification table contains:
        launchArgs.notification.type - "remote"
        launchArgs.notification.name - "notification"
        launchArgs.notification.sound - "sound file or 'default'"
        launchArgs.notification.alert - "message specified during push"
        launchArgs.notification.badge - "5" -- badge value that was sent
        launchArgs.notification.applicationstate - "inactive"
        --]]
            native.showAlert( "Cocktails n Dreams", launchArgs.notification.alert, { "OK" } )
end
 
-- Function to handle Network Traffic Response from Urban Airship
local function urbanNetworkListener( event )
    if ( event.isError ) then
        --native.showAlert( "Network error!", "Error has occured from Urban Airship", {"OK"})
    else
        --native.showAlert( "Urban Airship", event.response, {"OK"})
    end
end
 
-- Function to register device for Urban Airships Services
local function registerUrbanDevice(deviceToken)
    local secretString = mime.b64(APPKEY .. ":" .. APPLICATIONSECRET)
        headers = {}
        headers["Authorization"] = "Basic " .. secretString
        print("SecretString: " .. secretString)
        print("Device ID: " .. deviceToken)
        body = ""
        local params = {}
        params.headers = headers
        params.body = body
        network.request( "https://go.urbanairship.com/api/device_tokens/" .. deviceToken, "PUT", urbanNetworkListener,  params)
end
 
-- notification listener
local function onNotification( event )
    if event.type == "remoteRegistration" then
                registerUrbanDevice(event.token)
    elseif event.type == "remote" then
        -- The code below will only trigger if your app is alive and kicking
        -- *********************************************************************************
        --native.showAlert( "remote", Json.Encode( event ), { "OK" } )
        --[[ notification table contains:
    launchArgs.notification.type - "remote"
    launchArgs.notification.name - "notification"
    launchArgs.notification.sound - "sound file or 'default'"
    launchArgs.notification.alert - "message specified during push"
    launchArgs.notification.badge - "5" -- badge value that was sent
    launchArgs.notification.applicationstate - "inactive"
    --]]
        native.showAlert( "Cocktails n Dreams", event.alert , { "OK" } )
   end
end
 
-- Initiera Eventhandler f�r Notifications
Runtime:addEventListener( "notification", onNotification )
 
-- Here is the end of the Push Notification




function showWaitScreen()
	native.setActivityIndicator(true)
end


function hideWaitScreen()
	native.setActivityIndicator(false)
end  
---------------------------------------------------------------
-- Import director class
---------------------------------------------------------------
--require( "cleangroup" )
TableUtils = require("TableUtils")
ui = require("ui")
json = require("Json")
director = require("director")
facebook = require("facebook")


-- LOAD THE LIBRARY
TextCandy = require("lib_text_candy")

require "sprite"

require "options"
require "wraptext"

gameNetwork = require "gameNetwork"

-- LOAD & ADD A CHARSET
TextCandy.AddCharset ("ICEBREAKER", "icebreaker_blue", "icebreaker_blue.png", "0123456789A{BCDEFGHIJKLMNO{PQRSTU{VWXYZ'*@():,$.!-%+?;#/_", 8)

-- ADJUST Y-OFFSET OF NON-UNIFORM SIZED CHARS
TextCandy.SetCharYOffset("ICEBREAKER", ",", 8)
TextCandy.SetCharYOffset("ICEBREAKER", ".", 8)

mydevice = system.getInfo( "deviceID" )

print("MY Device"..mydevice)

---------------------------------------------------------------------------------------------------
-- NOTE: To create an OpenFeint-enabled game, first log into OpenFeint and create a new OpenFeint 
-- application. That will give you the "Product Key", "Product Secret" and "Client Application ID" strings that should be 
-- used in the following lines:

of_product_key = "VVzcuVGqjp6Mh0uua4y6Kw"
of_product_secret = "oy1esmoSDmmUQ5819R081cDjJJgrPwxyLFa5vsrp8"
of_app_id = "301523"


-- Words With Friends
letters = explode(",",'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z')
lettercount = { 9, 2, 2, 5, 13, 2, 3, 4, 8, 1, 1, 4, 2, 5, 8, 2, 1, 6, 5, 7, 4, 2, 2, 1, 2, 1 }

---------------------------------------------------------------------------------------------------

function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    -- Attach chars left of current divider
    table.insert(arr,string.sub(str,pos,st-1)) 
    pos = sp + 1 -- Jump past current divider
  end
  -- Attach chars right of last divider
  table.insert(arr,string.sub(str,pos)) 
  return arr
end


function table.shuffle(t)
    math.randomseed(os.time())
    assert(t, "table.shuffle() expected a table, got nil")
    local iterations = #t
    local j
    for i = iterations, 2, -1 do
            j = math.random(i)
            t[i], t[j] = t[j], t[i]
    end
end


-- New Facebook Connection listener

appId  = "138294852910700"        -- You must supply this value
--libFacebook.FB_Access_Token = "AAAB9x0eUZCmwBANZAnRtwjU2xaBz61YAam2skUbYJCQ4lbJCcNdvYDE6KjO0l6ZBsO63ZBaol4mxZCDPf2ZCKBn5bHx9jKAfkgK5lNjDHS0wZDZD" -- You must supply this value to test from the simulator
apiKey = nil

--
function fblistener( event )

--- Debug Event parameters printout --------------------------------------------------
--- Prints Events received up to 20 characters. Prints "..." and total count if longer
---
	print( "Facebook Listener events:" )
	
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
-----------------------------------------------------------------------------------------
	-- After a successful login event, send the FB command
	-- Note: If the app is already logged in, we will still get a "login" phase
	native.showAlert( "Alert", event.type, { "Try Again" }, nil )  
    native.showAlert( "Alert", tostring( event.isError ) , { "Try Again" }, nil ) 
	--
    if ( "session" == event.type ) then
        -- event.phase is one of: "login", "loginFailed", "loginCancelled", "logout"
		statusMessage.textObject.text = event.phase		-- tjn Added
		
		print( "Session Status: " .. event.phase )
		
		if event.phase ~= "login" then
			-- Exit if login error
			return
		end
		
		-- The following displays a Facebook dialog box for posting to your Facebook Wall
		if fbCommand == SHOW_DIALOG then

			-- "feed" is the standard "post status message" dialog
			facebook.showDialog( "feed", {
				name = "Test name",
				description = "Example description.",
				link = "http://www.coronasdk.com/"
			})

			-- for "apprequests", message is required; other options are supported
			--[[
			facebook.showDialog( "apprequests", {
				message = "Example message."
			})
			--]]
		end
	
		-- Request the Platform information (FB information)
		if fbCommand == GET_PLATFORM_INFO then
			facebook.request( "platform" )		-- **tjn Displays info about Facebook platform
		end

		-- Request the current logged in user's info
		if fbCommand == GET_USER_INFO then
			native.showAlert( "Alert",fbCommand, { "Try Again" }, nil ) 

			facebook.request( "me" )
--			facebook.request( "me/friends" )		-- Alternate request
		end

		-- This code posts a photo image to your Facebook Wall
		--
		if fbCommand == POST_PHOTO then
			local attachment = {
				name = "Developing a Facebook Connect app using the Corona SDK!",
				link = "http://developer.anscamobile.com/forum",
				caption = "Link caption",
				description = "Corona SDK for developing iOS and Android apps with the same code base.",
				picture = "http://developer.anscamobile.com/demo/Corona90x90.png",
				actions = json.encode( { { name = "Learn More", link = "http://anscamobile.com" } } )
			}
		
			facebook.request( "me/feed", "POST", attachment )		-- posting the photo
		end
		
		-- This code posts a message to your Facebook Wall
		if fbCommand == POST_MSG then
			local time = os.date("*t")
			local postMsg = {
				message = "Posting from Corona SDK! " ..
					os.date("%A, %B %e")  .. ", " .. time.hour .. ":"
					.. time.min .. "." .. time.sec
			}
		
			facebook.request( "me/feed", "POST", postMsg )		-- posting the message
		end
-----------------------------------------------------------------------------------------

    elseif ( "request" == event.type ) then
        -- event.response is a JSON object from the FB server
        local response = event.response
        
		if ( not event.isError ) then
	        response = json.decode( event.response )
	        
	        if fbCommand == GET_USER_INFO then
				statusMessage.textObject.text = response.name
				printTable( response, "User Info", 3 )
				print( "name", response.name )
				native.showAlert( "Alert", response.name, { "Try Again" }, nil ) 
				dbgame.checkFBUser(response.id)
				
			elseif fbCommand == POST_PHOTO then
				printTable( response, "photo", 3 )
				statusMessage.textObject.text = "Photo Posted"
							
			elseif fbCommand == POST_MSG then
				printTable( response, "message", 3 )
				statusMessage.textObject.text = "Message Posted"
				
			else
				-- Unknown command response
				print( "Unknown command response" )
				statusMessage.textObject.text = "Unknown ?"
			end
--[[
			-- Display table of friends (not used at this time) ** Currently not used **
			local friends = {}
			local data = response.data
			for i=1,#data do
				local name = data[i].name
				local name = data[i].name
				table.insert( friends, name )
			end

			local topBoundary = display.screenOriginY + 40
			local bottomBoundary = display.screenOriginY + 0
			
			-- create the list of items
			myList = tableView.newList{
				data=friends, 
				default="listItemBg.png",
				--default="listItemBg_white.png",
				over="listItemBg_over.png",
--				onRelease=listButtonRelease,
				top=topBoundary,
				bottom=bottomBoundary,
			}
--]]
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



---------------------------------------------------------------
-- Debug Info
---------------------------------------------------------------
-- LOAD & ADD A CHARSET
--TextCandy.AddCharset ("FONT1", "font_Small3_White", "font_Small3_White.png", "0123456789A�BCDEFGHIJKLMNO�PQRSTU�VWXYZ'*@():,$.!-%+?;#/_", 10)

-- ADJUST Y-OFFSET OF NON-UNIFORM SIZED CHARS
--TextCandy.SetCharYOffset("FONT1", ",", 8)
--TextCandy.SetCharYOffset("FONT1", ".", 8)


---------------------------------------------------------------
-- Create a main group
---------------------------------------------------------------
mainGroup = display.newGroup()

--gameMusic = audio.loadStream( audioPath.."track.mp3" )
--buttonSound = audio.loadSound( audioPath.."click.mp3" )
--selectSound = audio.loadSound( audioPath.."select.mp3" )
--purchaseSound = audio.loadSound( audioPath.."pathcomplete.wav" )
--errorSound = audio.loadSound( audioPath.."pathcomplete.wav" )



--castSound = audio.loadSound( audioPath.."pathcomplete.wav" )


---gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1, fadein=3000 }  )

--audio.play( tapSound )
loadingAlert = {}
pressingBack = false
gamestate = false

-- Player Globals


timerHolder = {}
movetry = false



function onCloseApp( event )
	if "clicked" == event.action then
		local i = event.index
		if 1 == i then
				Runtime:removeEventListener( "key", onKeyEvent );
				os.exit()
		elseif 2 == i then

		end
			
	end
end

function onGoHome (event )
	if "clicked" == event.action then
		local i = event.index
		if 1 == i then
				director:changeScene("desktop","fade") 
		elseif 2 == i then
			  
		end
			
	end
end

function showLoader()
	gamestate = false
	director:openPopUp("loadingwaiting", nil)
end

function showDesktop()
	closeLoader()
	director:changeScene("desktop","moveFromLeft")

end


function closeLoader()
	gamestate = true
	director:closePopUp()
end

function createBtn(icon, label)
	local btnGroup = display.newGroup()
	local s = display.newImage(fPath.."button.png")
	local i = display.newImage(assetPath..icon)
	print(label)
	local MyText = TextCandy.CreateText({
		fontName 	= "ICEBREAKER", 						
		x		 	= ((s.width - i.width)*.5)+i.width,						
		y		 	= s.height*.5,						
		text	 	= label,	
		originX	 	= "CENTER",							
		originY	 	= "CENTER",							
		textFlow 	= "CENTER",	
		charSpacing = -5,
		lineSpacing = -4,
		wrapWidth	= 300, 								
		--showOrigin 	= true,								
		})
	btnGroup:insert(s)
	btnGroup:insert(i)
	btnGroup:insert(MyText)
	i.x = (i.width/2) +6
	i.y = (s.height/2) - 4

	return btnGroup
end


function createSBtn(label,xpos)
	local btnGroup = display.newGroup()
	local s = display.newImage(fPath.."button.png")
	print(label)
	local MyText = TextCandy.CreateText({
		fontName 	= "ICEBREAKER", 						
		x		 	= (s.width *.5),						
		y		 	= s.height*.5,						
		text	 	= label,	
		originX	 	= "CENTER",							
		originY	 	= "CENTER",							
		textFlow 	= "CENTER",	
		charSpacing = -5,
		lineSpacing = -4,
		wrapWidth	= 300, 								
		--showOrigin 	= true,								
		})
	btnGroup:insert(s)
	btnGroup:insert(MyText)
	if(xpos) then
		--MyText.x = xpos + (MyText.width/2)
		MyText.x = ((s.width - 60)*.5)+60
	end


	return btnGroup
end

function createFBBtn(label,xpos,installed)
	local btnGroup = display.newGroup()
	--if(installed) then
		--local s = display.newImage(fPath.."buttonInstalled.png")
	--else 
		local s = display.newImage(fPath.."button.png")
	--end
	print(label)
	local MyText = TextCandy.CreateText({
		fontName 	= "ICEBREAKER", 						
		x		 	= (s.width *.5),						
		y		 	= s.height*.5,						
		text	 	= label,	
		originX	 	= "CENTER",							
		originY	 	= "CENTER",							
		textFlow 	= "CENTER",	
		charSpacing = -5,
		lineSpacing = -4,
		wrapWidth	= 300, 								
		--showOrigin 	= true,								
		})
	btnGroup:insert(s)
	btnGroup:insert(MyText)
	if(xpos) then
		--MyText.x = xpos + (MyText.width/2)
		MyText.x = ((s.width - 60)*.5)+60
	end


	return btnGroup
end




if http.request( "http://www.google.com" ) == nil then
		connectionFalse = true
        native.showAlert( "Alert", "An internet connection is required to use this application.", { "Exit" }, onCloseApp )
end

function showAd(event)
	-- Is the url a remote call?
	if string.find(event.url, "http://", 1, false) == 1 then
		-- Is it a call to the admob server?
		if string.find(event.url, "c.admob.com", 1, false) == nil then
			adSpace.url = event.url
		else
			-- an actual click on an ad, so open in Safari
			system.openURL(event.url)
		end
	else
		print("loading an ad")
		return true
	end
end



function onKeyEvent( event )
	if event.keyName == "back" then
		if event.phase == "up" then
			if director:getCurrScene() ~= "registerdroid" then
				if director:getCurrScene() == "desktop" then
					native.showAlert( "Alert", "Are you sure you want to exit?", {"Exit","Cancel"}, onCloseApp )
				else 
					native.showAlert( "Alert", "Are you sure you want to exit?", {"Go Home","Cancel"}, onGoHome )
				end	
			end
			return true
		end
	else
	
	return false
	
	end
	
end





------------------------------------------------------------------------
--
--
--FACEBOOK CRAP
--
--
------------------------------------------------------------------------
--===================================================================================
--
--
--===================================================================================
	
	function onSystem( event )
		if event.type == "applicationSuspend" then
			
			audio.pause()
		
		elseif event.type == "applicationResume" then		
			audio.resume()
		elseif event.type == "applicationExit" then
			if system.getInfo( "environment" ) == "device" then
				-- prevents iOS 4+ multi-tasking crashes
				os.exit()
			end
		end
	end
	

-----------------------------------------------------------------
---- FACEBOOK APPID
------------------------------------------------------------------


---------------------------------------------------------------
-- Main function
---------------------------------------------------------------

local function main()
	display.setStatusBar( display.HiddenStatusBar )	
	Runtime:addEventListener( "system", onSystem )
	
	-----------------------------------
	-- Add the group from director class
	-----------------------------------
	
	mainGroup:insert(director.directorView)

	-----------------------------------
	-- Change scene without effects
	-----------------------------------


	local registered = false
	for row in db:nrows("SELECT * FROM user") do
		registered = true
		player = row
	end

	if (registered == false) then
		--director:openPopUp("register")
		director:changeScene("register","fade")
	else 
		director:changeScene("desktop","fade")
	end

	
	
	-----------------------------------
	-- Return
	-----------------------------------
	
	return true
end

---------------------------------------------------------------
-- Begin
---------------------------------------------------------------

main()

-- It's that easy! :-)