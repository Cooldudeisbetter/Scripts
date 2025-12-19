while true do
    local args = {
        [1] = {
            ["fps"] = 8363409,
            ["mem"] = 13158.694580078125,
            ["t"] = "metrics",
            ["res"] = Vector2.new(1180, 820),
            ["gfx"] = Enum.SavedQualitySetting.Automatic
        }
    }


    game:GetService("ReplicatedStorage"):WaitForChild("nya"):FireServer(unpack(args))

    task.sleep(0.5)

end