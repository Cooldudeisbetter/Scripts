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

local Window = WindUI:CreateWindow({
    Title = "Lunar Hub",
    Icon = "lucide:moon",
    Theme = "Lunar Theme",
    Folder = "LunarHubFpsScript",
    Author = "by cooldudeisbetter",
})

-- Bypass the anti cheat
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()

local fpsn = 1

-- UI elements
fpstab = Window:Tab({
    Title = "FPS",
    Icon = "laptop",
    Locked = false,
})

local function send(res,mem,fps,gfx)
    local args = {
        [1] = {
            ["res"] = res,
            ["mem"] = mem,
            ["t"] = "metrics",
            ["gfx"] = Enum.SavedQualitySetting.Automatic,
            ["fps"] = 59.84706857657344
        }
    }

    game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))
end

minfps = Window:Input({
    Title = "Minimum Fps",
    Desc = "The minimum fps to show",
    Value = "10000",
    InputIcon = "app-window",
    Type = "Input",
    Placeholder = "10000",
    Callback = function(input)
        numbervalue = tonumber(input)
        if numbervalue == nil then
            warn("Invalid Fps")
            WindUI:Notify({
                Title = "Invalid Fps",
                Icon = "circle-x",
                Duration = 5,
                Content = "Invalid Number please try a valid number",
            })
        else 
            fpsn = numbervalue
        end
    end
})

fpstab:Button({
    Title = "Fps bypasser",
    Desc = "bypasses your fps",
    Locked = false,
    Callback = function()
        print("..")
    end
})

toolstab = Window:Tab({
    Title = "Tools",
    Icon = "wrench",
    Locked = false,
})

toolstab:Button({
    Title = "Simple spy",
    Desc = "runs one of the only working rspys in this game",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()
    end
})

toolstab:Button({
    Title = "Solara Hub",
    Desc = "This has everything",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://solarahub.space/SH.lua'))()
    end
})