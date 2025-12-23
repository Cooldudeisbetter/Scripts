-- Cleaned & Explained Version of the Suspicious Telemetry LocalScript
-- Original was heavily obfuscated and placed in ReplicatedFirst
-- Purpose: Sends device information on join, and performance metrics when requested by the server

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService       = game:GetService("TextService")
local UserInputService  = game:GetService("UserInputService")
local GuiService        = game:GetService("GuiService")
local RunService        = game:GetService("RunService")
local Stats             = game:GetService("Stats")

-- RemoteEvents used for communication with the server
-- "nya"  = Client → Server (we send data using this)
-- "meow" = Server → Client (server requests metrics from us)
local SendToServer = ReplicatedStorage:WaitForChild("nya")      -- RemoteEvent
local RequestFromServer = ReplicatedStorage:WaitForChild("meow") -- RemoteEvent

-- ====================================================================
-- 1. IMMEDIATELY SEND DEVICE INFORMATION WHEN PLAYER JOINS
-- ====================================================================
-- This runs in a separate thread so it doesn't block anything else
task.spawn(function()
    -- Collect basic device/input capabilities
    local deviceInfo = {
        -- A: Is the player using VR?
        vrEnabled           = UserInputService.VREnabled,
        
        -- B: Is this a console/TV "ten-foot" interface (e.g. Xbox)?
        tenFootInterface    = GuiService:IsTenFootInterface(),
        
        -- C: Is the client running on Windows?
        isWindows           = GuiService.IsWindows,
        
        -- D: Roblox client version string (e.g. "version-abc123")
        robloxVersion       = getfenv().version(),
        
        -- E: Does the device have gyroscope or accelerometer (mobile tilt)?
        gyroOrAccelEnabled  = UserInputService.GyroscopeEnabled or UserInputService.AccelerometerEnabled,
        
        -- F: Touch screen support
        touchEnabled        = UserInputService.TouchEnabled,
        
        -- G: Keyboard available
        keyboardEnabled     = UserInputService.KeyboardEnabled,
        
        -- H & I: Mouse detection (with a clever fallback check)
        mouseEnabled        = UserInputService.MouseEnabled,
    }

    -- Roblox's MouseEnabled can be unreliable on some mobile/emulated setups.
    -- This trick compares text size of two obscure Unicode characters.
    -- If they render the same size, Roblox is likely faking mouse support (e.g. mobile).
    -- If different → real mouse is present.
    local realMouseCheck = TextService:GetTextSize(utf8.char(65535), 16, "SourceSans", Vector2.new(1000, 1000))
        == TextService:GetTextSize(utf8.char(63743), 16, "SourceSans", Vector2.new(1000, 1000))

    if realMouseCheck then
        deviceInfo.mouseEnabled = false   -- Likely no real mouse
    else
        deviceInfo.mouseEnabled = true    -- Real mouse detected
    end

    -- Final packet structure the server expects
    local packet = {
        t   = "device",   -- type of message
        tbl = deviceInfo  -- actual data
    }

    -- Send device fingerprint to the server immediately
    SendToServer:FireServer(packet)
end)

-- ====================================================================
-- 2. FPS CALCULATION (runs every frame)
-- ====================================================================
-- We track FPS client-side so we can report it later when asked
local framesThisSecond = 0
local lastFpsUpdateTime = tick()
local currentFps = 0

RunService.PreRender:Connect(function()
    framesThisSecond = framesThisSecond + 1

    local currentTime = tick()
    local timeSinceLastUpdate = currentTime - lastFpsUpdateTime

    -- Update FPS once per second
    if timeSinceLastUpdate >= 1 then
        currentFps = framesThisSecond / timeSinceLastUpdate
        framesThisSecond = 0
        lastFpsUpdateTime = currentTime
    end
end)

-- ====================================================================
-- 3. LISTEN FOR SERVER REQUESTS FOR PERFORMANCE METRICS
-- ====================================================================
RequestFromServer.OnClientEvent:Connect(function(requestData)
    if type(requestData) ~= "table" then return end

    -- Server can send different request types; we only handle "metrics"
    if requestData.t == "metrics" then
        local camera = workspace.CurrentCamera
        local resolution = Vector2.zero

        -- Safely get screen resolution
        if camera then
            resolution = camera.ViewportSize
        end

        -- Graphics quality level (1 = lowest, 10 = highest, 0 = automatic)
        local graphicsQuality = UserSettings():GetService("UserGameSettings").SavedQualityLevel

        -- Build metrics packet
        local metricsPacket = {
            t   = "metrics",
            fps = math.floor(currentFps),           -- Current FPS
            gfx = graphicsQuality,                  -- Graphics quality level
            mem = Stats:GetTotalMemoryUsageMb(),    -- Memory usage in MB
            res = resolution                        -- Screen resolution (Vector2)
        }

        -- Send performance data back to server
        SendToServer:FireServer(metricsPacket)
    end
end)