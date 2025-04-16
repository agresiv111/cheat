-- AutoPeek.lua
local AutoPeek = {}

AutoPeek.PeekDistance = 5   -- расстояние вылета
AutoPeek.PeekTime = 0.5     -- время нахождения вне укрытия

function AutoPeek:DoAutoPeek()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local originalPosition = hrp.Position
    local peekDirection = hrp.CFrame.LookVector * AutoPeek.PeekDistance

    hrp.CFrame = hrp.CFrame + peekDirection
    wait(AutoPeek.PeekTime)
    hrp.CFrame = CFrame.new(originalPosition)
end

return AutoPeek
