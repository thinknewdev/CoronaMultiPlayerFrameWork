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

local height = display.contentHeight
local width = display.contentWidth
local gametimer

---------------------------------------------------------------
-- GROUPS
---------------------------------------------------------------

local localGroup = display.newGroup()

---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------

--local background = display.newImageRect("images/background2.png")
local splash = display.newImageRect(assetPath .."logo_splash.png",320,480)



---------------------------------------------------------------
-- LISTENERS
---------------------------------------------------------------
local function touched ( event )
	--if event.phase == "ended" then
		timer.cancel(gametimer)
		director:changeScene("titlescreen","fade")
	--end
end


---------------------------------------------------------------
-- INIT VARS
---------------------------------------------------------------

local function initVars ()

	-----------------------------------
	-- Inserts
	-----------------------------------
	if gameNetwork then
		if ( of_product_key and of_product_secret ) then
			gameNetwork.init("openfeint", of_product_key, of_product_secret, "Android Overkill", of_app_id )
		else
			local function onComplete( event )
				system.openURL( "http://www.openfeint.com/developers" )
			end
			native.showAlert( "OpenFeint Init Failed", "To use OpenFeint in your game, you need to get a product key and product secret. This can be done on the OpenFeint website.", { "Learn More" }, onComplete )
		end
	else
		native.showAlert( "OpenFeint Init Failed", "This feature is currently supported on iOS only. To test OpenFeint, create a build for an iOS device or the Xcode Simulator.", { "OK" } )
	end

	localGroup:insert(splash)
	
	-----------------------------------
	-- Positions
	-----------------------------------
	print(splash.width)
	splash.x = width/2
	splash.y = height/2
	

	-----------------------------------
	-- Colors
	-----------------------------------
	
	--title:setTextColor( 255,255,255)
	--savedb:setTextColor( 255,255,255)
	
	-----------------------------------
	-- Listeners
	-----------------------------------
	
	--splash:addEventListener( "touch" , touched )
	if connectionFalse == nil then
		gametimer = timer.performWithDelay(4000, touched )
	end
	
	
end

---------------------------------------------------------------
-- CLEAN
---------------------------------------------------------------

function clean ( event )
	print("2 cleaned")
	timer.cancel(gametimer)
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
