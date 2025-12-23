-- ReplicatedFirst.LocalScript
-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-12-23 01:38:15
-- Luau version 6, Types version 3
-- Time taken: 0.008633 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local nya_upvr = ReplicatedStorage:WaitForChild("nya")
local TextService_upvr = game:GetService("TextService")
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
task.spawn(function() -- Line 11
    --[[ Upvalues[4]:
        [1]: TextService_upvr (readonly)
        [2]: nya_upvr (readonly)
        [3]: UserInputService_upvr (readonly)
        [4]: GuiService_upvr (readonly)
    ]]
    local tbl_4 = {
        t = "device";
    }
    local tbl_2 = {
        A = UserInputService_upvr.VREnabled;
        B = GuiService_upvr:IsTenFootInterface();
        C = GuiService_upvr.IsWindows;
        D = getfenv().version();
    }
    local GyroscopeEnabled = UserInputService_upvr.GyroscopeEnabled
    if not GyroscopeEnabled then
        GyroscopeEnabled = UserInputService_upvr.AccelerometerEnabled
    end
    tbl_2.E = GyroscopeEnabled
    tbl_2.F = UserInputService_upvr.TouchEnabled
    tbl_2.G = UserInputService_upvr.KeyboardEnabled
    local MouseEnabled = UserInputService_upvr.MouseEnabled
    tbl_2.H = MouseEnabled
    if TextService_upvr:GetTextSize(utf8.char(65535), 16, "SourceSans", Vector2.one * 1000) == TextService_upvr:GetTextSize(utf8.char(63743), 16, "SourceSans", Vector2.one * 1000) then
        MouseEnabled = false
    else
        MouseEnabled = true
    end
    tbl_2.I = MouseEnabled
    tbl_4.tbl = tbl_2
    nya_upvr:FireServer(tbl_4)
end)
local var11_upvw = 0
local var13_upvw = 0
local tick_result1_2_upvw = tick()
game:GetService("RunService").PreRender:Connect(function() -- Line 33
    --[[ Upvalues[3]:
        [1]: var13_upvw (read and write)
        [2]: tick_result1_2_upvw (read and write)
        [3]: var11_upvw (read and write)
    ]]
    var13_upvw += 1
    local tick_result1 = tick()
    local var16 = tick_result1 - tick_result1_2_upvw
    if 1 <= var16 then
        var11_upvw = var13_upvw / var16
        var13_upvw = 0
        tick_result1_2_upvw = tick_result1
    end
end)
local Stats_upvr = game:GetService("Stats")
ReplicatedStorage:WaitForChild("meow").OnClientEvent:Connect(function(arg1) -- Line 44
    --[[ Upvalues[3]:
        [1]: nya_upvr (readonly)
        [2]: var11_upvw (read and write)
        [3]: Stats_upvr (readonly)
    ]]
    if type(arg1) == "table" then
        local var21
        if arg1.t == "metrics" then
            local tbl = {}
            var21 = "metrics"
            tbl.t = var21
            var21 = var11_upvw
            tbl.fps = var21
            var21 = UserSettings():GetService("UserGameSettings").SavedQualityLevel
            tbl.gfx = var21
            var21 = Stats_upvr:GetTotalMemoryUsageMb()
            tbl.mem = var21
            local function INLINED_2() -- Internal function, doesn't exist in bytecode
                var21 = workspace.CurrentCamera.ViewportSize
                return var21
            end
            if not workspace.CurrentCamera or not INLINED_2() then
                var21 = Vector2.new(0, 0)
            end
            tbl.res = var21
            nya_upvr:FireServer(tbl)
        end
    end
end)
