--
-- Project: AndroidOverkill
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2011 Adam Coburn. All Rights Reserved.
-- 

--=========================================================
-- Imports
--=========================================================


module(..., package.seeall)

require("pprint")
local pathfinder = require("pathfinder")


local DragMgr = require ( "dmc_dragdrop" )
local Utils = require( "dmc_utils" )


-- object-oriented Drop Target implementation
local DropTarget = require ( "drop_target" )



--====================================================================--
-- Setup, Constants
--====================================================================--

local color_blue = { 25, 100, 255 }
local color_lightblue = { 90, 170, 255 }
local color_green = { 50, 255, 50 }
local color_lightgreen = { 170, 225, 170 }
local color_red = { 255, 50, 50 }
local color_lightred = { 255, 120, 120 }
local color_grey = { 180, 180, 180 }
local color_lightgrey = { 200, 200, 200 }

--====================================================================--
-- Variables
--====================================================================--

local localGroup = display.newGroup()
local gridGroup = display.newGroup()
local ranGroup = display.newGroup()
local rackGroup = display.newGroup()
local dropGroup = display.newGroup()

--local gameMusicChannel = audio.play( gameMusic, { channel=1, loops=-1, fadein=5000 }  )

local boxWidth = (screenW - 2) / 11
	
local gridHeight = screenH - 160


local startCell = {col = -1, row = -1}

local endCell = {col = -1, row = -1}

local kLevelRows = 9
local kLevelCols = 9
local kRoadProbability = 4
local level = {}

local yDiff = nil
local xDiff = nil

-- table contains display.newRect objects --
local cells = {}
local dropTargets = {}
local rackTargets = {}

local rackImage = display.newImage(fPath.."rack.png")
local wordRack = display.newImage(fPath.."rack.png")

local tiles_index = {}
local rack_index = {}

local rack_in_play = {}

-- contains text object for user intructions --
local instructions = nil

-- controls program flow --
local curGameFunction = nil

local moveHolder = {}

local playerMove = { 7, 36, 41, 56}

local playerTurn = mydevice
local playerChecking = {}








print(table.maxn(letters))

local scrabbleBoard = {}
local datahold = {}
local datatemp = {}



local instanceid = getOption("instanceid", "screen")


--== Support Items ==--

-- createSquare()
--
-- function to help create shapes, useful for drag/drop target examples
--
local function createSquare(size, color )

	s = display.newRect(0,0, unpack( size ) )
	s.strokeWidth = 3
	s:setFillColor( unpack( color ) )
	s:setStrokeColor( unpack( color_grey ) )

	return s
end



local function checkSides()
	
		
    for i = 1, i < #tiles_in_play, 1 do
        local exposed = 0
        datatemp = tiles_in_play[i]

        -- up
        if cells[datatemp.cellx][datatemp.celly-1] ~= nil then
                if cells[datatemp.cellx][datatemp.celly-1].alpha == 0 then
                        exposed = exposed + 1
                end
        end

        -- down
        if cells[datatemp.cellx][datatemp.celly+1] ~= nil then
                if cells[datatemp.cellx][datatemp.celly+1].alpha == 0 then
                        exposed = exposed + 1
                end
        end


        -- left

        if cells[datatemp.cellx-1][datatemp.celly] ~= nil then
                if cells[datatemp.cellx-1][datatemp.celly].alpha == 0 then
                        exposed = exposed + 1
                end
        end


        -- right

        if cells[datatemp.cellx+1][datatemp.celly] ~= nil then
                if cells[datatemp.cellx+1][datatemp.celly].alpha == 0 then
                        exposed = exposed + 1
                end
        end

        local function onCheckEnd(event)

        end

        if(exposed > 2) then

             transition.to(target, {time = 500, alpha = 0, onComplete=onCheckEnd})

        end	
    end
end



--==============================================================
-- Setup DROP Target - areas we drag TO
--==============================================================


local theScore =  0
local textScore, updateScore

local dragStartHandler = function( e )

	local o = e.target
	o:setStrokeColor( unpack( color_red ) )

	return true
end
local dragEnterHandler = function( e )

	local o = e.target
	o:setFillColor( unpack( color_lightgreen ) )

	DragMgr:acceptDragDrop()

	return true
end
local dragOverHandler = function( e )

	return true
end

-- have to declare dragExitHandler ahead
-- since dragDropHandler calls it
--
local dragExitHandler

local dragDropHandler = function( e )

    --/theScore = theScore + 1
	--updateScore()
	local o = e.target
	print(DragMgr._registered[e.target].dragId)
	for i = 1, table.maxn(o) do
    	print("this"..o[i])
	end
	datahold[DragMgr._registered[e.target].dragId] = datatemp
	dragExitHandler( e )

	return true
end
dragExitHandler = function( e )

	local o = e.target
	o:setFillColor( unpack( color_lightblue ) )

	return true
end
local dragStopHandler = function( e )

	local o = e.target
	o:setStrokeColor( unpack( color_grey ) )

	return true
end


updateScore = function()
	local txt = tostring( theScore )
	textScore.text = txt
	textScore.x = 160 ; textScore.y = 200
end

textScore = display.newText( "", 160, 160, native.systemFont, 24 )
textScore:setTextColor( 0, 0, 0, 255 )
textScore:setReferencePoint( display.CenterReferencePoint )

--updateScore()



--==============================================================
-- Setup DRAG Target - areas we drag FROM
--==============================================================


local function dragItemTouchHandler( event )

	local target = event.target

	if event.phase == "began" then

		-- now tell the Drag Manager about it
		
		print("INDEX "..tiles_in_play[table.indexOf(tiles_index,target)].cellx.." || "..tiles_in_play[table.indexOf(tiles_index,target)].celly)
		datatemp = tiles_in_play[table.indexOf(tiles_index,target)]
		DragMgr:doDrag( target, event)
	end

	return true
end

local function dragRackItemTouchHandler( event )

	local target = event.target

	if event.phase == "began" then

		-- now tell the Drag Manager about it
		--rackTargets[i].filled
		--print("INDEX "..rack_in_play[table.indexOf(rack_index,target)].cellx.." || "..rack_in_play[table.indexOf(rack_index,target)].celly)
		datatemp = rack_in_play[table.indexOf(rack_index,target)]
		DragMgr:doDrag( target, event)
	end

	return true
end




local function createRandomLetters()

	for i = 1, #rackTargets, 1 do
		print(i)
		if(rackTargets[i].filled == nil or rackTargets[i].filled.box.alpha == 0) then
			local gridBox = {
				box    = nil,
				countid     = nil
			}
			local boxGroup = display.newGroup()
			local myRoundedRect = display.newImageRect( "drawables/icecube.png", rackTargets[i].box.width, rackTargets[i].box.height)
			myRoundedRect:setReferencePoint(display.TopLeftReferencePoint);
			myRoundedRect.x = 0
			myRoundedRect.y = 0
			
			local boxletter = TextCandy.CreateText({
				fontName 	= "ICEBREAKER", 						
				x		 	= myRoundedRect.width/2,						
				y		 	= myRoundedRect.height/2,						
				text	 	= letters[math.random(1,#letters)],	
				originX	 	= "CENTER",							
				originY	 	= "CENTER",							
				textFlow 	= "CENTER",	
				charSpacing = -5,
				lineSpacing = -4,
				wrapWidth	= 300, 								
				--showOrigin 	= true,								
				})
			--myRoundedRect:setFillColor(255, 255, 255)
			--myRoundedRect.strokeWidth = 1
			--myRoundedRect:setStrokeColor(255, 255, 255)	

			boxGroup:insert(myRoundedRect)
			boxGroup:insert(boxletter)
			boxletter.x = (myRoundedRect.width/2)
			boxletter.y = (myRoundedRect.height/2)
			boxGroup:setReferencePoint(display.CenterReferencePoint);

			boxGroup:addEventListener( "touch", dragRackItemTouchHandler )
			gridBox.letter = boxletter
			gridBox.box = myRoundedRect
			gridBox.cellx = x
			gridBox.celly = y
			gridBox.countid = countid
			table.insert(rack_in_play, gridBox)
			table.insert(rack_index, boxGroup)	
			
			boxGroup.x = rackTargets[i].box.x
			boxGroup.y = rackTargets[i].box.y


			rackTargets[i].filled = gridBox
			ranGroup:insert(boxGroup)
		end	
		localGroup:insert(ranGroup)
	end 
end


-----------------------------------
-- FUNCTIONS
-----------------------------------

local function loadGrid ()
	
	
	local countid = 1
	
	for x = 0, kLevelCols do
		level[x] = {}
		for y = 0, kLevelRows do
			
			
			
			local probability = math.random(0,10)
            --if probability <= kRoadProbability then
                level[x][y] = 1
            --else
                --level[x][y] = 0
            --end
			
		end
	end	
			
	for x = 0, kLevelCols do
		cells[x] = {}
		for y = 0, kLevelRows do
			
			local gridBox = {
				box    = nil,
				countid     = nil
			}
			local boxGroup = display.newGroup()
			local myRoundedRect = display.newImageRect( "drawables/icecube.png", boxWidth, boxWidth)
			myRoundedRect:setReferencePoint(display.TopLeftReferencePoint);
			myRoundedRect.x = 0
			myRoundedRect.y = 0
			--local boxletter =  display.newText( "F", 0, 0, native.systemFont, 20 )
			local boxletter = TextCandy.CreateText({
				fontName 	= "ICEBREAKER", 						
				x		 	= myRoundedRect.width/2,						
				y		 	= myRoundedRect.height/2,						
				text	 	= "F",	
				originX	 	= "CENTER",							
				originY	 	= "CENTER",							
				textFlow 	= "CENTER",	
				charSpacing = -5,
				lineSpacing = -4,
				wrapWidth	= 300, 								
				--showOrigin 	= true,								
				})

			--myRoundedRect:setFillColor(255, 255, 255)
			--myRoundedRect.strokeWidth = 1
			--myRoundedRect:setStrokeColor(255, 255, 255)	
			boxGroup:addEventListener( "touch", dragItemTouchHandler )
			--myRoundedRect.countid = countid
			gridBox.letter = boxletter
			gridBox.box = myRoundedRect
			gridBox.cellx = x
			gridBox.celly = y
			gridBox.countid = countid
			boxGroup:insert(myRoundedRect)
			boxGroup:insert(boxletter)
			boxletter.x = (myRoundedRect.width/2)
			table.insert(tiles_in_play, gridBox)
			table.insert(tiles_index, boxGroup)				
			gridGroup:insert(boxGroup)
			boxGroup.x = (boxWidth+2)*y
			boxGroup.y = (boxWidth+2)*x
			countid = countid +1
			--if level[x][y] == 0 then
				--myRoundedRect:setFillColor( 0, 0, 255 )  -- blue
			--end
			

			cells[x][y] = boxGroup
		end
	end

	--print2d(level)
	localGroup:insert(gridGroup)



end

local function setLetters()

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
	
	network.request("http://thinknewgames.com/gameapi/getgamedata.php?id="..instanceid.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.instances.gamedata.data)
		fullletters = explode("-",t.instances.gamedata.data)
		playerTurn = t.instances.gamedata.player
		print(table.concat(fullletters, ","))
		--native.showAlert( "Word Check",table.concat(fullletters, ","), { "OK" }, nil )
		--dbgame.createInstance(table.concat(fullletters, "-"))
		for i = 1, table.maxn(tiles_in_play), 1 do
			tiles_in_play[i].letter:setText(fullletters[i])
		end 
		
			
	end)

	continueBoard()
	
		

end 




local instructions = nil
 
-- displays instructions (albeit hard to read) to the user
function displayInstructions(string)
    if instructions ~= nil then
        instructions:removeSelf()
    end
 
    instructions = display.newText(string, 0, 0, native.systemFontBold, 20)
    instructions:setTextColor(0, 0, 0)
end

-- called to select the starting point in the grid --
function onStartCellSelected(event)
	print("START CELL SELECTED")
	print(event.x)
	print(xDiff)
	print(event.x+xDiff)
    local indices = getIndices(event.x+yDiff, event.y+xDiff)
 
    if level[indices[1]][indices[2]] == 0 then
        displayInstructions("Cannot select red. Try again")
    else
        startCell.col = indices[1] - 1
        startCell.row = indices[2] - 1
        --displayInstructions("Select the ending cell")
        cells[indices[2]-1][indices[1]-1]:setFillColor( 51, 204, 0)
        cells[indices[2]-1][indices[1]-1]:setStrokeColor( 51, 204, 0)
		colorCell(cells[indices[2]-1][indices[1]-1], 0, 0, 255)
		gridGroup:insert(cells[indices[2]-1][indices[1]-1])
        --curGameFunction = function(event) onEndCellSelected(event) end
    end
end

-- called to select the ending point in the grid --
function onEndCellSelected(event)
	print("END CELL SELECTED")
	print(event.x)
	print(xDiff)
	print(event.x+xDiff)
    local indices = getIndices(event.x, event.y)
 
    if level[indices[1]][indices[2]] == 0 then
        displayInstructions("Cannot select red. Try again")
    else
        endCell.col = indices[1]
        endCell.row = indices[2]
        colorCell(cels[indices[1]][indices[2]], 0, 0, 255)
        displayInstructions("Touch anywhere to see A* go")
        curGameFunction = function(event) onDetermineAStar(event) end
    end
end

-- called when the demonstration ends (resets the grid) --
function onEnd(event)
--[[
    for x = 0, kLevelCols do
        for y = 0, kLevelRows do
            cells[x][y]:removeSelf()
        end
    end
    
    cells = {}
 
    loadGrid() ]]--
	print("CALLS END")
    displayInstructions("Select the starting cell")
    curGameFunction = function(event) onStartCellSelected(event) end
end

-- called to get the A* algorithm going --
function onDetermineAStar(event)
    displayInstructions("")
 
    -- run A* --
    local path = pathfinder.pathFind(level, kLevelCols, kLevelRows, startCell.col, startCell.row, endCell.col, endCell.row)
    pprint("Path", path)
    
    if path ~= false then
        -- color the path --
        local currentCell = {x=startCell.col, y=startCell.row}
    
        for k = 0, #path do
            local cellDirectionX = path[k].dx
            local cellDirectionY = path[k].dy
            local count = path[k].count
    
            for l = 1, count do
                currentCell.x = currentCell.x + cellDirectionX
                currentCell.y = currentCell.y + cellDirectionY
                if currentCell.x ~= endCell.col or currentCell.y ~= endCell.row then
                    colorCell(cells[currentCell.x][currentCell.y], 255, 255, 0)
                end
            end
        end
        
        curGameFunction = function(event) onEnd(event) end
    else
        displayInstructions("Suitable path not found")
        curGameFunction = function(event) onEnd(event) end
    end
end

-- returns table containing index values based on where a user clicked on the grid --
function getIndices(x, y)
	print(math.floor(x / (boxWidth+13)), math.floor(y / (boxWidth+13)))
    return {math.floor(x / (boxWidth+13)), math.floor(y / (boxWidth+13))}
end

-- gets the display.newRect object based on x,y value --
function getCell(x, y)
    local indices = getIndices(x+xDiff, y+yDiff)
    return cells[indices[1]][indices[2]]
end

-- colors a cell on the grid --
function colorCell(cell, red, green, blue)
    cell:setFillColor(red, green, blue)
end

-- displays instructions (albeit hard to read) to the user
function displayInstructions(string)
    if instructions ~= nil then
        instructions:removeSelf()
    end

    instructions = display.newText(string, 0, 0, native.systemFontBold, 20)
    instructions:setTextColor(0, 0, 0)
end

-- Touch handler. Delegates call to current selected game function --
function onBoardTouched(event)
    if event.phase == "began" then
        curGameFunction(event)
    end
end

function runPlayerMove(event)
	print("works")
	local word = ""
	for k = 1, (#playerMove) do
		tiles_index[tonumber(playerMove[k])].alpha = 0
	end
	print(word)
end

function clearWordGood()
	print(#datahold)
	for i = 1, (#datahold) do
    	--print("this"..datahold[i])
    	--print(datahold[i].cellx.." || "..datahold[i].celly)
    	local thisp = DragMgr._registered[dropTargets[i].box].proxy.proxy
    	local thiso = DragMgr._registered[dropTargets[i].box].proxy.origin
    	print("ALPHA "..DragMgr._registered[dropTargets[i].box].proxy.origin.alpha)
    	
    	local params = params or {}
		local default_transition_time = 600
		local fDelete, doFunc

		local drag_proxy = thisp

		-- create final removal
		fDelete = function( e )
			local dt = drag_proxy
			dt:removeSelf()
		end

		-- move and/or shrink the object

		local p = {}
		p.onComplete = fDelete
		p.time = default_transition_time
		if params.resize then
			p.width = 10 ; p.height = 10
		end

		transition.to( thisp, p )
		
    	--cells[datahold[i].cellx][datahold[i].celly].alpha = 1;
	end
	datahold = nil
	datahold = {}
	checkSides()
	--runPlayerMove()
end
function continueBoard()
	network.request("http://thinknewgames.com/gameapi/continueboard.php?id="..instanceid.."&device="..mydevice.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.words.message)
		if(t.words.message  == "success") then
			print(t.words.lastdevice)
			

			local allmoves = t.words.word
			print("MOVES"..#allmoves)
			for i = 1, (#allmoves) do
				local maindata = explode("|",allmoves[i].data)
				print(maindata[2])
				playerMove = explode("-",maindata[2])
				print(#playerMove)
				--print(explode("-",maindata[2]))
				runPlayerMove()
			end

			if t.words.lastplayer then
				if(t.words.lastplayer ~= player.databaseid) then
					
					playerTurn = player.databaseid
				else 
					playerTurn = "Waiting"
				end
			end

			print(playerTurn)
			playerChecking = timer.performWithDelay(6000, checkTurn,0)
		end	
	end)
end

function checkTurn()
	network.request("http://thinknewgames.com/gameapi/checkmove.php?id="..instanceid.."&device="..mydevice.."&js=true", "GET", function(event)
		print ( "RESPONSE: " .. event.response )
		local t = json.Decode(event.response)
		print("RESPONSE ACTION: " .. t.words.word.message)
		if(t.words.word.message  == "success") then
			print(t.words.word.device)
			if(t.words.word.player) then
				if(t.words.word.player ~= player.databaseid) then
					local maindata = explode("|",t.words.word.data)
					print(maindata[2])
					playerMove = explode("-",maindata[2])
					print(#playerMove)
					--print(explode("-",maindata[2]))
					runPlayerMove()
					playerTurn = player.databaseid
					timer.cancel( playerChecking )
				else 


					playerTurn = "Waiting"
				end
			end
			print(playerTurn)
		end	
	end)
end
function tryWord(event)
	print("works")
	local word = ""
	if(playerTurn == player.databaseid) then
            local picktiles = {}
            for k = 1, (#datahold) do
                    print(datahold[k].letter.text)
                    word = word .. datahold[k].letter.text;
                    table.insert(picktiles,datahold[k].countid)
            end
            print(word)
            print(table.concat(picktiles,"-"))
            network.request("http://thinknewgames.com/gameapi/checkword.php?id="..instanceid.."&word="..word.."&js=true", "GET", function(event)
                    print ( "RESPONSE: " .. event.response )
                    local t = json.Decode(event.response)
                    print("RESPONSE ACTION: " .. t.words.word.message)
                    if(t.words.word.message == "fail") then
                        local alert = native.showAlert( "Word Check", t.words.word.message, 
                                        { "OK" }, nil )

                    else 

                        dbgame.sendMove(word,table.concat(picktiles,"-"),instanceid)
                        clearWordGood()
                        createRandomLetters()
                        playerTurn = "Waiting"
                        playerChecking = timer.performWithDelay(6000, checkTurn,0)
                        checkSides();
                    end

            end)

    else
        local alert = native.showAlert( "Wrong Turn", "It Is Not Your Turn!", 
                                { "OK" }, nil )
    end
	
end


function clearWord(event)
	print(#datahold)
	for i = 1, (#datahold) do
    	--print("this"..datahold[i])
    	--print(datahold[i].cellx.." || "..datahold[i].celly)
    	local thisp = DragMgr._registered[dropTargets[i].box].proxy.proxy
    	local thiso = DragMgr._registered[dropTargets[i].box].proxy.origin
    	print("ALPHA "..DragMgr._registered[dropTargets[i].box].proxy.origin.alpha)
    	thiso.alpha = 1
    	local params = params or {}
		local default_transition_time = 600
		local fDelete, doFunc

		local drag_proxy = thisp

		-- create final removal
		fDelete = function( e )
			local dt = drag_proxy
			dt:removeSelf()
		end

		-- move and/or shrink the object

		local p = {}
		p.onComplete = fDelete
		p.time = default_transition_time
		p.x = thiso.x
		p.y = thiso.y
		if params.resize then
			p.width = 10 ; p.height = 10
		end

		transition.to( thisp, p )
		
    	--cells[datahold[i].cellx][datahold[i].celly].alpha = 1;
	end
	datahold = nil
	datahold = {}
	--runPlayerMove()
end

local playBtn = ui.newButton{
	default = assetPath.."play.png",
	over = assetPath.."play.png",
	onRelease = tryWord,
	id = "bt01"
} 

local refreshBtn = ui.newButton{
	default = assetPath.."refresh.png",
	over = assetPath.."refresh.png",
	onRelease = clearWord,
	id = "bt01"
} 

---------------------------------------------------------------
-- DISPLAY OBJECTS
---------------------------------------------------------------

--local background = display.newImageRect("images/background2.png")
local background = display.newImage(fPath.."background.png")
background:setFillColor(255, 255, 255)


local function initVars ()

	for i = 1, 7, 1 do
		dropTargets[i] = {}
		dropTargets[i].box = createSquare( { 31, 31 }, color_lightblue )
		dropTargets[i].box.alpha = 0
		dropTargets[i].manid  = i
		dropTargets[i].box.x =(45*(i-1)) + (48/2); dropTargets[i].box.y = 370
		DragMgr:register( dropTargets[i], {
			dragStart=dragStartHandler,
			dragEnter=dragEnterHandler,
			dragOver=dragOverHandler,
			dragDrop=dragDropHandler,
			dragExit=dragExitHandler,
			dragStop=dragStopHandler,
			dragId=i,
		})

		dropGroup:insert(dropTargets[i].box)
	end


	for i = 1, 7, 1 do
		rackTargets[i] = {}
		rackTargets[i].box = createSquare( { 31, 31 }, color_lightblue )
		rackTargets[i].manid  = i;

		rackTargets[i].box.alpha = 0
		rackTargets[i].box.x =(45*(i-1)) + (48/2); rackTargets[i].box.y = 428
		rackGroup:insert(dropTargets[i].box)
		--[[
		DragMgr:register( rackTargets[i], {
			dragStart=dragStartHandler,
			dragEnter=dragEnterHandler,
			dragOver=dragOverHandler,
			dragDrop=dragDropHandler,
			dragExit=dragExitHandler,
			dragStop=dragStopHandler,
			dragId=i,
		}) ]]--
	end 

	
	-----------------------------------
	-- Inserts
	-----------------------------------

	localGroup:insert(background)

	rackImage.y = screenH - ((rackImage.height/2) + 25)
	localGroup:insert(rackImage)
	rackImage.x = (screenW/2)


	wordRack.y = screenH - ((wordRack.height/2) + 25) - rackImage.height
	localGroup:insert(wordRack)
	wordRack.x = (screenW/2)

	curGameFunction = function(event) onStartCellSelected(event) end
	loadGrid()
	setLetters()
	local bar = display.newImage(fPath.."bar.png")
	localGroup:insert(bar)
	bar.height = 25
	bar.y = screenH - (bar.height/2)

	localGroup:insert(playBtn)
	playBtn.y = screenH - (bar.height/2)
	playBtn.x = screenW - 100

	localGroup:insert(refreshBtn)
	refreshBtn.y = screenH - (bar.height/2)
	refreshBtn.x = screenW - 50
	displayInstructions("Select the starting cell")
	--Runtime:addEventListener("touch", onBoardTouched)
	
	--loadGrid()
	
	--local path = pathfinder.pathFind(level, kLevelCols, kLevelRows, startCell.col, startCell.row, endCell.col, endCell.row)

	
	gridGroup.x = (screenW/2) - (gridGroup.width/2)
	gridGroup.y = 30
	
	yDiff = (30 + 2)
	xDiff = (gridGroup.x + 2)
	localGroup:insert(dropGroup)
	localGroup:insert(rackGroup)
	

	--[[
	localGroup:insert(gridGroup)
	local myRoundedRect = display.newRoundedRect(50, 50, boxWidth, boxWidth, 10)
	myRoundedRect.strokeWidth = 1
	myRoundedRect:setFillColor(153, 153, 153)	
	myRoundedRect:setStrokeColor(153, 153, 153)
	gridGroup:insert(myRoundedRect)
	--]]
	
	

	-----------------------------------
	-- Positions
	-----------------------------------


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
	createRandomLetters()
	
	
	-----------------------------------
	-- MUST return a display.newGroup()
	-----------------------------------
	
	return localGroup
	
end