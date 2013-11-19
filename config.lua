-- cpmgen config.lua
application =
{
	content =
	{
		width = 320,
		height = 480,
		scale = "zoomStretch",
		fps = 30,
		antialias = true,
		xalign = "center",
		yalign = "center",

		imageSuffix = 
		{
			["@2"] = 2
		}

	},

	notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert"
            }
        }
    }
}