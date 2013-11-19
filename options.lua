-- Sets an option variable
-- option: name of option
-- val: value of option
-- [scope]: "screen" variable for the current screen or "app" for appwide. Not required and defaults to "app"
function setOption(option, val, scope)
    if not scope then scope = 'app' end
    if not _options then _options = { screen={}, app={} } end
    _options[scope][option] = val
end

-- Returns the requested screen or app variable
-- option: name of option
-- [scope]: "screen" variable for the current screen or "app" for appwide. Not required and defaults to "app"
function getOption(option, scope)
	if _options then
    	if not scope then scope = 'app' end
    	if _options[scope] then
    		return _options[scope][option]
    	else
			return nil
        end
    else return nil
    end
end

-- Clears "app", "screen", or all variables
-- [scope]: "screen" variable for the current screen or "app" for appwide. Not required and defaults to "all"
function clearOption( scope )
	if scope then
    	_options[scope] = nil
    else
    	_options.app = nil
        _options.screen = nil
        _options = nil
    end
end

--SET VARIABLES
--setOption( "Colour", "Red", "screen" ) -- Set a screen variable
--setOption( "Score", 666 ) -- Set an app variable
--
--print( "Screen: " .. getOption( "Colour", "screen" ) ) -- Returns Screen Variable
--print( "App: " .. getOption( "Score" ) ) -- Returns App Variable
--
-- DELETE VARIABLES
--clearOption( "screen" ) -- Removes all Screen Variables. Can be called on screenExit
--print( getOption( "Colour", "screen" )) -- Returns nil as all Screen variables are gone
--print( "App: " .. getOption( "Score" ) ) -- Returns App variable
--
--clearOption() -- Removes all variables. Can be called if you want to reset the application
--print( getOption( "Score" ) ) -- Returns nil
--
-- Variables can be deleted directly by calling setOption( option, nil, scope ). Scope will be required