while true do
        local args = {
            [1] = {
                ["res"] = "2400x1000" --[[Vector2]],
                ["mem"] = math.random(5000,2000),
                ["t"] = "metrics",
                ["gfx"] = Enum.SavedQualitySetting.Automatic,
                ["fps"] = math.random(10000,15000)
            }
        }

        game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))

        task.wait(0.5)
end
