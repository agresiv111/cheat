-- Chams.lua
local Chams = {}

Chams.Enabled = false
Chams.ChamColor = Color3.new(1, 0, 1)
Chams.Transparency = 0.5

function Chams:ApplyChams(character)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = math.min(Chams.Transparency, part.Transparency)
            part.Color = Chams.ChamColor
        end
    end
end

return Chams
