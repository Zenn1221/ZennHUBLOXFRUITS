-- Main Script with Auto Aim, Auto Farm, and Image Button to Activate GUI

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local runService = game:GetService("RunService")
local espEnabled = {
    AutoAim = false
}

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
local imageButton = Instance.new("ImageButton")

-- Image Button Setup
imageButton.Parent = screenGui
imageButton.Size = UDim2.new(0, 200, 0, 200)  -- Size of the button
imageButton.Position = UDim2.new(0.5, -100, 0.5, -100)  -- Center of the screen
imageButton.Image = "https://raw.githubusercontent.com/Zenn1221/ZennXD/main/Screenshot_20241221-154439.png"  -- Image from GitHub

-- Function to handle button click
imageButton.MouseButton1Click:Connect(function()
    -- When button is clicked, toggle GUI or activate features
    print("Tombol ditekan, GUI muncul!")
    -- Add code here to display GUI features
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end)

-- Auto Aim Logic
local function getClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = math.huge
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestEnemy = plr
            end
        end
    end
    return closestEnemy
end

local function autoAim()
    local enemy = getClosestEnemy()
    if enemy and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = enemy.Character.HumanoidRootPart.Position
        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, targetPosition)
    end
end

-- Toggle Auto Aim
local function toggleAutoAim()
    espEnabled.AutoAim = not espEnabled.AutoAim
    if espEnabled.AutoAim then
        print("Auto Aim diaktifkan")
    else
        print("Auto Aim dinonaktifkan")
    end
end

-- Update Auto Aim Every Frame if Active
runService.Heartbeat:Connect(function()
    if espEnabled.AutoAim then
        autoAim()
    end
end)

-- Mouse Button for Activation/Deactivation
mouse.Button2Down:Connect(function()
    toggleAutoAim()
end)

mouse.Button1Down:Connect(function()
    espEnabled.AutoAim = false
    print("Auto Aim dinonaktifkan")
end)

-- Auto Farm Logic (placeholder)
local function autoFarm()
    -- Example of auto farming logic
    local closestMob = getClosestEnemy()  -- Can be replaced with mob-finding logic
    if closestMob then
        -- Move towards the mob (to simulate farming)
        -- Here you can set up movement and actions like attacking or collecting items
    end
end

-- Implement Auto Farm button or auto action
local function toggleAutoFarm()
    -- Code to toggle Auto Farm behavior
    -- Can link with other buttons or logic to perform farming actions
end

-- Finally, show GUI when script starts
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
