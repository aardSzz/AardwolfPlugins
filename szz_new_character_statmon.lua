---@diagnostic disable: undefined-global, lowercase-global
-- Todo: Add different layouts. Add VI options.
require "gmcphelper"
require "serialize"
require "themed_miniwindows"
require "wait"

NewChar = { }
Rdata = "empty"
local options = {
	display = {
		["showname"] = true,
		["showstats"] = true,
		["showinfo"] = true,
		["showworth"] = true,
		["showremorts"] = true,
		["showclass"] = true,
		["showpups"] = true,
        ["showcommas"] = true,
		["uservi"] = false,
		["userlayout"] = 0 -- 0 = Default, 1 = Tall Skinny, 2 = Long Skinny
	},
	theme = {
		["maincolor"] = "@G",
		["secondcolor"] = "@W",
        ["namecolor"] = "@R",
		["goldcolor"] = "@Y",
		["remorton"] = "@G",
		["remortonvi"] = "+",
		["remortoff"] = "@R",
		["remortoffvi"] = "-",
		["background"] = nil
	}
}
Rstring = options.theme.remortoff .. "Cle" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "Mag" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "Pal" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "Psi" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "Ran" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "Thi" .. options.theme.maincolor .. "/" .. options.theme.remortoff .. "War" .. options.theme.maincolor

function New_Character_Statmon(name, line, wildcards)
	local arg1, arg2 = nil, nil

	if (wildcards[1]) then arg1 = wildcards[1] end
	if (wildcards[2]) then arg2 = wildcards[2] end

	if (arg1 ~= nil) then
		if (not CheckValidCommand(arg1)) then
			PrintHelp()
			return
		end
	end

	if (arg1:lower() == "showname") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showname = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showname = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showstats") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showstats = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showstats = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showinfo") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showinfo = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showinfo = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showworth") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showworth = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showworth = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showremorts") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showremorts = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showremorts = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showclass") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showclass = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showclass = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showpups") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showpups = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showpups = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "showcommas") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.showcommas = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.showcommas = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
	if (arg1:lower() == "uservi") then
		if (arg2 ~= nil) then
			if (not CheckValidArgument(arg2)) then
				PrintDisplayHelp()
				return
			else
				if (arg2:lower() == "on" or arg2 == "1" or arg2:lower() == "true") then
					options.display.uservi = true
					Note ("SzzStatmon: " .. arg1:lower() .. " set to on")
					SaveNewStatmon()
					return
				end
				if (arg2:lower() == "off" or arg2 == "0" or arg2:lower() == "false") then
					options.display.usrvi = false
					Note ("SzzStatmon: " .. arg1:lower() .. " set to off")
					SaveNewStatmon()
					return
				end
			end
		end
	end
    if (arg1:lower() == "maincolor") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.maincolor = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
    if (arg1:lower() == "secondcolor") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.secondcolor = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
    if (arg1:lower() == "namecolor") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.namecolor = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
    if (arg1:lower() == "goldcolor") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.goldcolor = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
    if (arg1:lower() == "remorton") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.remorton = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
    if (arg1:lower() == "remortoff") then
		if (arg2 ~= nil) then
			if (not CheckValidColor(arg2)) then
				PrintThemeHelp()
				return
			else
				options.theme.remortoff = arg2
				Note ("SzzStatmon: " .. arg1:lower() .. " set to: " .. arg2)
				SaveNewStatmon()
				return
			end
		end
	end
end

function CheckValidColor(string)
    local valid = false
    local validmudcolortbl =  { 
        ["b"] = 1,
        ["r"] = 2,
        ["g"] = 3,
        ["y"] = 4,
        ["Y"] = 5,
        ["c"] = 6,
        ["m"] = 7,
        ["w"] = 8,
        ["d"] = 9
    }
    local validcolormatch = "@x*%w+"
    if string.find(string, validcolormatch) then
        if string.find(string:lower(), "x") then
            local s = string:gsub("@x", "")
            if (s == "0") or (s >= "1" and s <= "255") then
                valid = true
            end
        else
            for k, _ in pairs(validmudcolortbl) do
                local s = string:gsub("@", "")
                if (s:lower() == k) then
                    valid = true
                end
                if (valid) then
                    break
                end
            end
        end
    else
        return false
    end
    if (valid) then
        return true
    else
        return false
    end
end

function CheckValidCommand(string)
	local valid = false
	local cmdtbl = {
	    ["showname"] = 1,
	    ["showstats"] = 2,
	    ["showinfo"] = 3,
	    ["showworth"] = 4,
	    ["showremorts"] = 5,
	    ["showclass"] = 6,
		["showpups"] = 7,
        ["showcommas"] = 8,
		["uservi"] = 9,
		["userlayout"] = 10,
		["maincolor"] = 11,
		["secondcolor"] = 12,
        ["namecolor"] = 13,
		["goldcolor"] = 14,
		["remorton"] = 15,
		["reomrtonvi"] = 16,
		["remortoff"] = 17,
		["remortoffvi"] = 18,
		["background"] = 19
	}
	if (string ~= nil) then
		for k, _ in pairs(cmdtbl) do
			if (string:lower() == k) then
	        	valid = true
       		end
			if (valid) then
				break
			end
    	end
	end
	if (valid) then
		return true
	else
		return false
	end
end

function CheckValidArgument(string)
	local valid = false
	local argtbl = {
		["on"] = 1,
		["off"] = 2,
		["true"] = 3,
		["false"] = 4,
		["1"] = 5,
		["0"] = 6
	}
	if (string ~= nil) then
		for k, _ in pairs(argtbl) do
			if (string:lower() == k) then
	        	valid = true
       		end
			if (valid) then
				break
			end
    	end
	end
	if (valid) then
		return true
	else
		return false
	end
end

function formatwithcommas(n)
  return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
                                :gsub(",(%-?)$","%1"):reverse()
end

function PrintHelp()
	Note("szz_new_character_statmon by Szzilleriel")
	Note("")
	Note("ncs [showname/showstats/showinfo/showworth/showremorts/showclass/showpups/showcommas] [on/off/1/0/true/false]")
	Note("ncs [maincolor/secondcolor/goldcolor/remorton/remortoff] [mud_color_code] - ie: @G or @x101")
	-- Note("ncs [uservi] [on/off/1/0/true/false] - For visually impaired")
	-- Note("ncs [remortonvi/remortoffvi] [symbol] - ie: ncs remorton + or ncs remortoff -")
end

function PrintDisplayHelp()
	Note("Syntax: ncs [showname/showstats/showinfo/showworth/showremorts/showclass/showpups/showcommas] [on/off/1/0/true/false]")
end

function PrintThemeHelp()
    Note("Syntax: ncs [maincolor/secondcolor/goldcolor/remorton/remortoff] [mud_color_code] - ie: @G or @x101")
end

function New_Character_Update()
	if (not options.display.showname) then
		window_builder = "\n"
	else
		window_builder = "\n\n"
	end

	if (options.display.showstats) then
		window_builder = window_builder .. options.theme.maincolor .. "Str   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.str, NewChar.maxstats.maxstr) .. "    Hp    : " .. string.format("[" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "]", NewChar.vitals.hp, NewChar.maxstats.maxhp) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Int   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.int, NewChar.maxstats.maxint) .. "    Ma    : " .. string.format("[" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "]", NewChar.vitals.mana, NewChar.maxstats.maxmana) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Wis   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.wis, NewChar.maxstats.maxwis) .. "    Mv    : " .. string.format("[" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "]", NewChar.vitals.moves, NewChar.maxstats.maxmoves) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Dex   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.dex, NewChar.maxstats.maxdex) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Con   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.con, NewChar.maxstats.maxcon) .. "    HR    : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.stats.hr) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Luk   : " .. string.format("[" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "%3d" .. options.theme.maincolor .. "]", NewChar.stats.luck, NewChar.maxstats.maxluck) .. "    DR    : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.stats.dr) .. "\n"
		window_builder = window_builder .. "\n"
	end

	if (options.display.showinfo) then
		window_builder = window_builder .. options.theme.maincolor .. "TNL   : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.status.tnl) .. "      Align : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.status.align) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Train : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.worth.trains) .. "      Prac  : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.worth.pracs) .. "\n"
   		window_builder = window_builder .. "\n"
	end

	if (options.display.showworth) then
        if (options.display.showcommas) then
           	gold = formatwithcommas(NewChar.worth.gold)
        else
           	gold = NewChar.worth.gold
       	end
		window_builder = window_builder .. options.theme.maincolor .. "QP    : " .. string.format("[" .. options.theme.secondcolor .. "%6d" .. options.theme.maincolor .. "]", NewChar.worth.qp) .. "     TP    : " .. string.format("[" .. options.theme.secondcolor .. "%5d" .. options.theme.maincolor .. "]", NewChar.worth.tp) .. "\n"
		window_builder = window_builder .. options.theme.maincolor .. "Gold  : " .. string.format("[" .. options.theme.goldcolor .. "%16s" .. options.theme.maincolor .. "]", tostring(gold)) .. "\n"
		window_builder = window_builder .. "\n"
	end

	if (options.display.showremorts) then
		window_builder = window_builder .. options.theme.maincolor .. "                   Remorts\n"
		-- Do not hammer cpus with gsub replacements except when needed
		if not string.find(Rdata, NewChar.base.classes) then
			Rdata = NewChar.base.classes
			processremorts()
		end
		window_builder = window_builder .. "         " .. Rstring .. "\n"
		window_builder = window_builder .. "\n"
	end

	if (options.display.showclass) then
		window_builder = window_builder .. options.theme.maincolor .. "Pri   : " .. string.format("[" .. options.theme.secondcolor .. "%10s" .. options.theme.maincolor .. "]", NewChar.base.class) .. "  Sub    : " .. string.format("[" .. options.theme.secondcolor .. "%12s" .. options.theme.maincolor .. "]", NewChar.base.subclass) .. "\n"
	end

	if (options.display.showpups) then
		window_builder = window_builder .. options.theme.maincolor .. "Pup   : " .. string.format("[" .. options.theme.secondcolor .. "%10d" .. options.theme.maincolor .. "]", NewChar.base.pups) .. "  Totpup : " .. string.format("[" .. options.theme.secondcolor .. "%12d" .. options.theme.maincolor .. "]", NewChar.base.totpups)
	end

   	draw_window(window_builder)
	if (not options.display.showname) then
		window:dress_window(options.theme.maincolor .. "Level:" .. options.theme.secondcolor .. " " .. NewChar.base.level .. options.theme.maincolor .. " [" .. options.theme.secondcolor .. "T+" .. NewChar.base.tier .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "R+" .. string.len(NewChar.base.classes) .. options.theme.maincolor .. "]")
	else
		window:dress_window(options.theme.namecolor .. NewChar.base.pretitle .. NewChar.base.name .. options.theme.maincolor .. "\n Level:" .. options.theme.secondcolor .. " " .. NewChar.base.level .. options.theme.maincolor .. " [" .. options.theme.secondcolor .. "T+" .. NewChar.base.tier .. options.theme.maincolor .. "/" .. options.theme.secondcolor .. "R+" .. string.len(NewChar.base.classes) .. options.theme.maincolor .. "]")
	end
end

function processremorts()
    local classtbl = {
        ["Mag"] = 0,
        ["Cle"] = 1,
        ["Thi"] = 2,
        ["War"] = 3,
        ["Ran"] = 4,
        ["Pal"] = 5,
        ["Psi"] = 6
    }
    for c, i in pairs(classtbl) do
        if (string.find(NewChar.base.classes, i)) then
            Rstring = string.gsub(Rstring, options.theme.remortoff .. c, options.theme.remorton .. c)
        else
            Rstring = string.gsub(Rstring, options.theme.remorton .. c, options.theme.remortoff .. c)
        end
    end
end

function OnPluginBroadcast (msg, id, name, text)
    if (id == '3e7dedbe37e44942dd46d264') then
		if (text == "char.base" or text == "char.maxstats" or text == "char.stats" or text == "char.status" or text == "char.vitals" or text == "char.worth") then
			NewChar = gmcp("char")
		end
		wait.make(function()
			wait.time(1)
			New_Character_Update()
		end)
    end
 end

function SaveNewStatmon()
   SetVariable("szzNewStatmon", serialize.save_simple(options))
   SaveState()
end

 function OnPluginEnable()
	NewChar = gmcp("char")
	if GetVariable("szzNewStatmon") then
    	options = assert(loadstring("return " .. GetVariable("szzNewStatmon")))()
	end
	PrintHelp()
end

function OnPluginInstall()
	NewChar = gmcp("char")
	if GetVariable("szzNewStatmon") then
    	options = assert(loadstring("return " .. GetVariable("szzNewStatmon")))()
	end
	ColourNote("white", "", "[szz_new_character_statmon] Installed v" .. GetPluginInfo(GetPluginID(), 19))
	PrintHelp()
end

function OnPluginDisable()
	SaveNewStatmon()
	if window then
		window:delete()
		window = nil
	end
end

function OnPluginClose()
	SaveNewStatmon()
	if window then
		window:delete()
		window = nil
	end
end

function draw_window(string)
	if not window then
		window = ThemedTextWindow(
			"58466f80aec9a14d82f79499",                    -- string, required, a unique identifier for this window
			0, -- integer, required, where to put it if the player hasn't moved it
			0,  -- integer, required, where to put it if the player hasn't moved it
			330,         -- integer, required, how big to make it if the player hasn't moved it
			295,        -- integer, required, how big to make it if the player hasn't moved it
			nil,                 -- string, optional (nil means no titlebar), text to put into the title
			nil,       -- string, optional (default is "center"), "left", "center", or "right"
			false,          -- boolean, optional (default is false), true adds a close button in the top left
			true,            -- boolean, optional (default is false), make the window resizeable
			false,       -- boolean, optional (default is false), add a scrollbar and mousewheel scrolling
			true,       -- boolean, optional (default is false), make the text selectable
			true,         -- boolean, optional (default is false), make the text copyable via right-click
			false,        -- boolean, optional (default is false), turn detected URLs into clickable links
			true,              -- boolean, optional (default is false), automatically wrap text lines that are too wide
			"Dina",       -- string, optional (default is Dina), override the title font name
			8,       -- integer, optional (default is 10), override the title font size
			"Dina",        -- string, optional (default is Dina), override the body text font name
			8,        -- integer, optional (default is 10), override the body text font size
			nil,        -- integer, optional (default is 1000), maximum number of text lines to keep
			5           -- integer, optional (default is 5 pixels), space between text and miniwindow frame
		)
	end

	window:clear(false)
	window:add_text(string, true)
end