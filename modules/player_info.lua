local Players = game:GetService("Players")

local PlayerInfo = {}

function PlayerInfo.Get()
    local player = Players.LocalPlayer

    return {
        Name = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        AccountAge = player.AccountAge
    }
end

return PlayerInfo
