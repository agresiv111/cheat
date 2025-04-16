-- GUI.lua
local Config = require(script.Config)
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera
local SETTINGS = Config.SETTINGS

local GUI = {}

function GUI:Init()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ScriptGUI"
    screenGui.Parent = Config.CoreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 1000

    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 370, 0, 300)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.ZIndex = 100
    frame.Parent = screenGui

    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    titleBar.BorderSizePixel = 0
    titleBar.ZIndex = 101
    titleBar.Parent = frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(0, 180, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Text = "whoamhoam v1.1.0"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 20, 0, 20)
    minimizeButton.Position = UDim2.new(1, -25, 0, 5)
    minimizeButton.BackgroundColor3 = Color3.new(1, 0, 0)
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.Text = "-"
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextSize = 14
    minimizeButton.ZIndex = 102
    minimizeButton.Parent = titleBar

    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "TabsFrame"
    tabsFrame.Size = UDim2.new(0, 150, 0, frame.Size.Y.Offset - titleBar.Size.Y.Offset)
    tabsFrame.Position = UDim2.new(0, 0, 0, titleBar.Size.Y.Offset)
    tabsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    tabsFrame.BorderSizePixel = 0
    tabsFrame.ZIndex = 101
    tabsFrame.Parent = frame

    local espTabButton = Instance.new("TextButton")
    espTabButton.Name = "ESPTabButton"
    espTabButton.Size = UDim2.new(1, -10, 0, 40)
    espTabButton.Position = UDim2.new(0, 5, 0, 10)
    espTabButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    espTabButton.TextColor3 = Color3.new(1, 1, 1)
    espTabButton.Text = "ESP"
    espTabButton.Font = Enum.Font.GothamBold
    espTabButton.TextSize = 14
    espTabButton.ZIndex = 102
    espTabButton.Parent = tabsFrame

    local aimbotTabButton = Instance.new("TextButton")
    aimbotTabButton.Name = "AimbotTabButton"
    aimbotTabButton.Size = UDim2.new(1, -10, 0, 40)
    aimbotTabButton.Position = UDim2.new(0, 5, 0, 60)
    aimbotTabButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    aimbotTabButton.TextColor3 = Color3.new(1, 1, 1)
    aimbotTabButton.Text = "Aimbot"
    aimbotTabButton.Font = Enum.Font.GothamBold
    aimbotTabButton.TextSize = 14
    aimbotTabButton.ZIndex = 102
    aimbotTabButton.Parent = tabsFrame

    local espTabContent = Instance.new("Frame")
    espTabContent.Name = "ESPTabContent"
    espTabContent.Size = UDim2.new(0, frame.Size.X.Offset - tabsFrame.Size.X.Offset - 20, 0, frame.Size.Y.Offset - titleBar.Size.Y.Offset - 20)
    espTabContent.Position = UDim2.new(0, tabsFrame.Size.X.Offset + 10, 0, titleBar.Size.Y.Offset + 10)
    espTabContent.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    espTabContent.BorderSizePixel = 0
    espTabContent.ZIndex = 101
    espTabContent.Parent = frame

    local aimbotTabContent = Instance.new("Frame")
    aimbotTabContent.Name = "AimbotTabContent"
    aimbotTabContent.Size = espTabContent.Size
    aimbotTabContent.Position = espTabContent.Position
    aimbotTabContent.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    aimbotTabContent.BorderSizePixel = 0
    aimbotTabContent.ZIndex = 101
    aimbotTabContent.Parent = frame
    aimbotTabContent.Visible = false

    -- Добавляем кнопки для новых функций (AutoPeek, KillSay, AntiAFK)
    local autoPeekButton = Instance.new("TextButton")
    autoPeekButton.Name = "AutoPeekButton"
    autoPeekButton.Size = UDim2.new(0, 180, 0, 30)
    autoPeekButton.Position = UDim2.new(0, 10, 0, 10)
    autoPeekButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    autoPeekButton.TextColor3 = Color3.new(1, 1, 1)
    autoPeekButton.Text = "Auto Peek"
    autoPeekButton.Font = Enum.Font.GothamBold
    autoPeekButton.TextSize = 14
    autoPeekButton.ZIndex = 101
    autoPeekButton.Parent = espTabContent
    autoPeekButton.MouseButton1Click:Connect(function()
        require(script.Parent.AutoPeek):DoAutoPeek()
    end)

    local killSayButton = Instance.new("TextButton")
    killSayButton.Name = "KillSayButton"
    killSayButton.Size = UDim2.new(0, 180, 0, 30)
    killSayButton.Position = UDim2.new(0, 10, 0, 50)
    killSayButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    killSayButton.TextColor3 = Color3.new(1, 1, 1)
    killSayButton.Text = "KillSay"
    killSayButton.Font = Enum.Font.GothamBold
    killSayButton.TextSize = 14
    killSayButton.ZIndex = 101
    killSayButton.Parent = espTabContent
    killSayButton.MouseButton1Click:Connect(function()
        require(script.Parent.KillSay):DoKillSay("Nice Shot!")
    end)

    local antiAFKButton = Instance.new("TextButton")
    antiAFKButton.Name = "AntiAFKButton"
    antiAFKButton.Size = UDim2.new(0, 180, 0, 30)
    antiAFKButton.Position = UDim2.new(0, 10, 0, 90)
    antiAFKButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    antiAFKButton.TextColor3 = Color3.new(1, 1, 1)
    antiAFKButton.Text = "Toggle Anti-AFK"
    antiAFKButton.Font = Enum.Font.GothamBold
    antiAFKButton.TextSize = 14
    antiAFKButton.ZIndex = 101
    antiAFKButton.Parent = espTabContent
    antiAFKButton.MouseButton1Click:Connect(function()
        require(script.Parent.AntiAFK):ToggleAntiAFK()
    end)

    -- Переключение вкладок
    espTabButton.MouseButton1Click:Connect(function()
        espTabContent.Visible = true
        aimbotTabContent.Visible = false
    end)
    aimbotTabButton.MouseButton1Click:Connect(function()
        espTabContent.Visible = false
        aimbotTabContent.Visible = true
    end)
    
    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)
    
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightShift then
            frame.Visible = not frame.Visible
        end
    end)
end

return GUI
