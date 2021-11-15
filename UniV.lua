print("Loading | Started")

local mainName = "Universal | H3"
local Main = loadstring(game:HttpGet("https://solarishub.dev/SolarisLib.lua"))()

local winMain = Main:New({
   Name = mainName,
   FolderToSave = "UniversalH3Stuff"
})

-- Vars
print("Loading | Vars 20%")
local Character_Parts = {"Left Leg","Right Leg","leftArmVisual","rightArmVisual","Head","Torso","rightUpperArm","rightLowerArm","rightArm","leftUpperArm","leftArm","leftLowerArm","Head","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"}
local camera = game:GetService("Workspace").CurrentCamera
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local LPlayer = players.LocalPlayer
local mouse = LPlayer:GetMouse()
--ESP
local esp_chams_color = Color3.fromRGB(255,255,255)
local esp_main_color = Color3.fromRGB(0, 110, 255)
local esp_enabled = false
local esp_tracers = false
local esp_distance = false
local esp_tracer_origin = "Bottom" -- Top, Bottom
local esp_health = false
local esp_chams = false
local esp_cham_outlines = false
local esp_Names = false
local esp_chams_trans = 0.7;

--Mods
local hitboxes = false
local headHitboxSize = 5
local rootHitboxSize = 10
local hiboxTrans = 0.5
local hitboxColor = Color3.fromRGB(255,255,255)
local hitboxType = "Head"
local movementMods = false
local xwalkSpeed = 16
local xjumpPower = 45

print("Loading | Tabs 50%")
-- Functions 
FLYING = false
QEfly = true
iyflyspeed = 2
vehicleflyspeed = 2
function startFly(vfly)
    if game.Workspace:FindFirstChild('ABC') ~= nil then game.Workspace:FindFirstChild('ABC'):Destroy() end
    local part = Instance.new('Part')
    part.Parent = workspace
    part.Name = "ABC"
    part.CFrame = LPlayer.Character.HumanoidRootPart.CFrame
    part.Transparency = 1
    part.CanCollide = false
    part.Size = LPlayer.Character.HumanoidRootPart.Size
    local weld = Instance.new('WeldConstraint')
    weld.Parent = LPlayer.Character
    weld.Part0 = LPlayer.Character.HumanoidRootPart
    weld.Part1 = workspace.ABC
	repeat wait() until LPlayer and LPlayer.Character and workspace.ABC and LPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until mouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = workspace.ABC
		BV.Parent = workspace.ABC
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = workspace.CurrentCamera.CoordinateFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if not vfly and LPlayer.Character:FindFirstChildOfClass('Humanoid') then
					LPlayer.Character.Humanoid.PlatformStand = false
				end
			 	if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame --* CFrame.Angles(0, 0, math.rad(180))
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if LPlayer.Character:FindFirstChildOfClass('Humanoid') then
				LPlayer.Character.Humanoid.PlatformStand = false
				workspace:FindFirstChild('ABC'):Destroy()
				LPlayer.Character.WeldConstraint:Destroy()
			end
		end)
	end

	flyKeyDown = mouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and flySpeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
    
	flyKeyUp = mouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end
function stopFly()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if LPlayer.Character:FindFirstChildOfClass('Humanoid') then
		LPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

--Main | Combat
local mainTab = winMain:Tab("Main")
local mainSec = mainTab:Section("Hitbox Changer")

--Player
local plrTab = winMain:Tab("Player")
local plrSec = plrTab:Section("Player Main")

--ESP
local espTab = winMain:Tab("ESP")
local espSec = espTab:Section("ESP Main")

--Visuals
local visualsTab = winMain:Tab("Visuals")
local visual_sec = visualsTab:Section("World")

--<Hitboxes
mainSec:Toggle("Hitboxes", false,"Toggle", function(t)
    hitboxes = t
end)
mainSec:Dropdown("Hitbox Type", {"Head","HumanoidRootPart"},"","Dropdown", function(t)
	hitboxType = t    
end)
mainSec:Colorpicker("Hitbox Color", Color3.fromRGB(255,255,255),"Colorpicker", function(c)
	hitboxColor = c
end)
mainSec:Slider("Hitbox Transparency", 0,1,0.5,0.1,"Slider", function(s)
	hiboxTrans = s
end)
mainSec:Slider("Head Size", 0,100,1,0.5,"Slider", function(s)
	headHitboxSize = s
end)
mainSec:Slider("RootPart Size", 0,55,1,1,"Slider", function(s)
	rootHitboxSize = s
end)
--<Player
plrSec:Toggle("Movement overide", false,"Toggle", function(t)
    movementMods = t
end)
plrSec:Slider("WalkSpeed", 0,200,16,0.1,"Slider", function(s)
	xwalkSpeed = s
end)
plrSec:Slider("JumpPower", 0,100,45,0.1,"Slider", function(s)
	xjumpPower = s
end)
plrSec:Bind("Flight", Enum.KeyCode.World0, false, "BindNormal", function(v)
    if v then
        startFly()
    else
        stopFly()
    end
end)
--<ESP
espSec:Toggle("ESP Enabled", false,"Toggle", function(t)
    esp_enabled = t
end)
espSec:Toggle("ESP Names", false,"Toggle", function(t)
    esp_Names = t
end)
espSec:Toggle("ESP Distance", false,"Toggle", function(t)
    esp_distance = t
end)
espSec:Toggle("ESP Health", false,"Toggle", function(t)
    esp_health = t
end)
espSec:Toggle("ESP Chams", false,"Toggle", function(t)
    esp_chams = t
end)
espSec:Toggle("ESP Cham outline", false,"Toggle", function(t)
    esp_cham_outlines = t
end)
espSec:Toggle("ESP Tracers", false,"Toggle", function(t)
    esp_tracers = t
end)
espSec:Dropdown("Tracer origin", {"Bottom","Top","Mouse"},"Bottom","Dropdown", function(t)
	esp_tracer_origin = t
end)
espSec:Colorpicker("ESP Color", Color3.fromRGB(255,255,255),"Colorpicker", function(c)
	esp_main_color = c
end)
espSec:Slider("Chams Transparency", 0,1,0.7,0.05,"Slider", function(s)
	esp_chams_trans = s
end)
--<Wrld
visual_sec:Toggle("World Shadows", lighting.GlobalShadows,"Toggle", function(t)
    lighting.GlobalShadows = t
end)
visual_sec:Slider("Brightness", 0,20,math.ceil(lighting.Brightness),0.1,"Slider", function(s)
	lighting.Brightness = s
end)
visual_sec:Slider("ExposureCompensation", 0,10,lighting.ExposureCompensation,0.1,"Slider", function(s)
	lighting.ExposureCompensation = s
end)
visual_sec:Slider("Clock Time", 0,23,math.ceil(lighting.ClockTime),0.05,"Slider", function(s)
	lighting.ClockTime = s
end)
visual_sec:Colorpicker("Fog Color", lighting.FogColor,"Colorpicker", function(c)
	lighting.FogColor = c
end)
visual_sec:Colorpicker("World Aimbient", lighting.Ambient,"Colorpicker", function(c)
	lighting.Ambient = c
end)
visual_sec:Colorpicker("Outdoor Aimbient", lighting.OutdoorAmbient,"Colorpicker", function(c)
	lighting.OutdoorAmbient = c
end)

print("Loading | Main 70%")
--Main
coroutine.wrap(function()
	while wait(.5) do
		pcall(function()	
			if hitboxes then				
				for i,v in pairs(players:GetChildren()) do
					if v ~= LPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") then
						if hitboxType == "HumanoidRootPart" then
							v.Character[hitboxType].Size = Vector3.new(rootHitboxSize,rootHitboxSize,rootHitboxSize)
                            v.Character.Head.Size = LPlayer.Character.Head.Size
						else 
							v.Character[hitboxType].Size = Vector3.new(headHitboxSize,headHitboxSize,headHitboxSize)
                            v.Character.HumanoidRootPart.Size = LPlayer.Character.HumanoidRootPart.Size
						end
						v.Character[hitboxType].CanCollide = false
						v.Character[hitboxType].Transparency = hiboxTrans
						v.Character[hitboxType].Color = hitboxColor
					end
				end
			end
		end)
	end	
end)()
coroutine.wrap(function()
    while wait(1)do
        pcall(function()
            if esp_enabled then                
                for _,v in pairs(players:GetPlayers()) do
                    if v.Name ~= LPlayer.Name and v.Team ~= LPlayer.Team and v.Character ~= nil then
                        for _,c in pairs(Character_Parts)do
                            if esp_chams then
                                if v.Character:FindFirstChild(c) then
                                    local part = v.Character[c]
                                    local a = Instance.new("BoxHandleAdornment")
                                    if c == "Head"then
                                        a.Size = Vector3.new(1.05,1.05,1.05)
                                    else
                                        a.Size = part.Size+Vector3.new(.05,.05,.05)
                                    end
                                    a.Parent = game.CoreGui
                                    a.AlwaysOnTop = true
                                    a.Adornee = part
                                    a.ZIndex = 0
                                    a.Transparency = esp_chams_trans
                                    a.Color3 = esp_chams_color
                                    coroutine.wrap(function()
                                        wait(1)
                                        a:Destroy()
                                    end)()                             
                                end
                            end
                            if esp_cham_outlines then
                                if v.Character:FindFirstChild(c) then
                                    off = 0.5
                                    local part = v.Character[c]
                                    local a = Instance.new("BoxHandleAdornment")
                                    if c == "Head"then
                                        a.Size = Vector3.new(1+off,1+off,1+off)
                                    else
                                        a.Size = part.Size+Vector3.new(off,off,off)
                                    end
                                    a.Parent = game.CoreGui
                                    a.AlwaysOnTop = false
                                    a.Adornee = part
                                    a.ZIndex = 0
                                    a.Transparency = 0.3
                                    a.Color3 = esp_main_color
                                    coroutine.wrap(function()
                                        wait(1)
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

game:GetService("RunService").RenderStepped:connect(function()       
    if esp_enabled then       
        for _,v in pairs(players:GetChildren()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v ~= LPlayer then
            local part = v.Character.HumanoidRootPart         
            local distance = LPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)              
            local Vector ,b=game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if b then
                    if esp_Names then
                        local a=Drawing.new("Text")                        
                        if esp_distance then                
                            a.Text = v.Name .. " [" .. math.ceil(distance) .. "]"
                         else                            
                            a.Text = v.Name                                         
                         end
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1
                        a.Color=esp_main_color
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/40)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end                    
                    if esp_health then
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
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)
                        c.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)
                        c.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)
                        c.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)
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
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)
                        e.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)
                        e.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)
                        e.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)
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
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)
                        d.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)
                        d.PointC=c.PointC
                        d.PointD=c.PointD
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            d:Remove()
                        end)()
                    end  
                    if esp_tracers then
                        local t = Drawing.new("Line")
                        t.Visible = true
                        t.Color = esp_main_color
                        t.Thickness = 0.6
                        t.Transparency = 0.9
                        if esp_tracer_origin == "Bottom" then
                            t.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 100)       
                            else if esp_tracer_origin == "Top" then
                                t.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 1000)  
                                else if esp_tracer_origin == "Mouse" then
                                    t.From = Vector2.new(mouse.X, mouse.Y + 40)   
                                end                           
                            end 
                        end   
                        t.To = Vector2.new(Vector.X, Vector.Y)          
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            t:Remove()
                        end)()
                    end                                                   
                end
            end                       
        end
    end  
    if movementMods then
        LPlayer.Character.Humanoid.WalkSpeed = xwalkSpeed 
        LPlayer.Character.Humanoid.JumpPower = xjumpPower
    end
end)

print("Loading | Main 100%")
