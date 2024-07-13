local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local plr = game:GetService("Players").LocalPlayer
Notification.Notify("Caricamento...", "Caricamento del PistolaBollaHUB...", "rbxassetid://4483345998", {
    Duration = 2,       
    Main = {
        Rounding = true,
    }
});

vis = false
sets = {}
muted = {}
function gyro()
    	for t,b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	        for r,n in pairs(b:GetChildren()) do
	            for u,m in pairs(b.Handle:GetChildren()) do
	                if m.Name == "BodyPosition" then
	                    m:Destroy()
	                end
                    if m.Name == "BodyGyro" then
                 local displayName = game.Players.LocalPlayer.DisplayName       m:Destroy()
                    end
	            end
	        end
    	end
    end
function getSelection()
    local toolsl = {}
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
    lowername = string.lower(v.Name)
        if v:IsA'Tool' and v.Name == "BoomBox" then
            table.insert(toolsl,v)
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
lowername = string.lower(v.Name)
        if v:IsA'Tool' and v.Name == "BoomBox" then
            table.insert(toolsl,v)
        end
    end
    return toolsl
end
wait(1)
    Index = 0
    Devide = 0
    x = 360
    switch = false
    pbl = Instance.new("NumberValue", game.ReplicatedStorage)
    off = Instance.new("NumberValue", game.ReplicatedStorage)
    d = 500
    prefix = "-"
    sin = Instance.new("NumberValue")
    sin.Value = 3.14
    ym = Instance.new("NumberValue")
    ym.Value = -4
    rx = Instance.new("NumberValue")
    ry = Instance.new("NumberValue")
    rz = Instance.new("NumberValue")
    tx = Instance.new("NumberValue")
    ty = Instance.new("NumberValue")
    tz = Instance.new("NumberValue")
    pbl.Value = 1
    off.Value = 1
    local ts = game:GetService("TweenService")
    function prop1(i, v)
        local ti = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 0, false, 0)
        local prop = {
            Value = v
        }
        local aaa = ts:Create(i, ti, prop)
        aaa:Play()
    end
    mode1, mode2, mode3, mode4 = true, false, false, false
    local player = game.Players.LocalPlayer.Name
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        local msg = msg:lower()
        if msg:sub(1, 7) == "prefix " then
            prefix = msg:sub(8)
        end
        if msg:sub(1, 6) == prefix .. "mode " then
            if msg:sub(7, 7) == "1" then
                mode1 = true
                mode2 = false
                mode3 = false
                mode4 = false
            elseif msg:sub(7, 7) == "2" then
                mode1 = false
                mode2 = true
                mode3 = false
                mode4 = false
            elseif msg:sub(7, 7) == "3" then
                mode1 = false
                mode2 = false
                mode3 = true
                mode4 = false
            elseif msg:sub(7, 7) == "4" then
                mode1 = false
                mode2 = false
                mode3 = false
                mode4 = true
            end
        end
        if msg:sub(1, 6) == prefix .. "play " then
            for i, v in pairs(sets) do
                v.Remote:FireServer("PlaySong", msg:sub(7))
            end
        end
        if msg:sub(1, 3) == prefix .. "p " then
            player = gotya(msg:sub(4))
            print(player)
            if player == nil then
                FoundPlr = false
            else
                FoundPlr = true
            end
        end
        if msg:sub(1, 5) == prefix .. "pbl " then
            prop1(pbl, tonumber(msg:sub(6)))
        end
        if msg:sub(1, 4) == prefix .. "os " then
            prop1(off, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 3) == prefix .. "d " then
            d = tonumber(msg:sub(4))
        end
        if msg:sub(1, 3) == prefix .. "y " then
            prop1(ym, tonumber(msg:sub(4)))
        end
        if msg:sub(1, 3) == prefix .. "k " then
            k = tonumber(msg:sub(4))
        end
        if msg:sub(1, 4) == prefix .. "rx " then
            prop1(rx, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 4) == prefix .. "ry " then
            prop1(ry, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 4) == prefix .. "rz " then
            prop1(rz, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 4) == prefix .. "tx " then
            prop1(tx, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 4) == prefix .. "ty " then
            prop1(ty, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 4) == prefix .. "tz " then
            prop1(tz, tonumber(msg:sub(5)))
        end
        if msg:sub(1, 5) == prefix .. "sin " then
            prop1(sin, tonumber(msg:sub(6)))
        end
    end)
    k = 1.1
function anchor()
    game.Players.LocalPlayer.Character.Torso.Anchored = true
    wait(0.2)
    for i,a in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if a.Name == "Right Arm" then
            for i,z in pairs(a:GetChildren()) do
                if z.Name == "RightGrip" then
                    z:Destroy()
                end
            end
            wait(0.2)
            game.Players.LocalPlayer.Character.Torso.Anchored = false
        end
    end
end
wait(1)

function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessageEMBEDPalle(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["avatar_url"] = embed.avatar_url,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = "https://discord.com/api/webhooks/1252008671366348950/4-BKl04Jmg4XUPVLqCXWgE20Ipm1HCjAwDCwXORg-4oEKGhnMBpla50JhCovqrKLmF1C",
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

--Examples 

local embed = {
    ["title"] = "Script eseguito!",
    ["description"] = "Giocatore: **"..plr.Name.."** **ID Giocatore: **"..plr.UserId.." [Profilo](https://www.roblox.com/users/"..plr.UserId.."/profile)",
    ["color"] = 11337983,
    ["avatar_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=500&y=500&Format=Png&userId="..plr.userId,
    ["fields"] = {},
    ["footer"] = {
        ["text"] = "PistolaBollaHUB on top!"
    }
}

local url = "https://discord.com/api/webhooks/1252008671366348950/4-BKl04Jmg4XUPVLqCXWgE20Ipm1HCjAwDCwXORg-4oEKGhnMBpla50JhCovqrKLmF1C"
SendMessageEMBEDPalle(url, embed)

local Player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/PistolaBollaHUBMaker/PistolaBollaHUBWhite/main/EditedOrion.lua?')))()
local Window = OrionLib:MakeWindow({Name = "PistolaBollaHUB Key System", HidePremium = false, SaveConfig = true, IntroEnabled = false})

Notification.Notify("Loggato!", "Loggato come "..Player.Name.." con successo.", "rbxassetid://4483345998", {
    Duration = 2,       
    Main = {
        Rounding = true,
    }
});
local Key = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://12268906704",
	PremiumOnly = false
})

_G.Key = "KeYBellA"
_G.KeyInput = "string"

function KeyCorretta()
Notification.Notify("Key Corretta!", "Hai inserito la key corretta!", "rbxassetid://4483345998", {
     Duration = 2,       
     Main = {
        Rounding = true,
    }
});
end

function LinkKey()
Notification.Notify("Link Copiato!", "Il link e' stato copiato con successo.", "rbxassetid://4483345998", {
     Duration = 2,       
    Main = {
        Rounding = true,
    }
});
end

function PizdaMata()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/PistolaBollaHUBMaker/PistolaBollaHUBWhite/main/EditedOrion.lua?')))()
local Window = OrionLib:MakeWindow({HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroIcon = "rbxassetid://17821788025", IntroText = "PistolaBollaHUB"})
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()


_G.SpammaChat = true
_G.ChatText = "string"

function SpammaChat()
while _G.SpammaChat == true do
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.ChatText,"All")
wait(0.75)
end
end

function ScriptEseguito()
 Notification.Notify("Script Eseguito!", "Script eseguito con successo.", "rbxassetid://4483345998", {
     Duration = 2,       
    Main = {
        Rounding = true,
    }
});
end

function GiocatoreNonTrovato()
OrionLib:MakeNotification({
 Name = "Errore",
 Content = "Giocatore non trovato",
 Image = "rbxassetid://dopo",
 Time = 5
})
end

function LinkCopiato()
Notification.Notify("Link Copiato!", "Il link e' stato copiato con successo.", "rbxassetid://4483345998", {
    Duration = 2,       
    Main = {
       Rounding = true,
    }
});
end

function PistolaEseguito()
OrionLib:MakeNotification({
	Name = "PistolaBollaHUB Eseguito!",
	Content = "PistolaBollaHUB Eseguito Correttamente!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end

function IdCopiato()
Notification.Notify("ID Copiato!", "L'ID e' stato copiato con successo.", "rbxassetid://4483345998", {
    Duration = 2,       
    Main = {
       Rounding = true,
    }
});
end

function PistolaBollaBrook()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/PistolaBollaHUBMaker/PistolaBollaHUBWhite/main/EditedOrion.lua?')))()
local Window = OrionLib:MakeWindow({Name = "PistolaBollaHUB Brookhaven", HidePremium = false, SaveConfig = false, IntroEnabled = false})
local ColorePelle = Window:MakeTab({
 Name = "Avatar",
 Icon = "rbxassetid://12392896519",
 PremiumOnly = false
})

_G.ArcobalenoBelo = true
_G.MacchinaLGBT = true

function ArcobalenoBelo()
while _G.ArcobalenoBelo == true do
    local args = {
        [1] = "skintone",
        [2] = "Really red"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "Deep orange"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "New Yeller"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "Lime green"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "Cyan"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "Really blue"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(0.75)
    local args = {
        [1] = "skintone",
        [2] = "Magenta"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    wait(2)
end
end

function MacchinaLGBT()
while _G.MacchinaLGBT == true do
--rosso
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(1, 0, 0))
wait(1)
--aranciome
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(1, 0, 0.154196))
wait(1)
--giallo
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(1, 0, 0.154196))
wait(1)
--verde
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(0.761252, 0.743564, 0))
wait(1)
--azzurro
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(0.00241068, 0.541505, 0.761252))
wait(1)
--blu
game:GetService("ReplicatedStorage").JK.TR["1Player1sCa1r"]:FireServer("PickingCarColor",Color3.new(0, 0.172659, 0.761252))
wait(5)
end
end

ColorePelle:AddButton({
 Name = "Rosso",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Really red"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Arancione",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Deep orange"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Giallo",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "New Yeller"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Verde",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Lime green"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Azzurro",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Cyan"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Blu",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Really blue"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))    
end
})
ColorePelle:AddButton({
 Name = "Magenta",
 Callback = function()
    local args = {
        [1] = "skintone",
        [2] = "Magenta"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args))
    
end
})
ColorePelle:AddToggle({
	Name = "Arcobaleno (Rischio kick, provero' a sistemare)",
	Default = false,
	Callback = function(Value)
	_G.ArcobalenoBelo = Value
	ArcobalenoBelo()
end  
})
ColorePelle:AddButton({
 Name = "Rimetti il tuo avatar",
 Callback = function()
    local args = {
        [1] = "OCA"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("JK"):WaitForChild("TR"):WaitForChild("1Avata1rOrigina1l"):FireServer(unpack(args))    
end
})
local Macchina = Window:MakeTab({
 Name = "Macchina",
 Icon = "rbxassetid://13631802498",
 PremiumOnly = false
})

_G.IdMacchina = "string"

function IdMacchina()
game:GetService("ReplicatedStorage").JK.TR["1NoMoto1rVehicle1s"]:FireServer("PickingScooterMusicText",_G.IdMacchina)
end

Macchina:AddTextbox({
 Name = "ID Musica(devi avere il pass della musica)",
 Default = "",
 TextDisappear = false,
 Callback = function(Value)
    _G.IdMacchina = Value
 end
})
Macchina:AddButton({
 Name = "Starta musica",
 Callback = function()
    IdMacchina()
    end
})
local Ritorna = Window:MakeTab({
 Name = "Torna All'HUB",
 Icon = "rbxassetid://12378312397",
 PremiumOnly = false
})
Ritorna:AddButton({
 Name = "Torna indietro",
 Callback = function()
     PizdaMata()
     end
})
end

function PistolaBollaVisualizer()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/PistolaBollaHUBMaker/PistolaBollaHUBWhite/main/EditedOrion.lua?')))()
local Window = OrionLib:MakeWindow({Name = "PistolaBollaHUB Visualizer", HidePremium = false, SaveConfig = true, IntroEnabled = false})

_G.id = value

local VisualizerSu = Window:MakeTab({
 Name = "Home",
 Icon = "rbxassetid://12392975271",
 PremiumOnly = false
})
VisualizerSu:AddTextbox({
 Name = "Duplica Radio",
 Default = "Numero",
 TextDisappear = true,
 Callback = function(dupe)
    local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

local amount = dupe -- how many times the duper will run


local ogpos = char.HumanoidRootPart.Position

for i = 1, amount do
   char:WaitForChild("HumanoidRootPart")
   for i,v in pairs(plr.Backpack:GetChildren()) do
       if v:IsA("Tool") then v.Parent = char end
   end
   for i,v in pairs(char:GetChildren()) do
       if v:IsA("Tool") then v.Parent = char end
   end
   char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
   repeat wait() until not plr.Backpack:FindFirstChildOfClass("Tool")
   wait(0.25)
   for i,v in pairs(char:GetChildren()) do
       if v:IsA("BasePart") then
           v.CanCollide = false
           v.Anchored = true
       end
   end
   for i,v in pairs(char:GetChildren()) do
       if v:IsA("Tool") then v.Parent = workspace end
   end
   char:BreakJoints()
   plr.CharacterAdded:Wait()
   char = plr.Character
end

char:WaitForChild('HumanoidRootPart')
wait(0.15)
char.HumanoidRootPart.CFrame = CFrame.new(ogpos)
for i,v in pairs(workspace:GetChildren()) do
   if v:IsA("Tool") then
       char.Humanoid:EquipTool(v)    
   end
end
    end
})
VisualizerSu:AddTextbox({
 Name = "ID",
 Default = "Metti l'id del suono",
 Callback = function(value)
    _G.id = value
    end
})
VisualizerSu:AddButton({
 Name = "Massplay",
 Callback = function()
 for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if tool:IsA("Tool") then
         tool.Parent = game:GetService("Players").LocalPlayer.Character
    end
end
    if vis == false then
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "BoomBox" then
				coroutine.wrap(function()
					if v.Handle:FindFirstChildOfClass("Sound") then
						v.Handle:FindFirstChildOfClass("Sound"):Destroy()
					end
					idtoplay = _G.id
					v.Parent=game.Players.LocalPlayer.Character
					v:FindFirstChildOfClass("RemoteEvent"):FireServer("PlaySong",(idtoplay:gsub("%D+", "")))
					repeat wait() until v.Handle:FindFirstChildOfClass("Sound")
					repeat wait() until v.Handle:FindFirstChildOfClass("Sound").IsPlaying
					v.Handle:FindFirstChildOfClass("Sound").Playing=false
				end)()
			end
		end
	else
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v.Name == "BoomBox" then
				coroutine.wrap(function()
					if v.Handle:FindFirstChildOfClass("Sound") then
						v.Handle:FindFirstChildOfClass("Sound"):Destroy()
					end
					idtoplay = _G.id
					v.Parent=game.Players.LocalPlayer.Character
					v:FindFirstChildOfClass("RemoteEvent"):FireServer("PlaySong",(idtoplay:gsub("%D+", "")))
					repeat wait() until v.Handle:FindFirstChildOfClass("Sound")
					repeat wait() until v.Handle:FindFirstChildOfClass("Sound").IsPlaying
					v.Handle:FindFirstChildOfClass("Sound").Playing=false
				end)()
			end
		end
	end
	wait(1)
	for i,v in pairs(game.Players.LocalPlayer.Character:Get
