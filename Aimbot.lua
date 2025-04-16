-- Aimbot.lua
local Config = require(script.Config)
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local SETTINGS = Config.SETTINGS
local Prediction = require(script.Prediction)

local Aimbot = {}

function Aimbot:getClosestPlayer()
    local closestPlayer = nil
    local minDist = math.huge
    local fov = SETTINGS.Aimbot.FOV or 70

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Config.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local vectorToPlayer = (head.Position - Camera.CFrame.Position).Unit
            local cameraDirection = Camera.CFrame.LookVector
            local angle = math.deg(math.acos(vectorToPlayer:Dot(cameraDirection)))
            if angle <= fov / 2 then
                local distance = (Camera.CFrame.Position - head.Position).Magnitude
                if distance <= SETTINGS.Aimbot.MaxDistance then
                    local ray = Ray.new(Camera.CFrame.Position, vectorToPlayer * 500)
                    local hit = workspace:FindPartOnRay(ray, Config.LocalPlayer.Character)
                    if hit and hit:IsDescendantOf(player.Character) then
                        if distance < minDist then
                            minDist = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
    end
    return closestPlayer
end

function Aimbot:aimAtTarget()
    local target = self:getClosestPlayer()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local predictedPos = (Prediction.Enabled and Prediction:GetPredictedPosition(target)) or target.Character.Head.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, predictedPos)
    end
end

function Aimbot:Init()
    game:GetService("RunService").RenderStepped:Connect(function()
        if SETTINGS.Aimbot.Enabled then
            self:aimAtTarget()
        end
    end)
end

return Aimbot
