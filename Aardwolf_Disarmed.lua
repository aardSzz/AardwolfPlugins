require "serialize"

local options = {
	weaponset = {
		["WeaponKeyword"] = "dagger",
    }
}

function Aardwolf_Disarmed(name, line, wildcards)
    Send("help disarm")
    Aardwolf_Disarmed_PrintHelp()
end

function Aardwolf_Disarmed_PrintHelp()
    DoAfterSpecial(1, 'Note (" ")', 12) 
    DoAfterSpecial(1, 'Note ("Aardworld_Disarmed by Szzilleriel v1.01")', 12)
    DoAfterSpecial(1, 'Note ("---------------------------------------")', 12)
    DoAfterSpecial(1, 'Note ("weaponset [keyword|keywords here]")', 12)
    DoAfterSpecial(1, 'Note (" ")', 12)
    DoAfterSpecial(1, 'Note ("Examples:")', 12)
    DoAfterSpecial(1, 'Note ("weaponset dagger")', 12)
    DoAfterSpecial(1, 'Note ("weaponset black axe")', 12)
    DoAfterSpecial(1, 'Note (" ")', 12)
    DoAfterSpecial(1, 'Note ("weaponset with no arguments will display current setting.")', 12)
end

function Aardwolf_Disarmed_Wield(name, line, wildcards)
    Send("wield " .. options.weaponset.WeaponKeyword)
    ColorNote("white", "red", "[Aardwolf_Disarmed]: We were DISARMED to inventory. Wielding weapon.")
end

function Aardwolf_Disarmed_GetWield(name, line, wildcards)
    Send("get " .. options.weaponset.WeaponKeyword)
    Send("wield " .. options.weaponset.WeaponKeyword)
    ColorNote("white", "red", "[Aardwolf_Disarmed]: We were DISARMED to ground. Getting, then wielding weapon.")
end

function Aardwolf_Disarmed_WeaponDisplay(name, line, wildcards)
    Note("Current Weapon Keyword(s) are: " .. options.weaponset["WeaponKeyword"])
end

function Aardwolf_Disarmed_WeaponSet(name, line, wildcards)
        options.weaponset.WeaponKeyword = wildcards.keyword
        Aardwolf_Disarmed_Save()
        Note("Weapon Keyword(s) set to: " .. wildcards.keyword)
end

function Aardwolf_Disarmed_Save()
    SetVariable("Aardwolf_Disarmed", serialize.save_simple(options))
    SaveState()
end

function OnPluginEnable()
    if GetVariable("Aardwolf_Disarmed") then
        options = assert(loadstring("return " .. GetVariable("Aardwolf_Disarmed")))()
    end
    Aardwolf_Disarmed_PrintHelp()
end

function OnPluginInstall()
    if GetVariable("Aardwolf_Disarmed") then
        options = assert(loadstring("return " .. GetVariable("Aardwolf_Disarmed")))()
    end
    ColourNote("white", "", "[Aardwolf_Disarmed] by Szilleriel - Installed v" .. GetPluginInfo(GetPluginID(), 19))
    Aardwolf_Disarmed_PrintHelp()
end

function OnPluginDisable()
    Aardwolf_Disarmed_Save()
end

function OnPluginClose()
    Aardwolf_Disarmed_Save()
end