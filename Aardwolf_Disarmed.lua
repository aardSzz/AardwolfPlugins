require "serialize"

local options = {
	weaponset = {
        primary = {
		    keyword = "dagger"
        },
        secondary = {
            keyword = "axe"
        }
    }
}

function Aardwolf_Disarmed(name, line, wildcards)
    Send("help disarm")
    Aardwolf_Disarmed_PrintHelp()
end

function Aardwolf_Disarmed_PrintHelp()
    DoAfterSpecial(1, 'Note (" ")', 12) 
    DoAfterSpecial(1, 'Note ("Aardwolf_Disarmed by Szzilleriel")', 12)
    DoAfterSpecial(1, 'Note ("---------------------------------------")', 12)
    DoAfterSpecial(1, 'Note ("weaponset <wield|second> [keyword|keywords here]")', 12)
    DoAfterSpecial(1, 'Note (" ")', 12)
    DoAfterSpecial(1, 'Note ("Examples:")', 12)
    DoAfterSpecial(1, 'Note ("weaponset wield dagger")', 12)
    DoAfterSpecial(1, 'Note ("weaponset second black axe")', 12)
    DoAfterSpecial(1, 'Note (" ")', 12)
    DoAfterSpecial(1, 'Note ("weaponset <wield|second> with no arguments will display current setting.")', 12)
end

function Aardwolf_Disarmed_Wield_Script(name, line, wildcards)
    if wildcards.hand:lower() == "primary" then
        Send("wield " .. options.weaponset.primary.keyword)
        ColourNote("white", "red", "[Aardwolf_Disarmed - Primary]: We were DISARMED to inventory by a script. Wielding weapon.")
    end
    if wildcards.hand:lower() == "off" then
        Send("wield " .. options.weaponset.secondary.keyword)
        ColourNote("white", "red", "[Aardwolf_Disarmed - Secondary]: We were DISARMED to inventory by a script. Wielding weapon.")
    end
end

function Aardwolf_Disarmed_Wield_Primary(name, line, wildcards)
    Send("wield " .. options.weaponset.primary.keyword)
    ColourNote("white", "red", "[Aardwolf_Disarmed - Primary]: We were DISARMED to inventory. Wielding weapon.")
end

function Aardwolf_Disarmed_GetWield_Primary(name, line, wildcards)
    Send("get " .. options.weaponset.primary.keyword)
    Send("wield " .. options.weaponset.primary.keyword)
    ColourNote("white", "red", "[Aardwolf_Disarmed - Primary]: We were DISARMED to ground. Getting, then wielding weapon.")
end

function Aardwolf_Disarmed_WeaponSet(name, line, wildcards)
    if wildcards.hand ~= "wield" and wildcards.hand ~= "second" then
        Note("Syntax: weaponset <wield|second> [keyword(s)]")
        return
    end
    if wildcards.hand:lower() == "wield" then
        if wildcards.keyword ~= nil and wildcards.keyword ~= '' then
            options.weaponset.primary.keyword = wildcards.keyword
            Aardwolf_Disarmed_Save()
            Note("Primary Weapon Keyword(s) set to: " .. wildcards.keyword)
        else
            Note("Current Weapon Keyword(s): " .. options.weaponset.primary["keyword"])
        end
    end
    if wildcards.hand:lower() == "second" then
        if wildcards.keyword ~= nil and wildcards.keyword ~= '' then
            options.weaponset.secondary.keyword = wildcards.keyword
            Aardwolf_Disarmed_Save()
            Note("Secondary Weapon Keyword(s) set to: " .. wildcards.keyword)
        else
            Note("Current Weapon Keyword(s): " .. options.weaponset.secondary["keyword"])
        end
    end
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