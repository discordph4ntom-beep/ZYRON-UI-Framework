local Sidebar = {}

function Sidebar.Create(parent, names, callback)
    local result = {}

    for _, name in ipairs(names) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 0, 35)
        button.Text = name
        button.Parent = parent

        button.Activated:Connect(function()
            if callback then
                callback(name)
            end
        end)

        result[name] = button
    end

    return result
end

return Sidebar
