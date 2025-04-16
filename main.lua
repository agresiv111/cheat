-- main.lua
-- Если файлы лежат в одном репозитории и доступны через require:
local Config = require(script.Config)
local ESP = require(script.ESP)
local Aimbot = require(script.Aimbot)
local GUI = require(script.GUI)
local AutoPeek = require(script.AutoPeek)
local Prediction = require(script.Prediction)
local GlowESP = require(script.GlowESP)
local Chams = require(script.Chams)
local KillSay = require(script.KillSay)
local AntiAFK = require(script.AntiAFK)

-- Инициализация модулей
ESP:Init()
Aimbot:Init()
GUI:Init()

print("✅ Скрипт успешно запущен!")

-- Пример привязки функции AutoPeek к клавише E:
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        AutoPeek:DoAutoPeek()
    end
end)
