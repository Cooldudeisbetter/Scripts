while true do
        fps = math.random(10000,15000)
        mem = math.random(2000,5000)
        local args = {
            [1] = {
                ["res"] = "2400x1000" --[[Vector2]],
                ["mem"] = mem,
                ["t"] = "metrics",
                ["gfx"] = Enum.SavedQualitySetting.Automatic,
                ["fps"] = fps
            }
        }

        game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))

        task.wait(0.5)
end
