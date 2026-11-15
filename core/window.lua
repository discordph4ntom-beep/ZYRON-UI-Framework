local Config = require(script.Parent.Parent.config)
local Animation = require(script.Parent.animation)

local Window = {}
Window.__index = Window

function Window.new()
    return setmetatable({}, Window)
end

function Window:Create()
    local player = game.Players.LocalPlayer

    local gui = Instance.new("ScreenGui")
    gui.Name = "ZYRON_UI"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui

    self.Gui = gui

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Size = UDim2.fromOffset(0, 0)
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Config.Theme.Background
    main.BorderSizePixel = 0
    main.Parent = gui

    self.Main = main

    Instance.new("UICorner", main).CornerRadius =
        UDim.new(0, 12)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Config.Theme.Accent
    stroke.Transparency = 0.4
    stroke.Parent = main

    local topbar = Instance.new("Frame")
    topbar.Size = UDim2.new(1, 0, 0, 48)
    topbar.BackgroundColor3 = Config.Theme.Panel
    topbar.BorderSizePixel = 0
    topbar.Parent = main

    Instance.new("UICorner", topbar).CornerRadius =
        UDim.new(0, 12)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -60, 1, 0)
    title.Position = UDim2.fromOffset(15, 0)
    title.BackgroundTransparency = 1
    title.Text = "ZYRON  |  ULTIMATE"
    title.TextColor3 = Config.Theme.Text
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topbar

    local close = Instance.new("TextButton")
    close.Size = UDim2.fromOffset(35, 30)
    close.Position = UDim2.new(1, -43, 0, 9)
    close.Text = "×"
    close.TextSize = 20
    close.TextColor3 = Config.Theme.Text
    close.BackgroundColor3 = Config.Theme.Secondary
    close.Parent = topbar

    close.Activated:Connect(function()
        self:Destroy()
    end)

    Animation.Tween(main, 0.35, {
        Size = UDim2.fromOffset(
            Config.Window.Width,
            Config.Window.Height
        )
    })

    self.Tabs = {}

    self:AddTab("Visuals")
    self:AddTab("Players")
    self:AddTab("Settings")
end

function Window:AddTab(name)
    local sidebar = self.Main:FindFirstChild("Sidebar")

    if not sidebar then
        sidebar = Instance.new("Frame")
        sidebar.Name = "Sidebar"
        sidebar.Position = UDim2.fromOffset(12, 60)
        sidebar.Size = UDim2.new(0, 140, 1, -72)
        sidebar.BackgroundColor3 = Config.Theme.Panel
        sidebar.BorderSizePixel = 0
        sidebar.Parent = self.Main

        Instance.new("UICorner", sidebar).CornerRadius =
            UDim.new(0, 8)

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 7)
        layout.Parent = sidebar

        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 8)
        padding.PaddingLeft = UDim.new(0, 8)
        padding.PaddingRight = UDim.new(0, 8)
        padding.Parent = sidebar
    end

    local content = self.Main:FindFirstChild("Content")

    if not content then
        content = Instance.new("Frame")
        content.Name = "Content"
        content.Position = UDim2.fromOffset(164, 60)
        content.Size = UDim2.new(1, -176, 1, -72)
        content.BackgroundColor3 = Config.Theme.Panel
        content.BorderSizePixel = 0
        content.Parent = self.Main

        Instance.new("UICorner", content).CornerRadius =
            UDim.new(0, 8)
    end

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 35)
    button.BackgroundColor3 = Config.Theme.Secondary
    button.Text = name
    button.TextColor3 = Config.Theme.Text
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.Parent = sidebar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 6)

    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.Visible = false
    page.Parent = content

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.Parent = page

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.fromOffset(
            0,
            layout.AbsoluteContentSize.Y + 20
        )
    end)

    button.Activated:Connect(function()
        for _, item in pairs(self.Tabs) do
            item.Visible = false
        end

        page.Visible = true
    end)

    table.insert(self.Tabs, page)

    if #self.Tabs == 1 then
        page.Visible = true
    end

    return page
end

function Window:Destroy()
    if self.Gui then
        self.Gui:Destroy()
    end
end

return Window
