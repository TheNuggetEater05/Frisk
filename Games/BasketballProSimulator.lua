local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Frisk[BBPS]", HidePremium = true, SaveConfig = true, ConfigFolder = "Frisk\\BBPS"})

local values = {
    ForcePerfectShot = false,
}

OrionLib:MakeNotification({
	Name = "Loading...",
	Content = "Loading Hub...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local BallSect = MainTab:AddSection({
    Name = "Ball"
})

BallSect:AddToggle({
	Name = "Force perfect shot",
	Default = false,
	Callback = function(Value)
		values.ForcePerfectShot = Value
	end    
})

local UpgradeSect = MainTab:AddSection({
    Name = "Upgrades"
})

UpgradeSect:AddButton({
    Name = "Upgrade Speed",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FireServer("Upgrade", "Speed")
    end
})

UpgradeSect:AddButton({
    Name = "Upgrade Power",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FireServer("Upgrade", "Power")
    end
})

local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if values.ForcePerfectShot and method == "InvokeServer" and tostring(self) == "RF" and args[1] == "Shoot" then
        args[2] = "Green"
        print("Spoofed "..args[1].." Quality: "..args[2])
        return namecall(self, args[1], args[2])
    end
    return namecall(self, ...)
end)

OrionLib:MakeNotification({
	Name = "Loaded!",
	Content = "Finished loading Hub. Hub made by The Scat Rat. Discord:Jaydenn#7592",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:Init()
