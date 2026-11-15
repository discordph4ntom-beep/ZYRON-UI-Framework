local Config = require(script.Parent.Parent.config)

local Sliders = {}

function Sliders.Create(parent, text, minimum, maximum, default, callback)
    local current = math.clamp(default, minimum, maximum)

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Config.Theme.Secondary
    button.TextColor3 = Config.Theme.Text
    button.Text = text .. " : " .. current
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.Parent = parent

    button.Activated:Connect(function()
        current += 1

        if current > maximum then
            current = minimum
        end

        button.Text = text .. " : " .. current

        if callback then
            callback(current)
        end
    end)

    return button
end

return Sliders
