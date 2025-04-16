-- AntiAFK.lua
local AntiAFK = {}

AntiAFK.Enabled = false
local antiAfkConnection

function AntiAFK:ToggleAntiAFK()
    AntiAFK.Enabled = not AntiAFK.Enabled
    if AntiAFK.Enabled then
        self:Start()
    else
        self:Stop()
    end
end

function AntiAFK:Start()
    antiAfkConnection = game:GetService("RunService").Heartbeat:Connect(function()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end)
end

function AntiAFK:Stop()
    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
    end
end

return AntiAFK
