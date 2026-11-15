local Config = require(script.Parent.Parent.config)
local Animation = require(script.Parent.Parent.core.animation)

local Buttons = {}

function Buttons.Create(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 38)
    button.BackgroundColor3 = Config.Theme.Secondary
    button.Text = text
    button.TextColor3 = Config.Theme.Text
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.AutoButtonColor = false
    button.Parent = parent

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    button.MouseEnter:Connect(function()
        Animation.Tween(button, 0.15, {
            BackgroundColor3 = Config.Theme.Accent
        })
    end)

    button.MouseLeave:Connect(function()
        Animation.Tween(button, 0.15, {
            BackgroundColor3 = Config.Theme.Secondary
        })
    end)

    button.Activated:Connect(function()
        if callback then callback() end
    end)

    return button
end

return Buttons
