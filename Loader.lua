local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local lib = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = lib:CreateWindow({
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
