local Theme = {}

function Theme.Apply(instance, config)
    if instance:IsA("GuiObject") then
        instance.BackgroundColor3 = config.Panel
    end

    if instance:IsA("TextLabel") or instance:IsA("TextButton") then
        instance.TextColor3 = config.Text
    end
end

return Theme
