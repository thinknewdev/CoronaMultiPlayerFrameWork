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
				spriteColorRect = { x = 0, y = 0, width = 29, height = 28 }, 
				textureRect = { x = 90, y = 99, width = 29, height = 28 }, 
				spriteSourceSize = { width = 29, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "1.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 28 }, 
				textureRect = { x = 109, y = 152, width = 18, height = 28 }, 
				spriteSourceSize = { width = 18, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "2.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 28 }, 
				textureRect = { x = 150, y = 2, width = 24, height = 28 }, 
				spriteSourceSize = { width = 24, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "3.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 172, y = 122, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "4.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 59, y = 129, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "5.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 197, y = 122, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "6.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 28 }, 
				textureRect = { x = 93, y = 64, width = 25, height = 28 }, 
				spriteSourceSize = { width = 25, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "7.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 28 }, 
				textureRect = { x = 150, y = 32, width = 24, height = 28 }, 
				spriteSourceSize = { width = 24, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "8.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 28 }, 
				textureRect = { x = 93, y = 34, width = 25, height = 28 }, 
				spriteSourceSize = { width = 25, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "9.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 28 }, 
				textureRect = { x = 120, y = 62, width = 25, height = 28 }, 
				spriteSourceSize = { width = 25, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "A.png",
				spriteColorRect = { x = 0, y = 0, width = 30, height = 28 }, 
				textureRect = { x = 2, y = 101, width = 30, height = 28 }, 
				spriteSourceSize = { width = 30, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ä.png",
				spriteColorRect = { x = 0, y = 0, width = 29, height = 35 }, 
				textureRect = { x = 2, y = 2, width = 29, height = 35 }, 
				spriteSourceSize = { width = 29, height = 35 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "B.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 28 }, 
				textureRect = { x = 147, y = 62, width = 25, height = 28 }, 
				spriteSourceSize = { width = 25, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "C.png",
				spriteColorRect = { x = 0, y = 0, width = 28, height = 28 }, 
				textureRect = { x = 120, y = 32, width = 28, height = 28 }, 
				spriteSourceSize = { width = 28, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "D.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 28 }, 
				textureRect = { x = 33, y = 136, width = 24, height = 28 }, 
				spriteSourceSize = { width = 24, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "E.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 34, y = 106, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "F.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 221, y = 92, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "G.png",
				spriteColorRect = { x = 0, y = 0, width = 29, height = 30 }, 
				textureRect = { x = 89, y = 2, width = 29, height = 30 }, 
				spriteSourceSize = { width = 29, height = 30 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "H.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 174, y = 62, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "I.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 28 }, 
				textureRect = { x = 64, y = 159, width = 14, height = 28 }, 
				spriteSourceSize = { width = 14, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "J.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 199, y = 62, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "K.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 225, y = 2, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "L.png",
				spriteColorRect = { x = 0, y = 0, width = 20, height = 28 }, 
				textureRect = { x = 223, y = 62, width = 20, height = 28 }, 
				spriteSourceSize = { width = 20, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "M.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 28 }, 
				textureRect = { x = 58, y = 69, width = 33, height = 28 }, 
				spriteSourceSize = { width = 33, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "N.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 223, y = 32, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "O.png",
				spriteColorRect = { x = 0, y = 0, width = 30, height = 28 }, 
				textureRect = { x = 2, y = 71, width = 30, height = 28 }, 
				spriteSourceSize = { width = 30, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ö.png",
				spriteColorRect = { x = 0, y = 0, width = 28, height = 35 }, 
				textureRect = { x = 33, y = 2, width = 28, height = 35 }, 
				spriteSourceSize = { width = 28, height = 35 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "P.png",
				spriteColorRect = { x = 0, y = 0, width = 25, height = 28 }, 
				textureRect = { x = 121, y = 92, width = 25, height = 28 }, 
				spriteSourceSize = { width = 25, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Q.png",
				spriteColorRect = { x = 0, y = 0, width = 30, height = 30 }, 
				textureRect = { x = 2, y = 39, width = 30, height = 30 }, 
				spriteSourceSize = { width = 30, height = 30 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "R.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 28 }, 
				textureRect = { x = 121, y = 122, width = 24, height = 28 }, 
				spriteSourceSize = { width = 24, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "S.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 28 }, 
				textureRect = { x = 2, y = 161, width = 24, height = 28 }, 
				spriteSourceSize = { width = 24, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "T.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 176, y = 32, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "U.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 201, y = 2, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Ü.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 35 }, 
				textureRect = { x = 34, y = 39, width = 22, height = 35 }, 
				spriteSourceSize = { width = 22, height = 35 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "V.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 148, y = 92, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "W.png",
				spriteColorRect = { x = 0, y = 0, width = 33, height = 28 }, 
				textureRect = { x = 58, y = 39, width = 33, height = 28 }, 
				spriteSourceSize = { width = 33, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "X.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 84, y = 129, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Y.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 173, y = 92, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "Z.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 176, y = 2, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "apostroph.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 15 }, 
				textureRect = { x = 145, y = 152, width = 14, height = 15 }, 
				spriteSourceSize = { width = 14, height = 15 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "asterisk.png",
				spriteColorRect = { x = 0, y = 0, width = 21, height = 21 }, 
				textureRect = { x = 198, y = 92, width = 21, height = 21 }, 
				spriteSourceSize = { width = 21, height = 21 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "at.png",
				spriteColorRect = { x = 0, y = 0, width = 30, height = 28 }, 
				textureRect = { x = 58, y = 99, width = 30, height = 28 }, 
				spriteSourceSize = { width = 30, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "bracket_left.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 28 }, 
				textureRect = { x = 28, y = 166, width = 18, height = 28 }, 
				spriteSourceSize = { width = 18, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "bracket_right.png",
				spriteColorRect = { x = 0, y = 0, width = 19, height = 28 }, 
				textureRect = { x = 222, y = 138, width = 19, height = 28 }, 
				spriteSourceSize = { width = 19, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "colon.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 21 }, 
				textureRect = { x = 129, y = 152, width = 14, height = 21 }, 
				spriteSourceSize = { width = 14, height = 21 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "comma.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 15 }, 
				textureRect = { x = 161, y = 168, width = 14, height = 15 }, 
				spriteSourceSize = { width = 14, height = 15 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dollar.png",
				spriteColorRect = { x = 0, y = 0, width = 24, height = 32 }, 
				textureRect = { x = 63, y = 2, width = 24, height = 32 }, 
				spriteSourceSize = { width = 24, height = 32 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "dot.png",
				spriteColorRect = { x = 0, y = 0, width = 13, height = 13 }, 
				textureRect = { x = 161, y = 152, width = 13, height = 13 }, 
				spriteSourceSize = { width = 13, height = 13 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "exclam.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 28 }, 
				textureRect = { x = 48, y = 166, width = 14, height = 28 }, 
				spriteSourceSize = { width = 14, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "minus.png",
				spriteColorRect = { x = 0, y = 0, width = 18, height = 14 }, 
				textureRect = { x = 2, y = 191, width = 18, height = 14 }, 
				spriteSourceSize = { width = 18, height = 14 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "percent.png",
				spriteColorRect = { x = 0, y = 0, width = 29, height = 28 }, 
				textureRect = { x = 2, y = 131, width = 29, height = 28 }, 
				spriteSourceSize = { width = 29, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "plus.png",
				spriteColorRect = { x = 0, y = 0, width = 20, height = 21 }, 
				textureRect = { x = 201, y = 32, width = 20, height = 21 }, 
				spriteSourceSize = { width = 20, height = 21 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "question.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 28 }, 
				textureRect = { x = 34, y = 76, width = 22, height = 28 }, 
				spriteSourceSize = { width = 22, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "semicolon.png",
				spriteColorRect = { x = 0, y = 0, width = 14, height = 23 }, 
				textureRect = { x = 80, y = 159, width = 14, height = 23 }, 
				spriteSourceSize = { width = 14, height = 23 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "sharp.png",
				spriteColorRect = { x = 0, y = 0, width = 28, height = 28 }, 
				textureRect = { x = 120, y = 2, width = 28, height = 28 }, 
				spriteSourceSize = { width = 28, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "slash.png",
				spriteColorRect = { x = 0, y = 0, width = 23, height = 28 }, 
				textureRect = { x = 147, y = 122, width = 23, height = 28 }, 
				spriteSourceSize = { width = 23, height = 28 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
			{
				name = "underscore.png",
				spriteColorRect = { x = 0, y = 0, width = 22, height = 14 }, 
				textureRect = { x = 222, y = 122, width = 22, height = 14 }, 
				spriteSourceSize = { width = 22, height = 14 }, 
				spriteTrimmed = true,
				textureRotated = false
			},
		
		}
	}

	return sheet
end