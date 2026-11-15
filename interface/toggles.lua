local Config = require(script.Parent.Parent.config)

local Toggles = {}

function Toggles.Create(parent, text, default, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Config.Theme.Secondary
    button.TextColor3 = Config.Theme.Text
    button.Text = text .. " : " .. (default and "ON" or "OFF")
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.Parent = parent

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    local enabled = default == true

    button.Activated:Connect(function()
        enabled = not enabled

        button.Text = text .. " : " ..
            (enabled and "ON" or "OFF")

        button.BackgroundColor3 = enabled
            and Config.Theme.Accent
            or Config.Theme.Secondary

        if callback then
            callback(enabled)
        end
    end)

    return {
        Get = function()
            return enabled
        end
    }
end

return Toggles
