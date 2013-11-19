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

--import the external scrolling classes
local scrollView = require("scrollView")
 
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



-- controls program flow --
local curGameFunction = nil
-----------------------------------
-- FUNCTIONS
-----------------------------------







local instructions = nil
 
local mainGroup = display.newGroup()




---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------
local background = display.newImage(fPath.."background.png")
--local background = display.newRect(0, 0, screenW, screenH)




local yourGroup = display.newGroup()

local rowoptions = {}

local function createGame(event)
	
	event.target:removeEventListener("touch",createGame)
	setOption( "popuptype", event.target.type, "screen" )
	director:openPopUp("popup", "moveFromTop",nil)
	
end

local function createFBGame(event)
	--setOption( "popuptype", event.target.type, "screen" )
	director:changeScene("fbinvite","fade")
end




local function initVars ()

	-----------------------------------
	-- Inserts
	-----------------------------------

	localGroup:insert(background)

	localGroup:insert(scrollView)

	local fbBtn = createBtn("icon_fb_purple.png","FACEBOOK")
	mainGroup:insert(fbBtn)
	fbBtn.x = (screenW /2) - (fbBtn.width/2)
	fbBtn.type = "facebook"
	fbBtn.y = 30
	fbBtn:addEventListener("touch",createGame)

	local rndBtn = createBtn("icon_ranopp_purple.png","RANDOM")
	mainGroup:insert(rndBtn)
	rndBtn.x = (screenW /2) - (rndBtn.width/2)
	rndBtn.y = fbBtn.y + (rndBtn.height)
	rndBtn.type = "random"
	rndBtn:addEventListener("touch",createGame)

	local userBtn = createBtn("icon_usrname_purple.png","USERNAME")
	mainGroup:insert(userBtn)
	userBtn.x = (screenW /2) - (userBtn.width/2)
	userBtn.y = rndBtn.y + (userBtn.height)
	userBtn.type = "username"
	userBtn:addEventListener("touch",createGame)

	local contactBtn = createBtn("icon_contacts_purple.png","CONTACTS")
	mainGroup:insert(contactBtn)
	contactBtn.x = (screenW /2) - (contactBtn.width/2)
	contactBtn.y = userBtn.y + (contactBtn.height)
	contactBtn.type = "email"
	contactBtn:addEventListener("touch",createGame)

	scrollView:insert(mainGroup)

	

	


	

	

	



	
	


	-----------------------------------
	-- Positions
	-----------------------------------


	-----------------------------------
	-- Colors
	-----------------------------------
	
	
	
	-----------------------------------
	-- Listeners
	-----------------------------------


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
	
	-----------------------------------
	-- MUST return a display.newGroup()
	-----------------------------------
	
	return localGroup
	
end