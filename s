local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("I LOVE YOU")

local serv = win:Server("Hi", "")

local btns = serv:Channel("Main")




--gg

lbls:Label("All players")

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

lbls:Label("Items")


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
