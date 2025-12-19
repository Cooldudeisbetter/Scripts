-- This is a misc script made by me to test my skills
-- Pretty useless if you dont join https://www.roblox.com/share?code=ed31689ca63b3d46828fa052cec34caa&type=ExperienceDetails&stamp=1766173880323

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "Lunar Theme",
    
    Accent = Color3.fromHex("#101010"),
    Background = Color3.fromHex("#5e00b0"), 
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

local Window = WindUI:Window({
    Title = "Lunar Hub",
    Icon = "lucide:moon",
    Theme = "Lunar Theme",
    Folder = "LunarHubFpsScript",
    Author = "by cooldudeisbetter",
})

-- Bypass the anti cheat
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()

fpstab = 