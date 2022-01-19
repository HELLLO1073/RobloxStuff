local xversion = "V.2.1"
local keyCode = "LeftAlt"

if game:GetService("CoreGui"):FindFirstChild("xlpUI") then
    game:GetService("CoreGui"):FindFirstChild("xlpUI"):Destroy()
end

--// Variables
local CCamera = game:GetService("Workspace").Camera 
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local LPlayer = players.LocalPlayer

--// Setting Tables
local setting_tbls = {
    espTransparency = 0.2;    
    player_esp = {
        names = false;
        boxes = false;
        health = false;
        chams = false;
        chams_glow = false;
        teamcheck = false;
    };  
    mods = {
        hitboxEnabled = false;
        hitboxTransparency = 0.5;
        hitboxType = "Head";
    };
    camera = {
        cameraOffsetter = false;
        cameraOffsetX = 0;
        cameraOffsetY = 0;
        cameraOffsetZ = 0;
    };
}

function resetHitboxes()
    for i,v in pairs(players:GetChildren()) do
        if v ~= LPlayer and v.Character and v.Character:FindFirstChild("Head") and LPlayer.Character then	            
            v.Character["Head"].Size = LPlayer.Character.Head.Size				
            v.Character["Head"].CanCollide = false
            v.Character["Head"].Transparency = 0

            v.Character["HumanoidRootPart"].Size = LPlayer.Character["HumanoidRootPart"].Size				
            v.Character["HumanoidRootPart"].CanCollide = false
            v.Character["HumanoidRootPart"].Transparency = 1
        end
    end
end

--// Library
local FinityLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/Lua/main/xlpuitest.lua"))()
local mainWind = FinityLib.new(true,"Universal H3 | "..xversion.."  ".."Keybind: ["..tostring(keyCode).."]".." | By H3#3534")
mainWind.ChangeToggleKey(Enum.KeyCode[keyCode])
 
--// Categories
local localCategory = mainWind:Category("Local Player")
local playersCategory = mainWind:Category("Players")
local visualCategory = mainWind:Category("Visual")

--// Sectors / Mods
local lvisualSector = localCategory:Sector("Visuals")
local lmoveSector = localCategory:Sector("Movement")
lvisualSector:Cheat("Checkbox", "Third Person (not for all games)", function(State)
	if State then
        LPlayer.CameraMode = "Classic"
    else
        LPlayer.CameraMode = "LockFirstPerson"
    end
end)
lvisualSector:Cheat("Slider", "FieldOfView", function(Value)
	CCamera.FieldOfView = Value
end, {min = 0, max = 120, suffix = ""})

lmoveSector:Cheat("Slider", "Walkspeed", function(v)
	LPlayer.Character.Humanoid.WalkSpeed = v
end, {min = 5, max = 250, suffix = ""})
lmoveSector:Cheat("Slider", "Jump Power", function(v)
	LPlayer.Character.Humanoid.JumpPower = v
end, {min = 5, max = 250, suffix = ""})

local pmodSector = playersCategory:Sector("Specific")
local visSector = playersCategory:Sector("All Players")
visSector:Cheat("Checkbox", "Names", function(State)	
    setting_tbls.player_esp.names = State
end)
visSector:Cheat("Checkbox", "Boxes", function(State)	
    setting_tbls.player_esp.boxes = State
end)
visSector:Cheat("Checkbox", "Health", function(State)	
    setting_tbls.player_esp.health = State
end)
visSector:Cheat("Checkbox", "Team Check", function(State)	
    setting_tbls.player_esp.teamcheck = State
    if setting_tbls.mods.hitboxEnabled then
        resetHitboxes()
    end
end)
visSector:Cheat("Checkbox", "Chams", function(State)	
    setting_tbls.player_esp.chams = State
    local char_parts ={ "Head", "LeftFoot", "LeftHand", "LeftLowerArm", "LeftLowerLeg", "LeftUpperArm", "LeftUpperLeg", "LowerTorso", "RightFoot", "RightHand", "RightLowerArm", "RightLowerLeg", "RightUpperArm", "RightUpperLeg", "UpperTorso" }
    coroutine.wrap(function()    
        repeat wait(1)
            if setting_tbls.player_esp.chams then
                pcall(function()
                    for _,v in pairs(players:GetPlayers()) do
                        if v ~= LPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            if not (setting_tbls.player_esp.teamcheck and v.Team ~= LPlayer.Team or not setting_tbls.player_esp.teamcheck) then
                                continue;
                            end
                            for _,p in pairs(char_parts) do
                                if v.Character:FindFirstChild(p) then
                                    local part = v.Character[p]
                                    local box = Instance.new("BoxHandleAdornment")                                
                                    box.Parent = game.CoreGui
                                    box.AlwaysOnTop = true
                                    box.Adornee = part
                                    box.ZIndex = 0
                                    box.Transparency = 0.8
                                    box.Color3 = Color3.fromRGB(255, 255, 255)
                                    if p == "Head"then
                                        box.Size = Vector3.new(1.05,1.05,1.05)
                                    else
                                        box.Size = part.Size + Vector3.new(.05,.05,.05)
                                    end
                                    coroutine.wrap(function()
                                        wait(1)
                                        box:Destroy()
                                    end)()
                                end
                            end
                        end
                    end
                end)
            end        
        until setting_tbls.player_esp.chams == false            
    end)()
end)
local targetedPlayer;
pmodSector:Cheat("Textbox", "Target Player", function(Value)
    local txt = string.lower(Value)
    for i,v in pairs(players:GetChildren()) do
        if v.Character and string.lower(v.Name):match(txt) then
            targetedPlayer = v;
            print(v.Name)
        end
    end	
end, {placeholder = "Player Name"})
pmodSector:Cheat("Checkbox", "Spectate", function(s)	
    if s then
        LPlayer.CameraMode = "Classic"
        workspace.Camera.CameraSubject = targetedPlayer.Character.Humanoid
    else
        LPlayer.CameraMode = "LockFirstPerson"
        workspace.Camera.CameraSubject = LPlayer.Character.Humanoid
    end
end)

visSector:Cheat("Checkbox", "Hit boxes", function(State)	
    resetHitboxes()
    setting_tbls.mods.hitboxEnabled = State
end)
visSector:Cheat("Dropdown", "Hitbox Type", function(Option)
    resetHitboxes()
    setting_tbls.mods.hitboxType = Option
end, {options = {"Head","HumanoidRootPart"}})
visSector:Cheat("Slider", "Hitbox Size (Max Head [6.2])", function(Value)    
	setting_tbls.mods.hitboxSize = Value
end, {min = 1, max = 35, suffix = ""}) 
 
local worldSector = visualCategory:Sector("World")
worldSector:Cheat("Checkbox", "World Shadows", function(State)      
    lighting.GlobalShadows = State 
end)
worldSector:Cheat("Slider", "Brightness", function(Value)
	lighting.Brightness = Value
end, {min = 0, max = 15, suffix = ""})
worldSector:Cheat("Slider", "Exposure", function(Value)
	lighting.ExposureCompensation = Value
end, {min = 0, max = 2, suffix = ""})
worldSector:Cheat("Slider", "WaterTransparency", function(Value)
	game:GetService("Workspace").Terrain.WaterTransparency = Value
end, {min = 0, max = 1, suffix = ""})
worldSector:Cheat("Slider", "WaterReflectance", function(Value)
	game:GetService("Workspace").Terrain.WaterReflectance = Value
end, {min = 0, max = 1, suffix = ""})

coroutine.wrap(function()
	while wait(1) do
		pcall(function()	
			if setting_tbls.mods.hitboxEnabled then				
				for i,v in pairs(players:GetChildren()) do
					if v ~= LPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") then	
                        if not (setting_tbls.player_esp.teamcheck and v.Team ~= LPlayer.Team or not setting_tbls.player_esp.teamcheck) then
                            continue;
                        end
						v.Character[setting_tbls.mods.hitboxType].Size = Vector3.new(setting_tbls.mods.hitboxSize,setting_tbls.mods.hitboxSize,setting_tbls.mods.hitboxSize)						
						v.Character[setting_tbls.mods.hitboxType].CanCollide = false
						v.Character[setting_tbls.mods.hitboxType].Transparency = setting_tbls.mods.hitboxTransparency					
					end
				end
			end
		end)
	end	
end)()

local boxheight1 = 2.5
local boxWidth1 = 1.5
local boxheight2 = 3
local boxWidth2 = 1.5
game:GetService("RunService").RenderStepped:Connect(function()
    --// Player ESP
    for i,v in pairs(players:GetPlayers()) do
        if v ~= LPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then   
            if not (setting_tbls.player_esp.teamcheck and v.Team ~= LPlayer.Team or not setting_tbls.player_esp.teamcheck) then
                continue
            end

            local dist = (v.Character:FindFirstChild("HumanoidRootPart").Position-LPlayer.Character.HumanoidRootPart.Position).Magnitude
            local espPart = v.Character.Head
            local boxPart = v.Character.HumanoidRootPart
            local vector, onScreen = CCamera:WorldToViewportPoint(espPart.Position)
            local vector_2, onScreen2 = CCamera:WorldToViewportPoint(boxPart.Position)

            if setting_tbls.player_esp.names and onScreen then                     
                    local nameTag = Drawing.new("Text")            
                    nameTag.Visible = true            
                    nameTag.Font = 1
                    nameTag.Center = true
                    nameTag.Outline = true
                    nameTag.Size = math.clamp(16-(espPart.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                    nameTag.Color = Color3.fromRGB(255,255,255)       
                    nameTag.Text = v.Name.." | "..math.round(dist)
                    nameTag.Position = Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.UpVector*(3+(boxPart.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.UpVector*(3+(boxPart.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/26)).Y)                     
                    coroutine.wrap(function()                    
                        game.RunService.RenderStepped:Wait()
                        nameTag:Remove()
                    end)()
            end            
            if setting_tbls.player_esp.boxes and onScreen2 then
                    local boxPart = v.Character.HumanoidRootPart                            
                    --// Outline box          
                    local boxOutline = Drawing.new("Quad")       
                    boxOutline.Visible = true
                    boxOutline.Color = Color3.new(0, 0, 0)
                    boxOutline.Thickness = 2.5
                    boxOutline.Transparency = 1
                    boxOutline.Filled = false
                    boxOutline.ZIndex = 1     
                    boxOutline.PointA = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * boxheight1).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * boxheight1).Y)  
                    boxOutline.PointB = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * boxheight1).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * boxheight1).Y)  
                    boxOutline.PointC = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * -boxheight2).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * -boxheight2).Y)  
                    boxOutline.PointD = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * -boxheight2).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * -boxheight2).Y)
    
                    --// Main box                    
                    local box = Drawing.new("Quad")       
                    box.Visible = true
                    box.Color = Color3.new(1, 1, 1)
                    box.Thickness = 1
                    box.Transparency = 1
                    box.Filled = false
                    box.ZIndex = 2                  
                    box.PointA = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * boxheight1).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * boxheight1).Y)  
                    box.PointB = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * boxheight1).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * boxheight1).Y)  
                    box.PointC = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * -boxheight2).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector * boxWidth1 + boxPart.CFrame.UpVector * -boxheight2).Y)  
                    box.PointD = Vector2.new(
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * -boxheight2).X,
                        CCamera:WorldToViewportPoint(boxPart.CFrame.Position + boxPart.CFrame.RightVector *-boxWidth2 + boxPart.CFrame.UpVector * -boxheight2).Y)             
                    coroutine.wrap(function()
                        game.RunService.RenderStepped:wait()
                        box:Remove()
                        boxOutline:Remove()
                    end)() 
            end
            if setting_tbls.player_esp.health and onScreen then
                    local healthnum=v.Character.Humanoid.Health
                    local maxhealth=v.Character.Humanoid.MaxHealth
                    local c=Drawing.new("Quad")
                    c.Visible=true
                    c.Color=Color3.new(0,1,0)
                    c.Thickness=1
                    c.Transparency=1
                    c.Filled=false
                    c.PointA=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*2.5).Y)
                    c.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*2.5).Y)
                    c.PointC=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*-boxheight2).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*-boxheight2).Y)
                    c.PointD=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*-boxheight2).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*-boxheight2).Y)
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
                    game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*2.5).Y)
                    e.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*2.5).Y)
                    e.PointC=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*-boxheight2).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*-boxheight2).Y)
                    e.PointD=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*-boxheight2).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*-boxheight2).Y)
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
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*(-boxheight2+healthnum/(maxhealth/5))).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2.5+boxPart.CFrame.UpVector*(-boxheight2+healthnum/(maxhealth/5))).Y)
                    d.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*(-boxheight2+healthnum/(maxhealth/5))).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(boxPart.CFrame.Position+boxPart.CFrame.RightVector*2+boxPart.CFrame.UpVector*(-boxheight2+healthnum/(maxhealth/5))).Y)
                    d.PointC=c.PointC
                    d.PointD=c.PointD
                    coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        d:Remove()
                    end)()
            end            
        end
    end       
end)
