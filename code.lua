while true do
    f = math.random(235,1200)
    m = math.random(1500,3000)

    local args = {
        [1] = {
            ["fps"] = f,
            ["mem"] = m,
            ["t"] = "metrics",
            ["res"] = Vector2.new(1180, 820),
            ["gfx"] = enum.SavedQualitySetting.Ten,
        
    }
}


    game:GetService("ReplicatedStorage"):WaitForChild("nya"):FireServer(unpack(args))
    print(args[1]["t"])

    task.wait(0.25)

end