-- Prediction.lua
local Prediction = {}

Prediction.Enabled = false
Prediction.PredictionFactor = 0.2

function Prediction:GetPredictedPosition(target)
    if not target or not target.Character then return nil end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local velocity = hrp.Velocity
    return hrp.Position + (velocity * Prediction.PredictionFactor)
end

return Prediction
