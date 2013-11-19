-- LOAD LIBRARY
TextFX	= require("lib_text_fx")

-- LOAD & ADD THE CHARSET
TextFX.AddCharset	 ("SMOKY_MEDIUM", "SmokyGlass_Medium_Chrome", "0123456789AÄBCDEFGHIJKLMNOÖPQRSTUÜVWXYZ'*@():,$.!-%+?;#/_", 24)

-- ADJUST THE Y-OFFSET OF SOME CHARS
TextFX.SetCharYOffset("SMOKY_MEDIUM", "(",-6 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", ")",-6 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", ":", 4 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", ",", 25)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "$",-4 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", ".", 22)
TextFX.SetCharYOffset("SMOKY_MEDIUM", ";", 15)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "'",-8 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", "-", 14)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "+", 4 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", "/",-4 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", "_", 30)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "*", 8 )
TextFX.SetCharYOffset("SMOKY_MEDIUM", "Ä",-10)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "Ö",-10)
TextFX.SetCharYOffset("SMOKY_MEDIUM", "Ü",-10)
