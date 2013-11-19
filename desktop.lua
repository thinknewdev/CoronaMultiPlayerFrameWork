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
 

local function newGameClick ( event )
	--TextCandy.CleanUp() -- CLEAN UP *BEFORE* SWITCHING SCENES!
	event.target:removeEventListener("touch",newGameClick)
	director:changeScene("creategame","moveFromRight")
end


---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------

local background = display.newImage(fPath.."mainbackground.png")

local addBtn = ui.newButton{
	default = fPath.."newgame.png",
	over = fPath.."newgame.png",
	onRelease = newGameClick,
	id = "bt01"
} 
--local background = display.newRect(0, 0, screenW, screenH)
--background:setFillColor(255, 255, 255)



local mainGroup = display.newGroup()

local yourGroup = display.newGroup()

local otherGroup = display.newGroup()

local function continueGame(event)
		event.target:removeEventListener("touch",continueGame)
		setOption( "instanceid", event.target.gameid, "screen" )
		director:closePopUp()
		director:changeScene("game","moveFromRight")
	
end

local function initVars ()

	for row in db:nrows("SELECT * FROM user") do
		registered = true
		player = row
	end
	-----------------------------------
	-- Inserts
	-----------------------------------

	localGroup:insert(background)
	localGroup:insert(scrollView)
	localGroup:insert(addBtn)
	addBtn.x = 320 - 30
	addBtn.y = (addBtn.height/2) + 15
	print("WORKING HERE")

	local createGameBtn = createBtn("icon_avatar_orange.png", "CREATE GAME")
	mainGroup:insert(createGameBtn)
	createGameBtn.x = (screenW /2) - (createGameBtn.width/2)
	createGameBtn.y = 50
	createGameBtn:addEventListener("touch",newGameClick)

	local fbBtn = createBtn("icon_fb_orange.png", "FACEBOOK")
	mainGroup:insert(fbBtn)
	fbBtn.x = (screenW /2) - (fbBtn.width/2)
	fbBtn.y = createGameBtn.y + (fbBtn.height)

	local settingsBtn = createBtn("icon_settings_orange.png", "SETTINGS")
	mainGroup:insert(settingsBtn)
	settingsBtn.x = (screenW /2) - (settingsBtn.width/2)
	settingsBtn.y = fbBtn.y + (settingsBtn.height)

	
	--native.showAlert( "Alert",  myappid, { "Try Again" }, nil )
	network.request("http://thinknewgames.com/gameapi/getgames.php?gameid="..myappid.."&playerid="..player.databaseid.."&js=true", "GET", function(event)
		
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		pprint("FRIEND",t)

		local data = t.games.game
		pprint("FRIEND",data)
		print(#data)
		if #data > 0 then
			for i=1,#data do
				local game = data[i]
				
				
		        pprint("FRIEND",game)
		        local gameBtn = createBtn("icon_settings_orange.png", "GAME "..game.gameid)
				mainGroup:insert(gameBtn)
				gameBtn.x = (screenW /2) - (gameBtn.width/2)
				gameBtn.y = settingsBtn.y + (gameBtn.height * i)
				gameBtn.gameid = game.gameid
				
				--playeravatar.y = 85 * count
				--count = count + 1
	         

				gameBtn:addEventListener("touch",continueGame)
			end	
        else
			local gameBtn = createBtn("icon_settings_orange.png", "GAME "..data.gameid)
			mainGroup:insert(gameBtn)
			gameBtn.x = (screenW /2) - (gameBtn.width/2)
			gameBtn.y = settingsBtn.y + (gameBtn.height)
			gameBtn.gameid = data.gameid
			
			--playeravatar.y = 85 * count
			--count = count + 1
      

			gameBtn:addEventListener("touch",continueGame)
        end

        scrollView:insert(mainGroup)
	end)

	
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