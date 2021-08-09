local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local colors = 
{
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Window = Library.CreateLib("Too easy FPS | H3LLL0 - V:1", colors)
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
local gunmodsEnabled = false
local gunmod1 = false 
local gunmod2 = false 
local gunmod3 = false 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local HumParts ={ "RightHand ","LeftLowerArm","LeftUpperArm","LowerTorso","RightLowerArm","LeftUpperLeg","RightUpperLeg","LeftFoot","RightUpperArm","RightFoot","RightLowerLeg","UpperTorso","Head","LeftHand"}
local EspBoxes = false
local EspNames = false 
local EspHealth = false
local ESPEnabled = false
local EspChams = false
local EspChamsOutline = false
local EspColorMain
local EspColorChams
local EspColorChamsOutline
local RunService = game:GetService("RunService")
getfenv().lock = "Head" -- Head or Hitbox or Random
fov = 300
local SAEnabled = false
local fovCircle = false
local st = tonumber(tick())


warn("Loading script...")
local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("")
MainSec:NewButton("Silent Aim", "Enables Silent aim", function(cx) 
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

local GunTab = Window:NewTab("Weapon Mods")
local GunSection1 = GunTab:NewSection("")
local GunSection = GunTab:NewSection("Weapon Mods")
GunSection:NewToggle("Enabled", "Infinite ammo", function(b)
    gunmodsEnabled = b
end)
GunSection:NewToggle("No Recoil", "Infinite ammo", function(b)
    gunmod1 = b
end)
GunSection:NewToggle("Fast firerate", "", function(b)
    gunmod2 = b
end)
GunSection:NewToggle("No spread", "no gun spread", function(b)
    gunmod3 = b
end)
print("Loading 20%")
local Esps = Window:NewTab("ESP")
local ESPSection = Esps:NewSection("")
ESPSection:NewToggle("ESP Enabled (Set color)", "", function(b)
    ESPEnabled = b
end)
ESPSection:NewColorPicker("ESP Main color", "", Color3.fromRGB(1,0,0), function(colorx)
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
ESPSection:NewToggle("Chams Vis Outline", "", function(b)
    EspChamsOutline = b
end)
ESPSection:NewColorPicker("Chams Color", "", Color3.fromRGB(1,0,0), function(colorx)
    EspColorChams = colorx
end)
ESPSection:NewColorPicker("Chams Outline Color", "", Color3.fromRGB(0,1,0), function(colorx)
    EspColorChamsOutline = colorx
end)

local PlayerX = Window:NewTab("Player")
local PlayerSec = PlayerX:NewSection("Player stuff")
PlayerSec:NewSlider("WalkSpeed", "", 200, 16, function(s) 
   Speed = s
end)
PlayerSec:NewSlider("JumpPower", "", 120, 40, function(s) 
    Jump = s
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
    while wait(1)do
        pcall(function()
            if ESPEnabled then
                if EspChams then
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v.Name ~= LocalPlayer.Name and v.Team ~= LocalPlayer.Team then
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
                                    a.Transparency = 0.5
                                    a.Color3=EspColorChams
                                    coroutine.wrap(function()
                                        wait(1.1)
                                        a:Destroy()
                                    end)()                                
                                end
                                if EspChamsOutline then
                                    local part=v.Character[c]
                                    local a=Instance.new("BoxHandleAdornment")
                                    local off=0.4
                                    if c=="Head"then
                                        a.Size=Vector3.new(1+off,1+off,1+off)
                                    else
                                        a.Size=part.Size+Vector3.new(off,off,off)
                                    end
                                    a.Parent=game.CoreGui
                                    a.AlwaysOnTop=false
                                    a.Adornee=part
                                    a.ZIndex=0
                                    a.Color3=EspColorChamsOutline
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
game:GetService("RunService").RenderStepped:connect(function()   
    if ESPEnabled then
        for _,v in pairs(game.Players:GetChildren()) do
			if v.Name ~= LocalPlayer.Name and v.Team ~= LocalPlayer.Team then
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
                        a.Color=EspColorMain
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
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
    if gunmodsEnabled then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                for c,b in pairs(v:GetDescendants()) do
                    if gunmod1 and b.Name == "RecoilMin" or b.Name == "TotalRecoilMax" or b.Name == "RecoilMax" then
                        b.Value = 0                    
                    end
                    if gunmod2 and b.Name == "MaxSpread" then
                        b.Value = 0
                    end
                    if gunmod3 and b.Name == "ShotCooldown" then
                        b.Value = 0
                    end
                end
            end
        end    
    end
end)

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
    if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" then
        if target and SAEnabled == true then
            args[2]["part"] = target
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
print("Done Loading")
