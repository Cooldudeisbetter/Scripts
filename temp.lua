local rng = Random.new()  -- Recommended for proper randomness

task.spawn(function()
    while true do
        local fps = rng:NextInteger(10000, 15000)
        local mem = rng:NextInteger(2000, 5000)
        
        local args = {
            [1] = {
                ["res"] = "2400x1000",  -- Removed the weird --[Vector2] comment if not needed
                ["mem"] = mem,
                ["t"] = "metrics",
                ["gfx"] = Enum.SavedQualitySetting.Automatic,
                ["fps"] = fps
            }
        }
        
        game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))
        
        task.wait(0.25)
    end
end)