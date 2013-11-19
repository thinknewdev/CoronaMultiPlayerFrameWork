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

local localGroup = display.newGroup()
--local gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1, fadein=5000 }  )
local registerBtn = {}

-----------------------------------
-- FUNCTIONS
-----------------------------------


local function touched ( event )
	if event.phase == "release" then
		director:changeScene("game","fade")
	end
end

---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------

--local background = display.newImageRect("images/background2.png")
local background = display.newImageRect(assetPath .."titlescreen.jpg",320,480)


local function initVars ()

	-----------------------------------
	-- Inserts
	-----------------------------------

	localGroup:insert(background)

	-----------------------------------
	-- Positions
	-----------------------------------

	background.x = 160
	background.y = 240
	registerBtn = ui.newButton{
				default = assetPath .."playBtn.png",
				over = assetPath .."playBtnDown.png",
				onEvent = touched,
				id = "regBtn"
	}
	registerBtn.x = 160
	registerBtn.y = 380
	localGroup:insert(registerBtn)
	-----------------------------------
	-- Colors
	-----------------------------------
	
	--savedb:setTextColor( 255,255,255)
	
	-----------------------------------
	-- Listeners
	-----------------------------------
	--background:addEventListener( "touch" , touched )
	--registerBtn:addEventListener( "touch" , registerPlayer )
	-- for row in db:nrows("SELECT * FROM user") do
	  -- print(row.username)
	  -- print(row.facebookid)
	  -- print(row.gold)
	-- end
	
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