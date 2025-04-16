-- Config.lua
local Config = {}

-- Сервисы
Config.Players = game:GetService("Players")
Config.RunService = game:GetService("RunService")
Config.UserInputService = game:GetService("UserInputService")
Config.TweenService = game:GetService("TweenService")
Config.CoreGui = game:GetService("CoreGui")
Config.Camera = workspace.CurrentCamera
Config.LocalPlayer = Config.Players.LocalPlayer

-- Настройки
Config.SETTINGS = {
    ESP = {
        Enabled = false,
        BoxColor = Color3.new(1, 0.3, 0.3),
        DistanceColor = Color3.new(1, 1, 1),
        HealthGradient = {
            Color3.new(0, 1, 0),
            Color3.new(1, 1, 0),
            Color3.new(1, 0, 0)
        },
        SnaplineEnabled = true,
        SnaplinePosition = "Center",
        RainbowEnabled = false,
    },
    Aimbot = {
        Enabled = false,
        FOV = 30,
        MaxDistance = 200,
        ShowFOV = false,
        TargetPart = "Head",
    }
}

Config.rainbowSpeed = 0.5
Config.espCache = {}

return Config
