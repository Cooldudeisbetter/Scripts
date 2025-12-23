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

requestpacket = {
    t = "device",
    tbl = {
        vrEnabled          = false,
        tenFootInterface   = false,
        isWindows          = true,   -- Clearly shows NOT Windows
        robloxVersion      = "version-mobile-abc123",
        gyroOrAccelEnabled = true,
        touchEnabled       = true,
        keyboardEnabled    = false,
        mouseEnabled       = false    -- Even if MouseEnabled says true, the text-size trick detected no real mouse
    }
}

SendToServer:FireServer(requestpacket)