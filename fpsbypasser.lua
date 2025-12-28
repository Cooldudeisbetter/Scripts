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

local fpsl = 1
local fpsm = 10
local mem = 10
local res = "1920x1080"
local supportedres = {
    "1920x1080",
    "2560x1440",
    "3840x2160",
    "3440x1440",
    "5120x2880",
    "1366x768",
    "1600x900",
}
local bfps = false
maxmem = 100
-- UI elements
fpstab = Window:Tab({
    Title = "FPS",
    Icon = "laptop",
    Locked = false,
})

-- send func
local function send(res,mem,fps)
    local args = {
        [1] = {
            ["res"] = res,
            ["mem"] = mem,
            ["t"] = "metrics",
            ["gfx"] = Enum.SavedQualitySetting.Automatic,
            ["fps"] = fps
        }
    }

    game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))
end

--send loop

task.spawn(
    function()
        while true do
            if bfps == true then
                m = math.random(math.floor(mem),math.floor(maxmem))
                f = math.random(math.floor(fpsm),math.floor(fpsl))
                send(res,m,f)
            else
                print("waiting")

            task.wait(1)
            end 
        end
    end
)

minfps = fpstab:Input({
    Title = "Minimum Fps",
    Desc = "The minimum fps to show",
    Value = "10000",
    InputIcon = "app-window",
    Type = "Input",
    Placeholder = "10000",
    Callback = function(input)
        numbervaluelow = tonumber(input)
        if numbervaluelow == nil then
            warn("Invalid Fps")
            WindUI:Notify({
                Title = "Invalid Fps",
                Icon = "circle-x",
                Duration = 5,
                Content = "Invalid Number please try a valid number",
            })
        else 
            fpsl = numbervaluelow
            WindUI:Notify({
                Title = "Miminum fps value set",
                Content = "The mimumum fps has been set as" ..fpsl,
                Icon = "check",
                Duration = 5,
            })
        end
    end
})

maxfps = fpstab:Input({
    Title = "Maximum Fps",
    Desc = "The maximum amount of fps to show",
    Value = "50000",
    InputIcon = "app-window",
    Type = "Input",
    Placeholder = "50000",
    Callback = function(input)
        numbervaluemax = tonumber(input)
        if numbervaluemax == nil then 
            numbervaluemax = 10
            WindUI:Notify({
                Title = "Invalid Number",
                Content = "The number", input, "is not a valid number",
                Duration = 5,
                Icon = "circle-x",
            })
        else
            fpsm = numbervaluemax
            WindUI:Notify({
                Title = "Number Set",
                Content = "The maximum number of fps has been set to " ..tostring(numbervalue),
                Duration = 5,
                Icon = "check",
            })
        end
    end
})

fpstab:Divider()

resinp = fpstab:Input({
    Title = "Resolution",
    Desc = "Enter the device resolution",
    Value = "1920x1080",
    InputIcon = "smartphone",
    Type = "Input",
    Placeholder = "1920x1080",
    Callback = function(input)
        if not table.find(supportedres, input) then
            WindUI:Notify({
                Title = "Invalid Resolution",
                Content = "Try using a valid resolution like 1920x1080",
                Duration = 5,
                Icon = "circle-x",
            })
        else 
            res = input
            WindUI:Notify({
                Title = "Resolution Set",
                Content = "the resolution has been succesfully set as " ..input,
                Duration = 5,
                Icon = "check"

            })
        end
    end
})
fpstab:Divider()
meminpmin = fpstab:Input({
    Title = "Memory",
    InputIcon = "cpu",
    Value = "3000",
    Placeholder = "3000",
    Desc = "The mimimum amount of memory to show",
    Type = "Input",
    Callback = function(input)
        if tonumber(input) == nil then
            WindUI:Notify({
                Title = "Invalid Number",
                Icon  = "circle-x",
                Content = "The number provided is invalid",
                Duration = 5
            })
        else
            mem = tonumber(input)
            WindUI:Notify({
                Title = "Value set",
                Content = "The minimum memory has been set",
                Duration = 5,
                Icon = "check",
            })
        end 
    end

})

memmaxinp = fpstab:Input({
    Title = "Max memory",
    Desc = "The maximum amount of memory to show",
    InputIcon = "cpu",
    Placeholder = "5000",
    Value = "5000",
    Type = "Input",
    Callback = function(input)
        convinput = tonumber(input)
        if convinput == nil then
            WindUI:Notify({
                Title = "Invalid Number",
                Content = "The given argument", convinput ,"is not a number",
                Duration = 5,
                Icon = "circle-x"
            })
        else
            maxmem = convinput
            WindUI:Notify({
                Title = "Number set",
                Content = "The maximum number of memory has been set",
                Icon = "check",
                Duration = 5,
            })
        end
    end
})

fpstab:Divider()

fpstab:Toggle({
    Title = "Bypass Stats",
    Icon = "chart-spline",
    Desc = "Toggles the stat bypasses",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        bfps = state
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