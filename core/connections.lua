local Connections = {}
Connections.__index = Connections

function Connections.new()
    return setmetatable({
        Items = {}
    }, Connections)
end

function Connections:Add(connection)
    table.insert(self.Items, connection)
    return connection
end

function Connections:Clear()
    for _, connection in ipairs(self.Items) do
        if connection.Connected then
            connection:Disconnect()
        end
    end

    table.clear(self.Items)
end

return Connections
