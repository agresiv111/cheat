-- KillSay.lua
local KillSay = {}

KillSay.Enabled = false  -- Включай, когда необходимо
KillSay.Messages = {
    "Gotcha!",
    "You got clapped!",
    "Another one bites the dust!",
    "Nice shot!"
}

function KillSay:DoKillSay(message)
    if not KillSay.Enabled then return end
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = message,
        Color = Color3.new(1, 0, 0),
        Font = Enum.Font.GothamBold,
        TextSize = 18
    })
end

return KillSay
