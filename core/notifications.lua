local Players = game:GetService("Players")

local Notifications = {}

function Notifications.Show(title, message)
    local player = Players.LocalPlayer
    local gui = player.PlayerGui:FindFirstChild("ZYRON_Notifications")

    if not gui then
        gui = Instance.new("ScreenGui")
        gui.Name = "ZYRON_Notifications"
        gui.ResetOnSpawn = false
        gui.Parent = player.PlayerGui
    end

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(280, 75)
    frame.Position = UDim2.new(1, -300, 1, -100)
    frame.BackgroundColor3 = Color3.fromRGB(23, 19, 32)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    Instance.new("UICorner", frame).CornerRadius =
        UDim.new(0, 10)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.fromOffset(10, 5)
    label.BackgroundTransparency = 1
    label.Text = title
    label.TextColor3 = Color3.fromRGB(196, 181, 253)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = frame

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -20, 0, 35)
    body.Position = UDim2.fromOffset(10, 32)
    body.BackgroundTransparency = 1
    body.Text = message
    body.TextColor3 = Color3.new(1, 1, 1)
    body.Font = Enum.Font.Gotham
    body.TextSize = 12
    body.Parent = frame

    task.delay(3, function()
        if frame.Parent then
            frame:Destroy()
        end
    end)
end

return Notifications
