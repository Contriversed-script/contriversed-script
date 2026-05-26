-- Contriversed Script v3.0 - TEST VERSION
-- Owner: Contriversed
local CoreGui = game:GetService("CoreGui")

print("🟢 Script Loading...")

-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ContriversedGUI_Test"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.TopLevel = true
ScreenGui.Parent = CoreGui

print("🟢 ScreenGui created")

-- Create Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Parent = ScreenGui

print("🟢 MainFrame created")

-- Test Label
local TestLabel = Instance.new("TextLabel")
TestLabel.Name = "TestLabel"
TestLabel.Size = UDim2.new(1, 0, 0.3, 0)
TestLabel.Position = UDim2.new(0, 0, 0.1, 0)
TestLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TestLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TestLabel.TextSize = 24
TestLabel.Font = Enum.Font.GothamBold
TestLabel.Text = "🇨🇳 CONTRIVERSED"
TestLabel.BorderSizePixel = 0
TestLabel.Parent = MainFrame

print("🟢 TestLabel created")

-- Combat Button
local CombatBtn = Instance.new("TextButton")
CombatBtn.Name = "CombatBtn"
CombatBtn.Size = UDim2.new(0.9, 0, 0.2, 0)
CombatBtn.Position = UDim2.new(0.05, 0, 0.5, 0)
CombatBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CombatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatBtn.TextSize = 16
CombatBtn.Font = Enum.Font.GothamBold
CombatBtn.Text = "⚔️ ORBIT TELEPORT"
CombatBtn.BorderSizePixel = 0
CombatBtn.Parent = MainFrame

print("🟢 CombatBtn created")

-- Misc Button
local MiscBtn = Instance.new("TextButton")
MiscBtn.Name = "MiscBtn"
MiscBtn.Size = UDim2.new(0.9, 0, 0.2, 0)
MiscBtn.Position = UDim2.new(0.05, 0, 0.75, 0)
MiscBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MiscBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscBtn.TextSize = 16
MiscBtn.Font = Enum.Font.GothamBold
MiscBtn.Text = "🔧 MISC TAB"
MiscBtn.BorderSizePixel = 0
MiscBtn.Parent = MainFrame

print("🟢 MiscBtn created")

-- Button interactions
CombatBtn.MouseButton1Click:Connect(function()
    print("✓ Combat button clicked!")
end)

MiscBtn.MouseButton1Click:Connect(function()
    print("✓ Misc button clicked!")
end)

print("🟢 CONTRIVERSED TEST GUI LOADED!")
print("✅ Check if you see a red-bordered window with CN icon")
