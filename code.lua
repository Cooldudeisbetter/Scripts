local function send(res,mem,fps)
    local args = {
        [1] = {
            ["res"] = res --[[Vector2]],
            ["mem"] = mem,
            ["t"] = "metrics",
            ["gfx"] = Enum.SavedQualitySetting.Automatic,
            ["fps"] = 59.84706857657344
        }
    }

    game:GetService("ReplicatedStorage").nya:FireServer(unpack(args))
end

