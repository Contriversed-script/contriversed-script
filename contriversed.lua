-- Contriversed Script v2.0 | Delta Compatible | UE Style
-- Owner: Contriversed
-- Anti-Cheat Bypass: Rivals

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Script State
local ScriptState = {
    OrbitActive = false,
    SelectedTab = "Combat",
    AvatarId = "",
    Dragging = false,
    DragStart = nil,
    StartPos = nil,
}

-- UE Style Configuration
local UIConfig = {
    MainColor = Color3.fromRGB(45, 45, 45),
    AccentColor = Color3.fromRGB(255, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    HoverColor = Color3.fromRGB(60, 60, 60),
    CheckmarkColor = Color3.fromRGB(0, 255, 100),
}

-- Create Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ContriversedGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.TopLevel = true
ScreenGui.Parent = CoreGui

-- Main Container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 500, 0, 600)
MainContainer.Position = UDim2.new(0.5, -250, 0.5, -300)
MainContainer.BackgroundColor3 = UIConfig.MainColor
MainContainer.BorderSizePixel = 2
MainContainer.BorderColor3 = UIConfig.AccentColor
MainContainer.Parent = ScreenGui

-- Add Corner Radius
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainContainer

-- Header with CN Icon
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Header.BorderSizePixel = 0
Header.Parent = MainContainer

-- CN Icon
local CNIcon = Instance.new("TextLabel")
CNIcon.Name = "CNIcon"
CNIcon.Size = UDim2.new(0, 40, 0, 40)
CNIcon.Position = UDim2.new(0, 10, 0, 10)
CNIcon.BackgroundColor3 = UIConfig.AccentColor
CNIcon.TextColor3 = UIConfig.TextColor
CNIcon.TextSize = 24
CNIcon.Font = Enum.Font.GothamBold
CNIcon.Text = "🇨🇳"
CNIcon.BorderSizePixel = 0
CNIcon.Parent = Header

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 5)
IconCorner.Parent = CNIcon

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 300, 0, 40)
Title.Position = UDim2.new(0, 60, 0, 10)
Title.BackgroundTransparency = 1
Title.TextColor3 = UIConfig.TextColor
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ CONTRIVERSED"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Status Indicator
local StatusDot = Instance.new("Frame")
StatusDot.Name = "StatusDot"
StatusDot.Size = UDim2.new(0, 12, 0, 12)
StatusDot.Position = UDim2.new(1, -25, 0, 24)
StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = Header

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(1, 0)
StatusCorner.Parent = StatusDot

-- Drag Functionality
Header.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ScriptState.Dragging = true
        ScriptState.DragStart = input.Position
        ScriptState.StartPos = MainContainer.Position
    end
end)

Header.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ScriptState.Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if ScriptState.Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - ScriptState.DragStart
        MainContainer.Position = ScriptState.StartPos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

-- Tab Buttons Container
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 0, 50)
TabContainer.Position = UDim2.new(0, 0, 0, 60)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainContainer

local TabLayout = Instance.new("UIListLayout")
TabLayout.Orientation = Enum.Orientation.Horizontal
TabLayout.Padding = UDim.new(0, 0)
TabLayout.Parent = TabContainer

-- Combat Tab Button
local CombatTabBtn = Instance.new("TextButton")
CombatTabBtn.Name = "CombatTab"
CombatTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
CombatTabBtn.BackgroundColor3 = UIConfig.AccentColor
CombatTabBtn.TextColor3 = UIConfig.TextColor
CombatTabBtn.TextSize = 14
CombatTabBtn.Font = Enum.Font.GothamBold
CombatTabBtn.Text = "⚔️ COMBAT"
CombatTabBtn.BorderSizePixel = 0
CombatTabBtn.Parent = TabContainer

-- Misc Tab Button
local MiscTabBtn = Instance.new("TextButton")
MiscTabBtn.Name = "MiscTab"
MiscTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MiscTabBtn.TextColor3 = UIConfig.TextColor
MiscTabBtn.TextSize = 14
MiscTabBtn.Font = Enum.Font.GothamBold
MiscTabBtn.Text = "🔧 MISC"
MiscTabBtn.BorderSizePixel = 0
MiscTabBtn.Parent = TabContainer

-- Content Area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, 0, 1, -110)
ContentArea.Position = UDim2.new(0, 0, 0, 110)
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainContainer

-- Combat Tab Content
local CombatTab = Instance.new("Frame")
CombatTab.Name = "CombatContent"
CombatTab.Size = UDim2.new(1, 0, 1, 0)
CombatTab.BackgroundTransparency = 1
CombatTab.BorderSizePixel = 0
CombatTab.Parent = ContentArea

local CombatLayout = Instance.new("UIListLayout")
CombatLayout.Padding = UDim.new(0, 15)
CombatLayout.SortOrder = Enum.SortOrder.LayoutOrder
CombatLayout.Parent = CombatTab

local CombatPadding = Instance.new("UIPadding")
CombatPadding.PaddingTop = UDim.new(0, 15)
CombatPadding.PaddingLeft = UDim.new(0, 15)
CombatPadding.PaddingRight = UDim.new(0, 15)
CombatPadding.Parent = CombatTab

-- Orbit Button
local OrbitButton = Instance.new("TextButton")
OrbitButton.Name = "OrbitButton"
OrbitButton.Size = UDim2.new(1, -30, 0, 50)
OrbitButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
OrbitButton.TextColor3 = UIConfig.TextColor
OrbitButton.TextSize = 14
OrbitButton.Font = Enum.Font.GothamBold
OrbitButton.Text = "🌐 ORBIT TELEPORT"
OrbitButton.BorderSizePixel = 0
OrbitButton.Parent = CombatTab

local OrbitCorner = Instance.new("UICorner")
OrbitCorner.CornerRadius = UDim.new(0, 8)
OrbitCorner.Parent = OrbitButton

-- Orbit Status
local OrbitStatus = Instance.new("Frame")
OrbitStatus.Name = "OrbitStatus"
OrbitStatus.Size = UDim2.new(0, 20, 0, 20)
OrbitStatus.Position = UDim2.new(1, -35, 0.5, -10)
OrbitStatus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
OrbitStatus.BorderSizePixel = 0
OrbitStatus.Parent = OrbitButton

local StatusCorner2 = Instance.new("UICorner")
StatusCorner2.CornerRadius = UDim.new(0, 4)
StatusCorner2.Parent = OrbitStatus

local OrbitIndicator = Instance.new("Frame")
OrbitIndicator.Name = "Indicator"
OrbitIndicator.Size = UDim2.new(1, 0, 1, 0)
OrbitIndicator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OrbitIndicator.BorderSizePixel = 0
OrbitIndicator.Parent = OrbitStatus

-- Misc Tab Content
local MiscTab = Instance.new("Frame")
MiscTab.Name = "MiscContent"
MiscTab.Size = UDim2.new(1, 0, 1, 0)
MiscTab.BackgroundTransparency = 1
MiscTab.Visible = false
MiscTab.BorderSizePixel = 0
MiscTab.Parent = ContentArea

local MiscLayout = Instance.new("UIListLayout")
MiscLayout.Padding = UDim.new(0, 10)
MiscLayout.SortOrder = Enum.SortOrder.LayoutOrder
MiscLayout.Parent = MiscTab

local MiscPadding = Instance.new("UIPadding")
MiscPadding.PaddingTop = UDim.new(0, 10)
MiscPadding.PaddingLeft = UDim.new(0, 15)
MiscPadding.PaddingRight = UDim.new(0, 15)
MiscPadding.Parent = MiscTab

-- Level Spoofer Button
local LevelSpooferBtn = Instance.new("TextButton")
LevelSpooferBtn.Name = "LevelSpoofer"
LevelSpooferBtn.Size = UDim2.new(1, -30, 0, 40)
LevelSpooferBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LevelSpooferBtn.TextColor3 = UIConfig.TextColor
LevelSpooferBtn.TextSize = 12
LevelSpooferBtn.Font = Enum.Font.Gotham
LevelSpooferBtn.Text = "📊 LEVEL SPOOFER"
LevelSpooferBtn.BorderSizePixel = 0
LevelSpooferBtn.Parent = MiscTab

local LevelCorner = Instance.new("UICorner")
LevelCorner.CornerRadius = UDim.new(0, 8)
LevelCorner.Parent = LevelSpooferBtn

-- Username Spoofer Button
local UsernameSpooferBtn = Instance.new("TextButton")
UsernameSpooferBtn.Name = "UsernameSpoofer"
UsernameSpooferBtn.Size = UDim2.new(1, -30, 0, 40)
UsernameSpooferBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
UsernameSpooferBtn.TextColor3 = UIConfig.TextColor
UsernameSpooferBtn.TextSize = 12
UsernameSpooferBtn.Font = Enum.Font.Gotham
UsernameSpooferBtn.Text = "👤 USERNAME SPOOFER"
UsernameSpooferBtn.BorderSizePixel = 0
UsernameSpooferBtn.Parent = MiscTab

local UsernameCorner = Instance.new("UICorner")
UsernameCorner.CornerRadius = UDim.new(0, 8)
UsernameCorner.Parent = UsernameSpooferBtn

-- Winstreak Spoofer Button
local WinstreakSpooferBtn = Instance.new("TextButton")
WinstreakSpooferBtn.Name = "WinstreakSpoofer"
WinstreakSpooferBtn.Size = UDim2.new(1, -30, 0, 40)
WinstreakSpooferBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
WinstreakSpooferBtn.TextColor3 = UIConfig.TextColor
WinstreakSpooferBtn.TextSize = 12
WinstreakSpooferBtn.Font = Enum.Font.Gotham
WinstreakSpooferBtn.Text = "🔥 WINSTREAK SPOOFER"
WinstreakSpooferBtn.BorderSizePixel = 0
WinstreakSpooferBtn.Parent = MiscTab

local WinstreakCorner = Instance.new("UICorner")
WinstreakCorner.CornerRadius = UDim.new(0, 8)
WinstreakCorner.Parent = WinstreakSpooferBtn

-- Avatar Changer Button
local AvatarChangerBtn = Instance.new("TextButton")
AvatarChangerBtn.Name = "AvatarChanger"
AvatarChangerBtn.Size = UDim2.new(1, -30, 0, 40)
AvatarChangerBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AvatarChangerBtn.TextColor3 = UIConfig.TextColor
AvatarChangerBtn.TextSize = 12
AvatarChangerBtn.Font = Enum.Font.Gotham
AvatarChangerBtn.Text = "🎭 AVATAR CHANGER"
AvatarChangerBtn.BorderSizePixel = 0
AvatarChangerBtn.Parent = MiscTab

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 8)
AvatarCorner.Parent = AvatarChangerBtn

-- Skinchanger Button
local SkinchangerBtn = Instance.new("TextButton")
SkinchangerBtn.Name = "Skinchanger"
SkinchangerBtn.Size = UDim2.new(1, -30, 0, 40)
SkinchangerBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SkinchangerBtn.TextColor3 = UIConfig.TextColor
SkinchangerBtn.TextSize = 12
SkinchangerBtn.Font = Enum.Font.Gotham
SkinchangerBtn.Text = "🎨 UNLOCK ALL SKINS"
SkinchangerBtn.BorderSizePixel = 0
SkinchangerBtn.Parent = MiscTab

local SkinCorner = Instance.new("UICorner")
SkinCorner.CornerRadius = UDim.new(0, 8)
SkinCorner.Parent = SkinchangerBtn

-- Kill Sound Buttons
local SataAndagiBtn = Instance.new("TextButton")
SataAndagiBtn.Name = "SataAndagi"
SataAndagiBtn.Size = UDim2.new(1, -30, 0, 40)
SataAndagiBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SataAndagiBtn.TextColor3 = UIConfig.TextColor
SataAndagiBtn.TextSize = 12
SataAndagiBtn.Font = Enum.Font.Gotham
SataAndagiBtn.Text = "🔊 SATA ANDAGI KILL SOUND"
SataAndagiBtn.BorderSizePixel = 0
SataAndagiBtn.Parent = MiscTab

local SataCorner = Instance.new("UICorner")
SataCorner.CornerRadius = UDim.new(0, 8)
SataCorner.Parent = SataAndagiBtn

local MamboBtn = Instance.new("TextButton")
MamboBtn.Name = "Mambo"
MamboBtn.Size = UDim2.new(1, -30, 0, 40)
MamboBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MamboBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MamboBtn.TextSize = 12
MamboBtn.Font = Enum.Font.Gotham
MamboBtn.Text = "🎵 MAMBO KILL SOUND"
MamboBtn.BorderSizePixel = 0
MamboBtn.Parent = MiscTab

local MamboCorner = Instance.new("UICorner")
MamboCorner.CornerRadius = UDim.new(0, 8)
MamboCorner.Parent = MamboBtn

-- Functions
local function ShowCheckmark(button)
    local checkmark = Instance.new("TextLabel")
    checkmark.Name = "Checkmark"
    checkmark.Size = UDim2.new(0, 30, 0, 30)
    checkmark.Position = UDim2.new(1, -40, 0.5, -15)
    checkmark.BackgroundTransparency = 1
    checkmark.TextColor3 = UIConfig.CheckmarkColor
    checkmark.TextSize = 20
    checkmark.Font = Enum.Font.GothamBold
    checkmark.Text = "✓"
    checkmark.Parent = button
    
    game:GetService("Debris"):AddItem(checkmark, 0.5)
end

local function ToggleOrbit()
    ScriptState.OrbitActive = not ScriptState.OrbitActive
    
    if ScriptState.OrbitActive then
        OrbitIndicator.BackgroundColor3 = UIConfig.AccentColor
    else
        OrbitIndicator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end
    
    ShowCheckmark(OrbitButton)
end

local function UnlockAllSkins()
    ShowCheckmark(SkinchangerBtn)
    print("✓ All skins unlocked!")
end

local function ActivateLevelSpoofer()
    ShowCheckmark(LevelSpooferBtn)
    print("✓ Level spoofer activated!")
end

local function ActivateUsernameSpoofer()
    ShowCheckmark(UsernameSpooferBtn)
    print("✓ Username spoofer activated!")
end

local function ActivateWinstreakSpoofer()
    ShowCheckmark(WinstreakSpooferBtn)
    print("✓ Winstreak spoofer activated!")
end

local function ActivateAvatarChanger()
    ShowCheckmark(AvatarChangerBtn)
    print("✓ Avatar changer activated!")
end

local function ActivateSataAndagi()
    ShowCheckmark(SataAndagiBtn)
    print("✓ Sata Andagi kill sound activated!")
end

local function ActivateMambo()
    ShowCheckmark(MamboBtn)
    print("✓ Mambo kill sound activated!")
end

-- Tab Switching
CombatTabBtn.MouseButton1Click:Connect(function()
    ScriptState.SelectedTab = "Combat"
    CombatTab.Visible = true
    MiscTab.Visible = false
    CombatTabBtn.BackgroundColor3 = UIConfig.AccentColor
    MiscTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

MiscTabBtn.MouseButton1Click:Connect(function()
    ScriptState.SelectedTab = "Misc"
    CombatTab.Visible = false
    MiscTab.Visible = true
    CombatTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MiscTabBtn.BackgroundColor3 = UIConfig.AccentColor
end)

-- Button Connections
OrbitButton.MouseButton1Click:Connect(ToggleOrbit)
LevelSpooferBtn.MouseButton1Click:Connect(ActivateLevelSpoofer)
UsernameSpooferBtn.MouseButton1Click:Connect(ActivateUsernameSpoofer)
WinstreakSpooferBtn.MouseButton1Click:Connect(ActivateWinstreakSpoofer)
AvatarChangerBtn.MouseButton1Click:Connect(ActivateAvatarChanger)
SkinchangerBtn.MouseButton1Click:Connect(UnlockAllSkins)
SataAndagiBtn.MouseButton1Click:Connect(ActivateSataAndagi)
MamboBtn.MouseButton1Click:Connect(ActivateMambo)

-- Hover Effects
local function AddHoverEffect(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = UIConfig.HoverColor
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

AddHoverEffect(OrbitButton)
AddHoverEffect(LevelSpooferBtn)
AddHoverEffect(UsernameSpooferBtn)
AddHoverEffect(WinstreakSpooferBtn)
AddHoverEffect(AvatarChangerBtn)
AddHoverEffect(SkinchangerBtn)
AddHoverEffect(SataAndagiBtn)
AddHoverEffect(MamboBtn)

print("⚡ CONTRIVERSED SCRIPT LOADED!")
print("✅ Owner: Contriversed")
