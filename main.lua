-- Загружаем модули
local Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/Config.lua"))()
local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/GUI.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/ESP.lua"))()
local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/Aimbot.lua"))()
local AutoPeek = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/AutoPeek.lua"))()
local Prediction = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/Prediction.lua"))()
local GlowESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/GlowESP.lua"))()
local Chams = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/Chams.lua"))()
local KillSay = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/KillSay.lua"))()
local AntiAFK = loadstring(game:HttpGet("https://raw.githubusercontent.com/agresiv111/cheat/refs/heads/main/AntiAFK.lua"))()

-- Запуск основного GUI (если нужно)
if GUI and GUI.Init then
    GUI.Init()
end

-- Включаем читы (если в модулях есть стартовые функции)
if Aimbot and Aimbot.Init then
    Aimbot.Init()
end

if ESP and ESP.Init then
    ESP.Init()
end

if AutoPeek and AutoPeek.Enable then
    AutoPeek.Enable()
end

if GlowESP and GlowESP.Enable then
    GlowESP.Enable()
end

if Chams and Chams.Enable then
    Chams.Enable()
end

if KillSay and KillSay.Start then
    KillSay.Start()
end

if AntiAFK and AntiAFK.Enable then
    AntiAFK.Enable()
end
