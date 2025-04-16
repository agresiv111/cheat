-- GlowESP.lua
local GlowESP = {}

GlowESP.Enabled = false
GlowESP.GlowColor = Color3.new(0, 1, 1)
GlowESP.GlowThickness = 2

function GlowESP:ApplyGlow(object)
    if object:IsA("BasePart") then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = GlowESP.GlowColor
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = object
        return highlight
    end
end

function GlowESP:RemoveGlow(highlight)
    if highlight and highlight:IsA("Highlight") then
        highlight:Destroy()
    end
end

return GlowESP
