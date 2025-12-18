local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

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

local Window = WindUI:CreateWindow({
    Theme = "Aqua Theme",
    Title = "Aqua Hub - Custom",
    Icon = "lucide:shell",
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

local function Notify(title,content,Icon,Duration)
    if title and content then 
        WindUI:Notify({
            Title = title,
            Content = content,
            Icon = Icon or nil,
            Duration = Duration or 5,
        })
    else
        WindUI:Notify({
            Title = "ERROR",
            Content = "Invalid variables",
            Icon = "shield-alert",
            Duration = 10
        })
end

local home = Window:Tab({
    Title = "Home",
    Icon = "house",
    Locked = false,
})

Window:Tag({
    Title = "v1.0.0 APLHA",
    Icon = "rocket",
    Color = Color3.fromHex("#e3102c"),
    Radius = 10,
})

Window:Tag({
    Title = "Custom",
    Icon = "zap",
    Color = Color3.fromHex("#9d00ff"),
    Radius = 10,
})

home:Select()

Notify("Aqua Hub","Aqua hub has been loaded | Have a goody day","refresh-ccw",5)

