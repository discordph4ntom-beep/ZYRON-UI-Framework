-- Module de visualisation pour une expérience de test personnelle.
local Visuals = {
    Enabled = false
}

function Visuals.SetEnabled(value)
    Visuals.Enabled = value == true
    print("[ZYRON] Visualizer:", Visuals.Enabled)
end

return Visuals
