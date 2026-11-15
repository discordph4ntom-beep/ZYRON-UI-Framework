local RunService = game:GetService("RunService")

local FPS = {}

function FPS.Start(callback)
    local frames = 0
    local elapsed = 0

    return RunService.RenderStepped:Connect(function(dt)
        frames += 1
        elapsed += dt

        if elapsed >= 1 then
            if callback then
                callback(frames)
            end

            frames = 0
            elapsed = 0
        end
    end)
end

return FPS
