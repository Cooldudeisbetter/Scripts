while true do
    f = math.random(8000,10000)

    local args = {
        [1] = {
            ["fps"] = f,
            ["mem"] = 13158.694580078125,
            ["t"] = "metrics",
            ["res"] = Vector2.new(1180, 820),
            ["gfx"] = Enum.SavedQualitySetting.Automatic
        }
    }


    game:GetService("ReplicatedStorage"):WaitForChild("nya"):FireServer(unpack(args))

    task.wait(0.5)

end