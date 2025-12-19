local args = {
    [1] = {
        ["fps"] = 100.131331337126323,
        ["mem"] = 1318.694580078125,
        ["t"] = "metrics",
        ["res"] = Vector2.new(1180, 820),
        ["gfx"] = Enum.SavedQualitySetting.Automatic
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("nya"):FireServer(unpack(args))
