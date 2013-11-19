module(...)


-- This file is for use with Corona Game Edition
--
-- The function getSpriteSheetData() returns a table suitable for importing using sprite.newSpriteSheetFromData()
--
-- Usage example:
--			local zwoptexData = require "ThisFile.lua"
-- 			local data = zwoptexData.getSpriteSheetData()
--			local spriteSheet = sprite.newSpriteSheetFromData( "Untitled.png", data )
--
-- For more details, see http://developer.anscamobile.com/content/game-edition-sprite-sheets

function getSpriteSheetData()

	local sheet = {
		frames = {
		
			{
				name = "0.png",
				spriteColorRect = { x = 0, y = 0, width = 35, height = 39 }, 
				textureRect = { x = 62, y = 188, width = 35, height = 39 }, 
				spriteSourceSize = { width = 35, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "1.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 39 }, 
				textureRect = { x = 185, y = 125, width = 24, height = 39 }, 
				spriteSourceSize = { width = 24, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "2.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 99, y = 175, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "3.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 110, y = 44, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "4.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 38 }, 
				textureRect = { x = 239, y = 165, width = 34, height = 38 }, 
				spriteSourceSize = { width = 34, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "5.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 139, y = 2, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "6.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 39 }, 
				textureRect = { x = 159, y = 208, width = 33, height = 39 }, 
				spriteSourceSize = { width = 33, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "7.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 38 }, 
				textureRect = { x = 214, y = 43, width = 34, height = 38 }, 
				spriteSourceSize = { width = 34, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "8.png",
				spriteColorRect = { x = 0, y = 0, width = 36, height = 39 }, 
				textureRect = { x = 72, y = 93, width = 36, height = 39 }, 
				spriteSourceSize = { width = 36, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "9.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 110, y = 85, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "A.png",
				spriteColorRect = { x = 0, y = 0, width = 38, height = 38 }, 
				textureRect = { x = 199, y = 166, width = 38, height = 38 }, 
				spriteSourceSize = { width = 38, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ä.png",
				spriteColorRect = { x = 0, y = 0, width = 38, height = 47 }, 
				textureRect = { x = 62, y = 2, width = 38, height = 47 }, 
				spriteSourceSize = { width = 38, height = 47 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "B.png",
				spriteColorRect = { x = 8, y = 0, width = 35, height = 39 }, 
				textureRect = { x = 78, y = 134, width = 35, height = 39 }, 
				spriteSourceSize = { width = 43, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "C.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 39 }, 
				textureRect = { x = 146, y = 43, width = 33, height = 39 }, 
				spriteSourceSize = { width = 33, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "D.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 115, y = 126, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "E.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 39 }, 
				textureRect = { x = 146, y = 84, width = 32, height = 39 }, 
				spriteSourceSize = { width = 32, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "F.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 38 }, 
				textureRect = { x = 250, y = 122, width = 32, height = 38 }, 
				spriteSourceSize = { width = 32, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "G.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 39 }, 
				textureRect = { x = 151, y = 125, width = 32, height = 39 }, 
				spriteSourceSize = { width = 32, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "H.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 38 }, 
				textureRect = { x = 242, y = 2, width = 34, height = 38 }, 
				spriteSourceSize = { width = 34, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "I.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 38 }, 
				textureRect = { x = 285, y = 82, width = 18, height = 38 }, 
				spriteSourceSize = { width = 18, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "J.png",
				spriteColorRect = { x = 0, y = 0, width = 30, height = 39 }, 
				textureRect = { x = 210, y = 2, width = 30, height = 39 }, 
				spriteSourceSize = { width = 30, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "K.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 38 }, 
				textureRect = { x = 278, y = 2, width = 33, height = 38 }, 
				spriteSourceSize = { width = 33, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "L.png",
				spriteColorRect = { x = 0, y = 0, width = 26, height = 39 }, 
				textureRect = { x = 171, y = 166, width = 26, height = 39 }, 
				spriteSourceSize = { width = 26, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "M.png",
				spriteColorRect = { x = 0, y = 0, width = 40, height = 38 }, 
				textureRect = { x = 194, y = 207, width = 40, height = 38 }, 
				spriteSourceSize = { width = 40, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "N.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 38 }, 
				textureRect = { x = 214, y = 83, width = 34, height = 38 }, 
				spriteSourceSize = { width = 34, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "O.png",
				spriteColorRect = { x = 0, y = 0, width = 41, height = 41 }, 
				textureRect = { x = 29, y = 104, width = 41, height = 41 }, 
				spriteSourceSize = { width = 41, height = 41 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ö.png",
				spriteColorRect = { x = 0, y = 0, width = 40, height = 48 }, 
				textureRect = { x = 24, y = 54, width = 40, height = 48 }, 
				spriteSourceSize = { width = 40, height = 48 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "P.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 39 }, 
				textureRect = { x = 180, y = 84, width = 32, height = 39 }, 
				spriteSourceSize = { width = 32, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Q.png",
				spriteColorRect = { x = 0, y = 0, width = 42, height = 40 }, 
				textureRect = { x = 66, y = 51, width = 42, height = 40 }, 
				spriteSourceSize = { width = 42, height = 40 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "R.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 39 }, 
				textureRect = { x = 175, y = 2, width = 33, height = 39 }, 
				spriteSourceSize = { width = 33, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "S.png",
				spriteColorRect = { x = 0, y = 0, width = 31, height = 39 }, 
				textureRect = { x = 181, y = 43, width = 31, height = 39 }, 
				spriteSourceSize = { width = 31, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "T.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 38 }, 
				textureRect = { x = 250, y = 82, width = 33, height = 38 }, 
				spriteSourceSize = { width = 33, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "U.png",
				spriteColorRect = { x = 0, y = 0, width = 35, height = 40 }, 
				textureRect = { x = 102, y = 2, width = 35, height = 40 }, 
				spriteSourceSize = { width = 35, height = 40 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ü.png",
				spriteColorRect = { x = 0, y = 0, width = 35, height = 48 }, 
				textureRect = { x = 25, y = 2, width = 35, height = 48 }, 
				spriteSourceSize = { width = 35, height = 48 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "V.png",
				spriteColorRect = { x = 0, y = 0, width = 37, height = 38 }, 
				textureRect = { x = 211, y = 125, width = 37, height = 38 }, 
				spriteSourceSize = { width = 37, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "W.png",
				spriteColorRect = { x = 0, y = 0, width = 48, height = 38 }, 
				textureRect = { x = 109, y = 216, width = 48, height = 38 }, 
				spriteSourceSize = { width = 48, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "X.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 38 }, 
				textureRect = { x = 275, y = 162, width = 32, height = 38 }, 
				spriteSourceSize = { width = 32, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Y.png",
				spriteColorRect = { x = 0, y = 0, width = 32, height = 38 }, 
				textureRect = { x = 284, y = 122, width = 32, height = 38 }, 
				spriteSourceSize = { width = 32, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Z.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 39 }, 
				textureRect = { x = 135, y = 167, width = 34, height = 39 }, 
				spriteSourceSize = { width = 34, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "apostroph.png",
				spriteColorRect = { x = 0, y = 0, width = 16, height = 21 }, 
				textureRect = { x = 91, y = 229, width = 16, height = 21 }, 
				spriteSourceSize = { width = 16, height = 21 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "asterisk.png",
				spriteColorRect = { x = 0, y = 0, width = 27, height = 23 }, 
				textureRect = { x = 62, y = 229, width = 27, height = 23 }, 
				spriteSourceSize = { width = 27, height = 23 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "at.png",
				spriteColorRect = { x = 0, y = 0, width = 38, height = 39 }, 
				textureRect = { x = 22, y = 203, width = 38, height = 39 }, 
				spriteSourceSize = { width = 38, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "bracket_left.png",
				spriteColorRect = { x = 0, y = 0, width = 20, height = 50 }, 
				textureRect = { x = 2, y = 54, width = 20, height = 50 }, 
				spriteSourceSize = { width = 20, height = 50 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "bracket_right.png",
				spriteColorRect = { x = 0, y = 0, width = 21, height = 50 }, 
				textureRect = { x = 2, y = 2, width = 21, height = 50 }, 
				spriteSourceSize = { width = 21, height = 50 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "colon.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 33 }, 
				textureRect = { x = 305, y = 82, width = 18, height = 33 }, 
				spriteSourceSize = { width = 18, height = 33 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "comma.png",
				spriteColorRect = { x = 0, y = 0, width = 16, height = 21 }, 
				textureRect = { x = 313, y = 2, width = 16, height = 21 }, 
				spriteSourceSize = { width = 16, height = 21 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dollar.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 44 }, 
				textureRect = { x = 2, y = 157, width = 34, height = 44 }, 
				spriteSourceSize = { width = 34, height = 44 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dot.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 16 }, 
				textureRect = { x = 364, y = 2, width = 18, height = 16 }, 
				spriteSourceSize = { width = 18, height = 16 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "exclam.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 38 }, 
				textureRect = { x = 286, y = 42, width = 18, height = 38 }, 
				spriteSourceSize = { width = 18, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "minus.png",
				spriteColorRect = { x = 0, y = 0, width = 31, height = 18 }, 
				textureRect = { x = 331, y = 2, width = 31, height = 18 }, 
				spriteSourceSize = { width = 31, height = 18 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "percent.png",
				spriteColorRect = { x = 0, y = 0, width = 38, height = 39 }, 
				textureRect = { x = 38, y = 147, width = 38, height = 39 }, 
				spriteSourceSize = { width = 38, height = 39 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "plus.png",
				spriteColorRect = { x = 0, y = 0, width = 31, height = 30 }, 
				textureRect = { x = 306, y = 42, width = 31, height = 30 }, 
				spriteSourceSize = { width = 31, height = 30 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "question.png",
				spriteColorRect = { x = 0, y = 0, width = 34, height = 38 }, 
				textureRect = { x = 250, y = 42, width = 34, height = 38 }, 
				spriteSourceSize = { width = 34, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "semicolon.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 40 }, 
				textureRect = { x = 2, y = 203, width = 18, height = 40 }, 
				spriteSourceSize = { width = 18, height = 40 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "sharp.png",
				spriteColorRect = { x = 0, y = 0, width = 37, height = 38 }, 
				textureRect = { x = 236, y = 206, width = 37, height = 38 }, 
				spriteSourceSize = { width = 37, height = 38 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "slash.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 49 }, 
				textureRect = { x = 2, y = 106, width = 25, height = 49 }, 
				spriteSourceSize = { width = 25, height = 49 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "underscore.png",
				spriteColorRect = { x = 0, y = 0, width = 40, height = 17 }, 
				textureRect = { x = 331, y = 22, width = 40, height = 17 }, 
				spriteSourceSize = { width = 40, height = 17 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
		}
	}

	return sheet
end