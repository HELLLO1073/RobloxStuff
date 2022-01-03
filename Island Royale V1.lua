--Island Royale
--Beware this code down below is old and un-optimized.

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local Main = library.new("Island Royale V2 | H3LLLO", 5013109572)
print("Loading")
-- themes
local themes = 
{
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}

--#vars
local Character_Parts ={ "RightHand ","LeftLowerArm","LeftUpperArm","LowerTorso","RightLowerArm","LeftUpperLeg","RightUpperLeg","RightUpperArm","RightLowerLeg","LeftLowerLeg","UpperTorso","Head","LeftHand"}
--ESP
local ESP_Boxes = false
local ESP_Names = false 
local ESP_Health = false
local ESP_Shieald = false
local ESP_Enabled = false
local ESP_Chams = false
local ESP_Chams_Outline = false
local ESP_Main_Color = Color3.new(1,0,0)
local ESP_Chams_Color = Color3.new(0,0,0)
local ESP_Chams_Outline_Color = Color3.new(1,0,0)
local World_ESP_Enabled = false
local World_ESP_Chests = false
--World
local World_Visuals_Enabled = false
local World_Ambient = Color3.new(0,0,0)
local World_OutDoorAmbient = nil
local World_Brightness = nil
local World_Blur_Effect = nil
local World_Time = nil
local World_CrossColor = Color3.new(1,0,0)
--Player
local Player_InfiniteJump = false
local SpinbotEnabled = false
local SpinStrength
--Other
local UserInputService = game:GetService("UserInputService")
local XLighting = game.GetService(game, "Lighting") 
local RunService = game:GetService("RunService")
local Players   = game.GetService(game, "Players")
local Player    = Players.LocalPlayer
local CrossHair = Player.PlayerGui["Core_UI"].Crosshairs
local Mouse     = Player:GetMouse()
local CurrentCam = game.GetService(game, "Workspace").CurrentCamera;
print("Loading | %20")
-- first page
local SA_Page = Main:addPage("Aimbot", 5012544693)
local SASection = SA_Page:addSection("Silent Aim")
SASection:addToggle("Silent Aim Enabled", nil, function(state)
    SAEnabled = state
end)


local PlayerPage = Main:addPage("Player", 5012544693)
local PlayerSection = PlayerPage:addSection("Player")
PlayerSection:addToggle("Infinite Jump", nil, function(state)
    Player_InfiniteJump = state
end)
PlayerSection:addButton("Speed Bypass Q (Dont Hold)", function()
    down = false
    velocity = Instance.new("BodyVelocity")
    velocity.maxForce = Vector3.new(100000, 0, 100000)   
    local speed = 200
    gyro = Instance.new("BodyGyro")
    gyro.maxTorque = Vector3.new(100000, 0, 100000)    
    local hum = game.Players.LocalPlayer.Character.Humanoid    
    function onButton1Down(mouse)
    down = true
    velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
    velocity.velocity = (hum.MoveDirection) * speed
    gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
    while down do
    if not down then break end
    velocity.velocity = (hum.MoveDirection) * speed
    local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
    gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
    wait(0.1)
    end
    end    
    function onButton1Up(mouse)
    velocity.Parent = nil
    gyro.Parent = nil
    down = false
    end    
    function onSelected(mouse)
    mouse.KeyDown:connect(function(k) if k:lower()=="q"then onButton1Down(mouse)end end)
    mouse.KeyUp:connect(function(k) if k:lower()=="q"then onButton1Up(mouse)end end)
    end    
    onSelected(game.Players.LocalPlayer:GetMouse())
end)
PlayerSection:addSlider("Player Fov", 0, 0, 120, function(valuex)
    CurrentCam.FieldOfView = valuex
end)
local PlayerSection = PlayerPage:addSection("Anit-Aim")
PlayerSection:addToggle("Spinbot", nil, function(state)
    SpinbotEnabled = state
end)
PlayerSection:addSlider("Spin Strenght", 0, 0, 120, function(valuex)
    SpinStrength = valuex
end)

local ESP_Page = Main:addPage("ESP", 5012544693)
local ESPSection = ESP_Page:addSection("ESP")
local ESPSection2 = ESP_Page:addSection("World ESP")

ESPSection:addToggle("ESP Enabled", nil, function(state)
    ESP_Enabled = state
end)
ESPSection:addToggle("ESP Boxes", nil, function(state)
    ESP_Boxes = state
end)
ESPSection:addToggle("ESP Health", nil, function(state)
    ESP_Health = state
end)
ESPSection:addToggle("ESP Names", nil, function(state)
    ESP_Names = state
end)
ESPSection:addToggle("ESP Chams", nil, function(state)
    ESP_Chams = state
end)
ESPSection:addToggle("ESP Chams Visible outline", nil, function(state)
    ESP_Chams_Outline = state
end)
ESPSection:addColorPicker("ESP Main Color", Color3.fromRGB(200, 0, 0), function(s)
    ESP_Main_Color = s
end)
ESPSection:addColorPicker("ESP Chams Color", Color3.fromRGB(255, 255, 255), function(s)
    ESP_Chams_Color = s
end)
ESPSection:addColorPicker("ESP Chams Visible Color", Color3.fromRGB(255, 0, 0), function(s)
    ESP_Chams_Outline_Color = s
end)
--Section 2
ESPSection2:addToggle("World ESP Enabled", nil, function(state)
    World_ESP_Enabled = state
end)
ESPSection2:addToggle("ESP Chests", nil, function(state)
    World_ESP_Chests = state
end)

local WorldPage = Main:addPage("World", 5012544693)
local WorldSection = WorldPage:addSection("World")
WorldSection:addToggle("World Enabled", nil, function(state)
    World_Visuals_Enabled = state
end)
WorldSection:addColorPicker("Ambient", Color3.fromRGB(200, 0, 0), function(s)
    World_Ambient = s
end)
WorldSection:addColorPicker("Ambient 2", Color3.fromRGB(255, 255, 255), function(s)
    World_OutDoorAmbient = s
end)
WorldSection:addColorPicker("Gun cross-hair color", Color3.fromRGB(255, 0, 0), function(s)
    World_CrossColor = s
end)
WorldSection:addSlider("Brightness", 0, 0, 100, function(valuex)
    World_Brightness = valuex
end)
WorldSection:addSlider("Time", 0, 0, 23, function(valuex)
    World_Time = valuex
end)
WorldSection:addSlider("Blur", 0, 0, 100, function(valuex)
    World_Blur_Effect = valuex
end)

print("Loading | %40")
local theme = Main:addPage("UI", 5012544693)
local Keybind = theme:addSection("Keybind")
Keybind:addKeybind("Toggle Keybind", Enum.KeyCode.P, function()    
    Main:toggle()
    end, function()
    print("Changed Keybind")
end)

local colors = theme:addSection("Colors")
for theme, color in pairs(themes) do 
colors:addColorPicker(theme, color, function(color3)
Main:setTheme(theme, color3)
end)
end

print("Loading | %50")
--Main
coroutine.wrap(function()
    while wait(1)do
        pcall(function()
            if ESP_Enabled then
                if ESP_Chams then
                    for _,v in pairs(Players.GetPlayers(Players)) do
                        if v.Name ~= Player.Name and v.TeamName.Value ~= Player.TeamName.Value and v.Character.Humanoid.Player_Health.Value ~=0 then
                            for _,c in pairs(Character_Parts)do
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
                                    a.Color3=ESP_Chams_Color
                                    coroutine.wrap(function()
                                        wait(1)
                                        a:Destroy()
                                    end)()                               
                                    if ESP_Chams_Outline then
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
                                    a.Color3=ESP_Chams_Outline_Color
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
            end
            Mouse.KeyDown:connect(function(key)
                if Player_InfiniteJump and key == " " then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)  
                    wait()      
                end
            end)
            if World_Visuals_Enabled then                
                XLighting.Ambient = World_Ambient
                XLighting.OutdoorAmbient = World_OutDoorAmbient
                XLighting.Brightness = World_Brightness
                XLighting.TimeOfDay = World_Time                
                XLighting["Blur_Effect"].Size = World_Blur_Effect
                for i,v in pairs(CrossHair:GetChildren()) do
                    v.BackgroundColor3 = World_CrossColor
                    v.BorderColor3 = Color3.new(0,0,0)
                end
            end
        end)
    end
end)()
print("Loading | %70")
game:GetService("RunService").RenderStepped:connect(function()   
    if ESP_Enabled then
        for _,v in pairs(Players.GetPlayers(Players)) do
			if v.Name ~= Player.Name and v.TeamName.Value ~= Player.TeamName.Value and v.Character.Humanoid.Player_Health.Value ~=0 then
            local part=v.Character.HumanoidRootPart
            local _,b=game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if b then
                    if ESP_Names then
                        local a=Drawing.new("Text")
                        a.Text=v.Name
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1
                        a.Color=ESP_Main_Color
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end
                    if ESP_Boxes then
                        local a=Drawing.new("Quad")
                        a.Visible=true
                        a.Color=ESP_Main_Color
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
                    if ESP_Health then
                        local healthnum=v.Character.Humanoid.Player_Health.Value
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
                    if World_ESP_Enabled then                    
                        if World_ESP_Chests then
                            for _,v in pairs(game:GetService("Workspace")["Crate_Spawns"]:GetChildren()) do
                                if v.ClassName == "Model" then
                                    for x,c in pairs(v:GetChildren()) do
                                        if c.Name == "ChestTop" then
                                            local Chestx = c 
                                            local _,n=game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.Position)
                                            if n then
                                                local a=Drawing.new("Quad")
                                                a.Visible=true
                                                a.Color=Color3.new(1,1,0)
                                                a.Thickness=2
                                                a.Transparency=1
                                                a.Filled=false
                                                a.PointA=Vector2.new(
                                                 game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*-2+Chestx.CFrame.UpVector*2.5).X,
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*-2+Chestx.CFrame.UpVector*2.5).Y)-->^
                                                a.PointB=Vector2.new(
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*2+Chestx.CFrame.UpVector*2.5).X,
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*2+Chestx.CFrame.UpVector*2.5).Y)--<^
                                                a.PointC=Vector2.new(
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*2+Chestx.CFrame.UpVector*-2.5).X,
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*2+Chestx.CFrame.UpVector*-2.5).Y)--<V
                                                a.PointD=Vector2.new(
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*-2+Chestx.CFrame.UpVector*-2.5).X,
                                                game.Workspace.CurrentCamera:WorldToViewportPoint(Chestx.CFrame.Position+Chestx.CFrame.RightVector*-2+Chestx.CFrame.UpVector*-2.5).Y)-->V
                                                coroutine.wrap(function()
                                                game.RunService.RenderStepped:Wait()
                                                a:Remove()
                                                end)()                                          
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end                                      
                end
            end
        end
    end
    if SpinbotEnabled then
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(SpinStrength), 0)
    else 
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true	
    end 
end)
print("Loading | %80")

-- player func
local function getClosestPlayer()
    local closestPlayer;
    local shortestDistance = math.huge;
    
    for i, v in next, Players.GetPlayers(Players) do
        if (v ~= Player and v.TeamName.Value ~= Player.TeamName.Value and v.Character and v.Character.FindFirstChild(v.Character, "Head")) then
            local pos       = CurrentCam.WorldToViewportPoint(CurrentCam, v.Character.Head.Position);
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude;

            if (magnitude < shortestDistance) then
                closestPlayer       = v;
                shortestDistance    = magnitude;
            end;
        end;
    end;
    return closestPlayer;
end;
print("Loading | %90")
-- main hook
local oldHook;
oldHook = hookmetamethod(game, "__namecall", function(self, ...)
    local args      = {...};
    local method    = getnamecallmethod();
    
    if (method == "FindPartOnRayWithIgnoreList" and getfenv(2).script.Name == "RC") then
        local closePlayer = getClosestPlayer();

        if (SAEnabled and closePlayer and closePlayer.Character and closePlayer.Character.FindFirstChild(closePlayer.Character, "Head")) then
            local wally = (closePlayer.Character.Head.Position - CurrentCam.CFrame.Position);

            args[1] = Ray.new(CurrentCam.CFrame.Position, wally.unit * wally.magnitude);
        end;
    end;
    
    return oldHook(self, unpack(args));
end);

print("Done Loading")
