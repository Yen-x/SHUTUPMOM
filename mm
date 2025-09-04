
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("I LOVE YOU")

local serv = win:Server("Hi", "")

local btns = serv:Channel("Main")




--gg

btns:Button("Kill All", function()
for i,v in pairs(game:GetService("Players"):GetChildren()) do
if v ~= game.Players.LocalPlayer then
local args = {
    [1] = v.Character.Humanoid,
    [2] = CFrame.new(nil, nil, nil) * CFrame.Angles(1.5662832260131836, 0.14169052243232727, -1.5271109342575073),
    [3] = 999999,
    [4] = 0,
    [5] = Vector3.new(nil, nil, nil),
    [6] = "rbxassetid://241837157",
    [7] = 0.075,
    [8] = nil --[[Color3]],
    [9] = "rbxassetid://260430079",
    [10] = 1.1,
    [11] = 2
}

game:GetService("ReplicatedStorage").Damage:FireServer(unpack(args))
        end
    end
end)

btns:Button("Fling All", function()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = v.Character.Humanoid,
                [2] = 0,
                [3] = 1,
                [4] = Vector3.new(9999999, 9999999, 9999999)
            }

            game:GetService("ReplicatedStorage").AnubisDamage2:FireServer(unpack(args))
        end
    end
end)


btns:Button("Freeze All", function()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
            local args = {
                [1] = v.Character.Humanoid,
                [2] = 0,
                [3] = 5000,
                [4] = Vector3.new(0, 0, 0)
            }

            game:GetService("ReplicatedStorage").AnubisDamage2:FireServer(unpack(args))
        end
    end
end)


btns:Button("Green Screen Land (BTD)", function()
local args = {
    [1] = 0,
    [2] = CFrame.new(0, 0, 0) * CFrame.Angles(3.141592502593994, 0.4932374656200409, -3.141592502593994),
    [3] = CFrame.new(50, 10, 0) * CFrame.Angles(-0, 0.008891196921467781, -0),
    [4] = 22,
    [5] = 1000000000000,
    [6] = 8.799999999999985
}

game:GetService("ReplicatedStorage").BTDDamage:FireServer(unpack(args))

end)

btns:Seperator()


btns:Toggle("Item", false, function(state)
    getgenv().GrabItem = state
    while getgenv().GrabItem do
        local mychar = game.Players.LocalPlayer.Character
        if mychar and mychar:FindFirstChild("Humanoid") then
            for _, v in pairs(workspace:GetChildren()) do
                if v:IsA("Tool") then
                    mychar.Humanoid:EquipTool(v)
                end
            end
        end
        task.wait(1)
    end
end)

btns:Toggle("Use Banknotes", false, function(lol)
    getgenv().Money = lol
		getgenv().Money = lol
        while getgenv().Money do
			if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banknote") then
				myhum = game.Players.LocalPlayer.Character.Humanoid
				myhum:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banknote"))
				task.wait(5)
				local vuser = game:GetService("VirtualUser")
				vuser:CaptureController()
				vuser:ClickButton1(Vector2.new())

        end
    end

end)





local tgls = serv:Channel("Local Player")

tgls:Button("Anti AFK", function()
    local vu = game:GetService("VirtualUser")

    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        DiscordLib:Notification("Notification", "Anti Afk Enabled", "")
    end)
end)

tgls:Seperator()

tgls:Button("God", function()

local args = {
        [1] = "LuigiStand",
        [2] = 25,
        [3] = 1000000
}

game:GetService("ReplicatedStorage").Stand:FireServer(unpack(args))
DiscordLib:Notification("Notification", "You're... God..!", "")

end)

tgls:Seperator()

tgls:Toggle("Auto Heal", false, function(state)
    getgenv().youregod = state
    while getgenv().youregod do
                local args = {
                    [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
                    [2] = CFrame.new(0, 0, 0) * CFrame.Angles(1.6280592679977417, 0.2713378667831421, -0.344007670879364),
                    [3] = 1000,
                    [4] = 0,
                    [6] = "rbxassetid://245751634",
                    [7] = 0.075,
                    [9] = "rbxassetid://2914074987",
                    [10] = 2.2,
                    [11] = 0.9
                }
                ReplicatedStorage.Heal5:FireServer(unpack(args))
        task.wait(0.7) -- delay between heals
    end
end)

tgls:Toggle("No Ragdoll", false, function(Value)
    getgenv().getup = Value
end)

-- Wrap the hook logic into one clean function
local function autoGetUp()
    local rs = game:GetService("ReplicatedStorage")
    local Knocked = rs:WaitForChild("Knocked")
    local GetUp = rs:WaitForChild("GetUp")

    -- Hook once
    if getgenv()._antiRagdollHooked then return end
    getgenv()._antiRagdollHooked = true

    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "FireServer" and self == Knocked and getgenv().getup == true then
            task.spawn(function()
                task.wait(0.05)
                GetUp:FireServer()
            end)
        end
        return old(self, ...)
    end)
end

-- Just call it once somewhere
autoGetUp()







local drops = serv:Channel("Dropdowns")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- keep track of the selected player name globally
getgenv().selectedName = nil

-- Dropdown
local drop = drops:Dropdown("Auto Heal Player", {}, function(name)
    print("Selected:", name)
    getgenv().selectedName = name

    local Healplayer = Players:FindFirstChild(name)
    if Healplayer and Healplayer.Character and Healplayer.Character:FindFirstChild("Humanoid") then
        local args = {
            [1] = Healplayer.Character.Humanoid,
            [2] = CFrame.new(0, 0, 0) * CFrame.Angles(1.6280592679977417, 0.2713378667831421, -0.344007670879364),
            [3] = 1000,
            [4] = 0,
            [6] = "rbxassetid://245751634",
            [7] = 0.075,
            [9] = "rbxassetid://2914074987",
            [10] = 2.2,
            [11] = 0.9
        }
        ReplicatedStorage.Heal5:FireServer(unpack(args))
    else
        warn("Player has died/left the server.", name)
    end
end)

-- function to refresh dropdown list
local function refreshPlayers()
    drop:Clear()
    for _, p in ipairs(Players:GetPlayers()) do
        drop:Add(p.Name)
    end
end

-- fill initially
refreshPlayers()

-- update whenever someone joins/leaves
Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

-- Toggle (must stay after dropdown creation so it doesn’t get wiped)
drops:Toggle("AUTO HEAL PLAYER", false, function(state)
    getgenv().hello = state
    while getgenv().hello do
        if getgenv().selectedName then
            local Healplayer = Players:FindFirstChild(getgenv().selectedName)
            if Healplayer and Healplayer.Character and Healplayer.Character:FindFirstChild("Humanoid") then
                local args = {
                    [1] = Healplayer.Character.Humanoid,
                    [2] = CFrame.new(0, 0, 0) * CFrame.Angles(1.6280592679977417, 0.2713378667831421, -0.344007670879364),
                    [3] = 1000,
                    [4] = 0,
                    [6] = "rbxassetid://245751634",
                    [7] = 0.075,
                    [9] = "rbxassetid://2914074987",
                    [10] = 2.2,
                    [11] = 0.9
                }
                ReplicatedStorage.Heal5:FireServer(unpack(args))
            end
        end
        task.wait(0.7)
    end
end)


tgls:Seperator()


--Freeze
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


-- keep track of the selected player name globally
getgenv().selectedName = nil

-- Dropdown (start empty, fill later)
local drop = drops:Dropdown("Freeze", {}, function(name)
    print("Froze:", name)
    getgenv().selectedName = name
    local freezeplayer = Players:FindFirstChild(name)
    if freezeplayer and freezeplayer.Character and freezeplayer.Character:FindFirstChild("Humanoid") then

local args = {
    [1] = freezeplayer.Character.Humanoid,
    [2] = 0,
    [3] = 5000,
    [4] = Vector3.new(nil, nil, nil)
}

game:GetService("ReplicatedStorage").AnubisDamage2:FireServer(unpack(args))
    else
        warn("Player has died/left the server.", name)
    end
end)



--Fling
local function refreshPlayers()
    drop:Clear()
    for _, p in ipairs(Players:GetPlayers()) do
        drop:Add(p.Name)
    end
end

refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().selectedName = nil

--Dropdown
local drop = drops:Dropdown("Fling", {}, function(name)
    print("Flung:", name)
    getgenv().selectedName = name
    local flingplayer = Players:FindFirstChild(name)
    if flingplayer and flingplayer.Character and flingplayer.Character:FindFirstChild("Humanoid") then

local args = {
    [1] = flingplayer.Character.Humanoid,
    [2] = 0,
    [3] = 0.1,
    [4] = Vector3.new(100000, 100000, 100000)
}

game:GetService("ReplicatedStorage").AnubisDamage2:FireServer(unpack(args))
    else
        warn("Player has died/left the server.", name)
    end
end)

local function refreshPlayers()
    drop:Clear()
    for _, p in ipairs(Players:GetPlayers()) do
        drop:Add(p.Name)
    end
end

refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

--Fling
local function refreshPlayers()
    drop:Clear()
    for _, p in ipairs(Players:GetPlayers()) do
        drop:Add(p.Name)
    end
end

refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)




--Teleport
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().selectedName = nil

--Dropdown
local drop = drops:Dropdown("Teleport to you", {}, function(name)
    print("Teleport", name)
    getgenv().selectedName = name
    local tpplayer = Players:FindFirstChild(name)
    if tpplayer and tpplayer.Character and tpplayer.Character:FindFirstChild("Humanoid") then

local args = {
    [1] = tpplayer.Character.Humanoid,
    [2] = 0,
    [3] = 1,
    [4] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").VampireDamage:FireServer(unpack(args))

    else
        warn("Player has died/left the server.", name)
    end
end)

local function refreshPlayers()
    drop:Clear()
    for _, p in ipairs(Players:GetPlayers()) do
        drop:Add(p.Name)
    end
end

refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)







local ReplicatedStorage = game:GetService("ReplicatedStorage")
local clrs = serv:Channel("Colorpickers")

getgenv().ColorToggle = false
getgenv().ChosenColor = BrickColor.new("Really red") -- default color
local loop

-- toggle to start/stop autofire
clrs:Toggle("Enable Auto Color", false, function(state)
    getgenv().ColorToggle = state

    if state then
        -- start loop
        loop = task.spawn(function()
            while getgenv().ColorToggle do
                local args = {
                    [1] = getgenv().ChosenColor
                }
                ReplicatedStorage.Jump:FireServer(unpack(args))
                task.wait(0.2)
            end
        end)
    else
        -- stop loop
        getgenv().ColorToggle = false
    end
end)

-- colorpicker to set the chosen color
clrs:Colorpicker("Color", Color3.fromRGB(255, 1, 1), function(color)
    getgenv().ChosenColor = BrickColor.new(color)
end)

