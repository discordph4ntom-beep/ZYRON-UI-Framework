local Players = game:GetService("Players")

local ZYRON = {
    Version = "1.0.0",
    Name = "ZYRON",
    Modules = {}
}

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Config = require(script.Parent.config)
local Window = require(script.Parent.core.window)

ZYRON.Config = Config
ZYRON.UI = Window.new()

function ZYRON:Start()
    self.UI:Create()
    print("[ZYRON] Framework initialized")
end

function ZYRON:Destroy()
    self.UI:Destroy()
end

ZYRON:Start()

return ZYRON
