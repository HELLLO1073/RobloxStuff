local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local colors = 
{
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Window = Library.CreateLib("Unit 1968 | H3LLL0 - V:4", colors)
--[[ 
    [THEMES]
    LightTheme
    DarkTheme
    GrapeTheme
    BloodTheme
    Ocean
    Midnight
    Sentinel
    Synapse
]]
print("Loading 1%")
--#vars
local ClientPlayer = game.Players.LocalPlayer
local Jump = 40
local Speed = 16
local gunmod1 = false 
local gunmod2 = false 
local gunmod3 = false 
local gunmod4 = false 
local gunmod5 = false 
local gunmod6 = false
local gunmod7 = false
local gunmod8 = false
local gunmod9 = false
local gunmod10 = false
local chatSpammer = false
local chatSpammerOptions 
local falling = false 
local YawStrentgh = 0
local AntiAimPitch = 0
local Spinbot = false
local AntiAimEnabled = false
local myEmojojies = { '🤣', '😈', '😭', '🙃', '👽'}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RGBgun = false
local WhizzerEnabled = false
local VoiceSpamEnabled = false
local RGBgunMaterial
local HumParts ={ "Head","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"}
local EspBoxes = false
local EspNames = false 
local EspHealth = false
local ESPEnabled = false
local EspChams = false
local EspColorMain
local RunService = game:GetService("RunService")


-- functions
local function whizzPlayer(Player, Size, Distance) 
    game:GetService("ReplicatedStorage").Events.Whizz:FireServer(Player, Size, Distance)
end
getfenv().lock = "Head" -- Head or Hitbox or Random
fov = 300
local SAEnabled = false
local fovCircle = false
local st = tonumber(tick())

warn("Loading script...")
local SilentAimTab = Window:NewTab("Silent Aim")
local SilentAimSEC = SilentAimTab:NewSection("")
SilentAimSEC:NewButton("Silent Aim", "Enables Silent aim", function(cx) 
    fovCircle = true   
    SAEnabled = true
    if fovCircle then
        function createcircle()
            local a=Drawing.new('Circle');a.Transparency=1;a.Thickness=1.5;a.Visible=true;a.Color=Color3.fromRGB(0, 0, 255);a.Filled=false;a.Radius=fov;
            return a;
        end;  
        local fovc = createcircle();
        spawn(function()
            RunService:BindToRenderStep("FovCircle",1,function()
                fovc.Position = Vector2.new(mouse.X,mouse.Y)                
            end);
        end);
    end;
end)
local AATab = Window:NewTab("Anti-Aim")
local AaSection = AATab:NewSection("Anti aim")
AaSection:NewToggle("AntiAim Enabled", "", function(b)
    AntiAimEnabled = b
end)
AaSection:NewToggle("Spinbot", "", function(b)
    Spinbot = b
end)
AaSection:NewSlider("Spin Strength", "", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    YawStrentgh = s
end)
AaSection:NewDropdown("Pitch", "DropdownInf", {"Down", "Straight", "Up", "Boneless", "Random"}, function(d)
    AntiAimPitch = d
end)
local GunTab = Window:NewTab("Weapon Mods")
local GunSection1 = GunTab:NewSection("")

local GunSection = GunTab:NewSection("Weapon Mods")
GunSection:NewToggle("Infinite Ammo", "Infinite ammo", function(b)
    gunmod1 = b
end)
GunSection:NewToggle("Nospread", "no gun spread", function(b)
    gunmod2 = b
end)
GunSection:NewToggle("No bullet drop", "No bullet drop / velocity", function(b)
    gunmod3 = b
end)
GunSection:NewToggle("No recoil", "No recoil", function(b)
    gunmod4 = b
end)
GunSection:NewToggle("Increase fire rate", "super firerate", function(b)
    gunmod5 = b
end)
GunSection:NewToggle("Infinite Grenades", "Infinite Grenades", function(b)
    gunmod6 = b
end)
GunSection:NewToggle("Inf Ammoboxes/Meds", "Inf Ammoboxes/Meds", function(b)
    gunmod7 = b
end)
GunSection:NewToggle("Fast Reload", "fast reload", function(b)
    gunmod8 = b
end)
GunSection:NewToggle("Fast Aim", "ads modifier", function(b)
    gunmod9 = b
end)
GunSection:NewToggle("Shoot through objects/walls", "", function(b)
    gunmod10 = b
end)
print("Loading 20%")
local Esps = Window:NewTab("ESP")
local ESPSection = Esps:NewSection("")
ESPSection:NewToggle("ESP Enabled", "", function(b)
    ESPEnabled = b
end)
ESPSection:NewColorPicker("ESP Main color", "", Color3.fromRGB(0,0,0), function(colorx)
    EspColorMain = colorx
end)
ESPSection:NewToggle("Boxes", "", function(b)
    EspBoxes = b
end)
ESPSection:NewToggle("Names", "", function(b)
    EspNames = b
end)
ESPSection:NewToggle("Health", "", function(b)
    EspHealth = b
end)
ESPSection:NewToggle("Chams", "", function(b)
    EspChams = b
end)
local WorldVisauls = Window:NewTab("Miscellaneous")
local WorldVisaulsSec = WorldVisauls:NewSection("Wrld Visauls")
WorldVisaulsSec:NewToggle("FullBright/No Fog", "", function(b)
    loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
end)
WorldVisaulsSec:NewToggle("Raindbow Gun", "", function(bx)
    RGBgun = bx
end)
WorldVisaulsSec:NewDropdown("RGBGun Material", "", {"ForceField", "Glass", "Neon", "Plastic"}, function(Mat)
    RGBgunMaterial = Mat
end)
WorldVisaulsSec:NewButton("Anti restricted area kill", "", function(cx) 
    game:GetService("ReplicatedStorage").Events.KillMe:Destroy()
end)
local WorldVisaulsSec = WorldVisauls:NewSection("Misc")
WorldVisaulsSec:NewToggle("Chat Spammer", "", function(b)
    chatSpammer = b
end)
WorldVisaulsSec:NewDropdown("Mode", "", {"Emoji", "Wack", "EZ", "H3LLL0", "KIDS"}, function(d)
    chatSpammerOptions = d
end)
WorldVisaulsSec:NewToggle("Whizz all", "", function(b)
    WhizzerEnabled = b
end)
local PlayerX = Window:NewTab("Player")
local PlayerSec = PlayerX:NewSection("Player stuff")
PlayerSec:NewSlider("WalkSpeed", "", 200, 16, function(s) 
   Speed = s
end)
PlayerSec:NewSlider("JumpPower", "", 120, 40, function(s) 
    Jump = s
end)
PlayerSec:NewToggle("No fall damage", "", function(x)
    falling = x
end)
local Theme = Window:NewTab("Theme")
local themeSec = Theme:NewSection("Theme changer")
for theme, color in pairs(colors) do
    themeSec:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
local Credits = Window:NewTab("Credits")
local Scripts = Credits:NewSection("Scripts made by H3LLL0/FAZED")

coroutine.wrap(function()
    while wait(.09)do
        pcall(function()
            if WhizzerEnabled then                
                for _,v in pairs(game.Players:GetChildren())do
                    whizzPlayer(v, "Large", -1)                    
                end
            end
        end)
    end
end)()
coroutine.wrap(function()
    while wait(1)do
        pcall(function()
            if ESPEnabled then
                if EspChams then
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v.Name ~= LocalPlayer.Name and v.TeamColor ~= LocalPlayer.TeamColor then
                            for _,c in pairs(HumParts)do
                                if v.Character:FindFirstChild(c)then
                                    local part=v.Character[c]
                                    local a=Instance.new("BoxHandleAdornment")
                                    if c=="Head"then
                                        a.Size=Vector3.new(1.05,1.05,1.05)
                                    else
                                        a.Size=part.Size+Vector3.new(.05,.05,.05)
                                    end
                                    a.Parent=game.CoreGui
                                    a.AlwaysOnTop=true
                                    a.Adornee=part
                                    a.ZIndex=0
                                    a.Color3=EspColorMain
                                    coroutine.wrap(function()
                                        wait(1.1)
                                        a:Destroy()
                                    end)()                                
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)()
print("Loading 45%")
local angle = 0
print("Loading 50%")
local c = 1
function zigzag(X)
return math.acos(math.cos(X * math.pi)) / math.pi
end
game:GetService("RunService").RenderStepped:connect(function()
    if ClientPlayer.Backpack.CLIENT ~= nil then    
        local env = getsenv(ClientPlayer.Backpack.CLIENT)
        if env then 
            if env.equipped == "melee" or env.equipped == "grenade" then
            else 
                if gunmod1 then 
                    env.ammocount  = 11
                    env.ammocount2 = 11
                    env.ammocount3 = 11
                end
                if gunmod2 then 
                    env.spread = 0                    
                end
                if gunmod3 then 
                    env.gravity = 0 
                    env.bulletspeedm = 8
                end
                if env.gun and env.gun.Name ~= melee then 
                    if env.gun.Recoil ~= nil and gunmod4 then 
                        env.gun.Recoil.Value  = 0 
                        env.gun.LRecoil.Value = 0
                        env.gun.RRecoil.Value = 0 
                    end
                    if env.gun.FireRate ~= nil and gunmod5 then
                        env.gun.Automatic.Value = true 
                        env.gun.FireRate.Value = 0.001
                        env.bolted = true
                        env.primarymode = "automatic"
                    end
                    if gunmod6 then
                        env.maxgrenades = 10
                        env.grenades    = 10
                    end
                    if gunmod7 then
                        env.ammoboxes = 2
                    end
                    if gunmod8 then
                        env.gun.ReloadTime.Value   = 0.001 
                        env.gun.EReloadTime.Value  = 0.001 
                        env.gun.PReloadTime.Value  = 0.001
                    end
                    if gunmod9 then                        
                        env.AimSpeed.Value = 10                        
                    end
                end                        
            end 
            
        end
    end  
    if AntiAimPitch == "Up" then
        angle =  1 else 
        if AntiAimPitch == "Down" then 
            angle = -1 else 
            if AntiAimPitch == "Boneless" then 
                angle = -5 else
                if AntiAimPitch == "Random" then
                    angle = (math.random(1,2) == 1 and 1 or -1)
                end
            end
        end
    end
    if AntiAimEnabled then   
    local h2 = true
    game:GetService("Players").LocalPlayer.Backpack.Turn:FireServer(angle, h2)
    if Spinbot then
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(YawStrentgh), 0)
        else 
            game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true	
        end    
    end
    if chatSpammer then   
        local emo = myEmojojies[math.random(#myEmojojies)]
        if chatSpammerOptions == "Nothing" then 
            chatSpammerTxt = "                             ."
            else if chatSpammerOptions == "Emoji" then
                chatSpammerTxt = "😀😄😆😂🤣😏"
                else if chatSpammerOptions == "KIDS" then
                    chatSpammerTxt = "H3LLL0-Scripts Making these KIDS mad?  " .. "|" .. emo .. "|" 
                    else if chatSpammerOptions == "Wack" then
                        chatSpammerTxt = "WaCk wAcK wAcK WacK WaCk WaCk wAcK wAcK WacK WaCk WaCk wAcK wAcK WacK WaCk WaCk wAcK wAcK WacK WaCk WaCk wAcK wAcK WacK WaCk WaCk wAcK wAcK WacK WaCk"
                        else if chatSpammerOptions == "EZ" then
                            chatSpammerTxt = "|           EZ          |" 
                                else if chatSpammerOptions == "H3LLL0" then
                                    chatSpammerTxt = 
                                    [[
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                        l0l      H3LLL0 - SKripts     l0l
                                    ]]
                                    end
                                end
                            end
                         end
                    end
                end
            local b1 = false
        local b2 = false            
        game:GetService("ReplicatedStorage").Events.Chat:FireServer(chatSpammerTxt,b1,b2)       
    end
    if RGBgun then        
        for i,q in pairs(game:GetService("Workspace").Camera:GetChildren()) do
            if q.Name == "Arms" then
                for i,v in pairs(q:GetDescendants()) do
                    if v.ClassName == 'MeshPart' then 
                        v.TextureID = ""
                        v.Color = Color3.fromHSV(zigzag(c),1,1)
                        c = c + .0001
                        v.Material = RGBgunMaterial
                    end                
                end
            end
        end     
    end 
    if ESPEnabled then
        for _,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= LocalPlayer.Name and v.TeamColor ~= LocalPlayer.TeamColor then
            local part=v.Character.HumanoidRootPart
            local _,b=game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if b then
                    if EspNames then
                    local a=Drawing.new("Text")
                    a.Text=v.Name
                    a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                    a.Center=true
                    a.Outline=true
                    a.OutlineColor=Color3.new()
                    a.Font=Drawing.Fonts.UI
                    a.Visible=true
                    a.Transparency=1
                    a.Color=EspColorMain
                    a.Position=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).Y)
                    coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end
                    if EspBoxes then
                        local a=Drawing.new("Quad")
                        a.Visible=true
                        a.Color=Color3.new(1,0,0)
                        a.Thickness=1
                        a.Transparency=1
                        a.Filled=false
                        a.PointA=Vector2.new(
                         game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).Y)-->^
                        a.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)--<^
                        a.PointC=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)--<V
                        a.PointD=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).Y)-->V
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end
                    if EspHealth then
                        local healthnum=v.Character.Humanoid.Health
                        local maxhealth=v.Character.Humanoid.MaxHealth
                        local c=Drawing.new("Quad")
                        c.Visible=true
                        c.Color=Color3.new(0,1,0)
                        c.Thickness=1
                        c.Transparency=1
                        c.Filled=false
                        c.PointA=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)-->^
                        c.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)--<^
                        c.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)--<V
                        c.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)-->V
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                            c:Remove()
                        end)()
                        local e=Drawing.new("Quad")
                        e.Visible=true
                        e.Color=Color3.new(1,0,0)
                        e.Thickness=1
                        e.Transparency=1
                        e.Filled=true
                        e.PointA=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)-->^
                        e.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)--<^
                        e.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)--<V
                        e.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)-->V
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            e:Remove()
                        end)()
                        local d=Drawing.new("Quad")
                        d.Visible=true
                        d.Color=Color3.new(0,1,0)
                        d.Thickness=1
                        d.Transparency=1
                        d.Filled=true
                        d.PointA=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)-->^
                        d.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)--<^
                        d.PointC=c.PointC--<V
                        d.PointD=c.PointD-->V
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            d:Remove()
                        end)()
                    end
                end
            end
        end
    end   
end)
print("Loading 60%")

local mt = getrawmetatable(game)
local namecall = mt.__namecall

setreadonly(mt, false)
mt.__namecall = newcclosure(function(Self,...)
	local Args = {...}
	local name = getnamecallmethod()
	if not checkcaller() and Self == game.ReplicatedStorage.Events.Fall and name == "FireServer" and falling then 
		table.insert(Args, 1, 0)
		return namecall(Self, Args)
	end
	return namecall(Self,...)
end)

setreadonly(mt, true)

print("Done")
function getnearest()
	local nearestmagnitude = math.huge
	local nearestenemy = nil
	local vector = nil	
	for i,v in next, Players:GetChildren() do
		if v.Name ~= LocalPlayer.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= LocalPlayer.TeamColor then
				local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
				if onScreen then				
					local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
						if magnitude < nearestmagnitude and magnitude <= fov then
							nearestenemy = v
							nearestmagnitude = magnitude
						end
					end
				end
			end
		end
	return nearestenemy
end

local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall

mt.__namecall = function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if tostring(self) == "Bullet" and tostring(method) == "FireServer" then
        if target and SAEnabled == true then
            args[1] = target
            return self.FireServer(self, unpack(args))
        end
    end
   return namecall(self,...)
end

warn("Script loaded!\nTime taken: "..math.abs(tonumber(tick())-st))
RunService:BindToRenderStep("SilentAim",1,function()
	if UserInputService:IsMouseButtonPressed(0) and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
		local enemy = getnearest()
		if enemy and enemy.Character and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then                
			local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["Head"].Position)
			local head = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
			local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["HumanoidRootPart"].Position)
			local hitbox = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
			if head <= hitbox then
				magnitude = head
			else
				magnitude = hitbox;
			end;
			if getfenv().lock == "Head" then
				target = workspace[enemy.Name]["Head"]
			else
				if getfenv().lock == "Random" then
					if magnitude == hitbox then
						target = workspace[enemy.Name]["HumanoidRootPart"];
					else
						target = workspace[enemy.Name]["Head"]
					end;
				else
					target = workspace[enemy.Name]["HumanoidRootPart"];
				end;

			end;
		else
			target = nil
		end
	end
end)
print("Done2")