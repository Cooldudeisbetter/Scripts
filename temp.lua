local rng = Random.new()  

while true do
    local fps = rng:NextInteger(10000, 15000)  
    local mem = rng:NextInteger(2000, 5000)
    
    local args = {
        [1] = {
            ["res"] = "2400x1000" --[Vector2]],
            ["mem"] = mem,
            ["t"] = "metrics",
            ["gfx"] = Enum.SavedQualitySetting.Automatic,
            ["fps"] = fps
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage").nya:FireServer(unpack(args))  -- Fixed typo: was "ReplicatedStorage" twice
    
    task.wait(0.25)
end
