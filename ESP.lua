-- ESP.lua
local Config = require(script.Config)
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local SETTINGS = Config.SETTINGS
local rainbowSpeed = Config.rainbowSpeed
local espCache = Config.espCache

local ESP = {}

function ESP:createESP(player)
    if player == Config.LocalPlayer then return end
    local drawings = {
        Box = Drawing.new("Square"),
        HealthBar = Drawing.new("Square"),
        Distance = Drawing.new("Text"),
        Snapline = Drawing.new("Line")
    }
    for _, v in pairs(drawings) do
        v.Visible = false
        if v.Type == "Square" then
            v.Thickness = 2
            v.Filled = false
        end
    end
    drawings.Box.Color = SETTINGS.ESP.BoxColor
    drawings.HealthBar.Filled = true
    drawings.Distance.Size = 16
    drawings.Distance.Center = true
    drawings.Distance.Color = SETTINGS.ESP.DistanceColor
    drawings.Snapline.Color = SETTINGS.ESP.BoxColor
    espCache[player] = drawings
end

function ESP:updateESP(player, drawings)
    if not SETTINGS.ESP.Enabled or not player.Character then
        for _, v in pairs(drawings) do v.Visible = false end
        return
    end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local head = player.Character:FindFirstChild("Head")
    if not humanoid or humanoid.Health <= 0 or not head then
        for _, v in pairs(drawings) do v.Visible = false end
        return
    end
    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
    if not onScreen then
        for _, v in pairs(drawings) do v.Visible = false end
        return
    end
    local distance = (head.Position - Camera.CFrame.Position).Magnitude
    local size = 1000 / distance
    drawings.Box.Size = Vector2.new(size, size * 1.5)
    drawings.Box.Position = Vector2.new(screenPos.X - size/2, screenPos.Y - size * 0.75)
    drawings.Box.Visible = true
    
    local healthPercent = humanoid.Health / humanoid.MaxHealth
    local colorIndex = math.clamp(3 - healthPercent * 2, 1, 3)
    local color = SETTINGS.ESP.HealthGradient[math.floor(colorIndex)]:Lerp(
        SETTINGS.ESP.HealthGradient[math.ceil(colorIndex)],
        colorIndex % 1
    )
    drawings.HealthBar.Size = Vector2.new(4, size * 1.5 * healthPercent)
    drawings.HealthBar.Position = Vector2.new(screenPos.X + size/2 + 5, screenPos.Y - size * 0.75 + (size * 1.5 * (1 - healthPercent)))
    drawings.HealthBar.Color = color
    drawings.HealthBar.Visible = true
    drawings.Distance.Text = math.floor(distance) .. "m"
    drawings.Distance.Position = Vector2.new(screenPos.X, screenPos.Y + size * 0.75 + 10)
    drawings.Distance.Visible = true
    
    if SETTINGS.ESP.RainbowEnabled then
        local hue = (tick() * rainbowSpeed) % 1
        drawings.Snapline.Color = Color3.fromHSV(hue, 1, 1)
        drawings.Box.Color = Color3.fromHSV(hue, 1, 1)
    else
        drawings.Snapline.Color = SETTINGS.ESP.BoxColor
        drawings.Box.Color = SETTINGS.ESP.BoxColor
    end
    
    if SETTINGS.ESP.SnaplineEnabled then
        drawings.Snapline.From = Vector2.new(screenPos.X, screenPos.Y + size * 0.75)
        local snaplineY
        if SETTINGS.ESP.SnaplinePosition == "Bottom" then
            snaplineY = Camera.ViewportSize.Y
        elseif SETTINGS.ESP.SnaplinePosition == "Top" then
            snaplineY = 0
        else
            snaplineY = Camera.ViewportSize.Y / 2
        end
        drawings.Snapline.To = Vector2.new(Camera.ViewportSize.X / 2, snaplineY)
        drawings.Snapline.Visible = true
    else
        drawings.Snapline.Visible = false
    end
end

function ESP:Init()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Config.LocalPlayer then
            self:createESP(player)
        end
    end
    Players.PlayerAdded:Connect(function(player)
        self:createESP(player)
        player.CharacterAdded:Connect(function()
            if espCache[player] then
                for _, drawing in pairs(espCache[player]) do
                    pcall(function() drawing:Remove() end)
                end
                espCache[player] = nil
            end
            self:createESP(player)
        end)
        player.CharacterRemoving:Connect(function()
            if espCache[player] then
                for _, drawing in pairs(espCache[player]) do
                    pcall(function() drawing:Remove() end)
                end
                espCache[player] = nil
            end
        end)
    end)
    Players.PlayerRemoving:Connect(function(player)
        if espCache[player] then
            for _, drawing in pairs(espCache[player]) do
                pcall(function() drawing:Remove() end)
            end
            espCache[player] = nil
        end
    end)
end

ESP.espCache = espCache
return ESP
