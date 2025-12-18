local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:AddTheme({
    Name = "Aqua Theme",
    
    Accent = Color3.fromHex("#101010"),
    Background = Color3.fromHex("#3828c7"), 
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

WindUI:SetTheme("Aqua Theme")

local Window = lib:CreateWindow({
    Theme = "Aqua Theme",
    Title = "Aqua Hub - Custom",
    Icon = "Shell",
    Author = "by cooldudeisbetter",
    Folder = "Aqua Hub",

    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("Not a clickable object")
        end,
    }
})

local home = Window:Tab({
    Name = "Home",
    Icon = "house",
    Locked = false,
})

home:Select()
