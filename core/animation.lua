local TweenService = game:GetService("TweenService")

local Animation = {}

function Animation.Tween(object, duration, properties)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

return Animation
