--Island Royale

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = 
{
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
local Window = Library.CreateLib("Island Royale | H3LLL0 - V:1", colors)
print("Loading 1%")
--#vars
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local HumParts ={ "RightHand ","LeftLowerArm","LeftUpperArm","LowerTorso","RightLowerArm","LeftUpperLeg","RightUpperLeg","RightUpperArm","RightLowerLeg","LeftLowerLeg","UpperTorso","Head","LeftHand"}
local EspBoxes = false
local EspNames = false 
local EspHealth = false
local EspShield = false
local ESPEnabled = false
local EspChams = false
local EspChamsOutline = false
local EspColorMain
local EspColorChams
local EspColorChamsOutline
local WrldEspEnabled = false
local WrldEspChests = false
local RunService = game:GetService("RunService")
local Players   = game.GetService(game, "Players")
local Player    = Players.LocalPlayer
local Mouse     = Player:GetMouse()
local CurrentCam = game.GetService(game, "Workspace").CurrentCamera;
local InfiniteJumpEnabled = false
warn("Loading script...")
local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("")
MainSec:NewToggle("Silent Aim", "", function(b)
    SAEnabled = b
end)


local PlayerT = Window:NewTab("Player")
local PlrSec = PlayerT:NewSection("")
PlrSec:NewToggle("Infinite Jump", "", function(b)
    InfiniteJumpEnabled = b
end)
PlrSec:NewButton("Speed Bypass (Press Q)", "", function(b)
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
print("Loading 20%")
local Esps = Window:NewTab("Player ESP")
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
local WorldEsp = Window:NewTab("World ESP")
local WorldEspSection = WorldEsp:NewSection("")
WorldEspSection:NewToggle("ESP Enabled (Set color)", "", function(b)
    WrldEspEnabled = b
end)
WorldEspSection:NewToggle("Chests", "", function(b)
    WrldEspChests = b
end)
local Theme = Window:NewTab("Theme")
local themeSec = Theme:NewSection("Theme changer")
for theme, color in pairs(colors) do
    themeSec:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end

local Credits = Window:NewTab("Misc")
local Scripts = Credits:NewSection("Scripts made by H3LLL0/FAZED")
Scripts:NewKeybind("UI Key", "", Enum.KeyCode.P, function(bv)
	Library:ToggleUI()    
end)

coroutine.wrap(function()
    while wait(1)do
        pcall(function()
            if ESPEnabled then
                if EspChams then
                    for _,v in pairs(Players.GetPlayers(Players)) do
                        if v.Name ~= Player.Name and v.TeamName.Value ~= Player.TeamName.Value then
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
                                        wait(1)
                                        a:Destroy()
                                    end)()                               
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
            end
            Mouse.KeyDown:connect(function(key)
                if InfiniteJumpEnabled and key == " " then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)  
                    wait()      
                end
            end)
        end)
    end
end)()
print("Loading 45%")
game:GetService("RunService").RenderStepped:connect(function()   
    if ESPEnabled then
        for _,v in pairs(Players.GetPlayers(Players)) do
			if v.Name ~= Player.Name and v.TeamName.Value ~= Player.TeamName.Value then
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
                end
            end
        end
    end
    if WrldEspEnabled then                    
        if WrldEspChests then
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
end)


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

print'running' -- made by the sexy beast named icee

print("Done Loading")
