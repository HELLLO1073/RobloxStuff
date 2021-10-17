local mainName = "Anomic V.1.2 | H3LLL0";

print("Loading GUI")
if game:GetService("CoreGui"):FindFirstChild(mainName) then
    game.CoreGui[mainName]:Destroy()
end
print("Loading | LIB")
--LIB
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local Main = library.new(mainName, 5013109572)

print("LIB Success")
print("Loading | 1%")

-- Themes
local themes  = 
{Background   = Color3.fromRGB(24, 24, 24),
Glow          = Color3.fromRGB(255, 255, 255),
Accent        = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast  = Color3.fromRGB(14, 14, 14),  
TextColor     = Color3.fromRGB(255, 255, 255)}
-- ESP
local esp_Enabled      = false
local esp_Names        = false
local esp_Boxes        = false
local esp_Health       = false
local esp_Chams        = false
local esp_WantedLevel  = false
local esp_Main_Colour  = Color3.fromRGB(200, 0, 0)
local esp_Chams_Colour = Color3.fromRGB(200, 255, 0)
local rainbow_char     = false
local rainbow_hair     = false
-- Player
local camera   = game:GetService("Workspace").Camera
local wLighting = game:GetService("Lighting")
local wColorCorrection = false
local Players  = game:GetService("Players")
local LPlayer  = Players.LocalPlayer
local Hitboxes = false
local CameraoffsetZ = 0
local CameraoffsetY = 0
local CameraoffsetX = 0
local CameraOffset = false
local clientMarkerModule = require(game.ReplicatedStorage.Client.Marker)
local AutoHeal = false
local flight = false

local headHitboxSize = 5
local charParts = {"Head","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"}
-- Functions 
function notify(title, message)
    game:GetService("Players").LocalPlayer.PlayerGui.Notify.TimePosition = 0
    game:GetService("Players").LocalPlayer.PlayerGui.Notify.Playing = true
    if not message then
        require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(game.Players.LocalPlayer,title)
    else
        require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(game.Players.LocalPlayer,title..": "..message)
    end
end
function purchaseItem(name)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(name,"Single",nil)
end

repeat wait() until LPlayer.Character.HumanoidRootPart.Anchored == false    
    for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Character.DescendantAdded) do
        v:Disable()
	end
    local success, err = pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local namecall = mt.__namecall

        mt.__namecall = function(self,...)
            local args = {...}

            if tostring(getnamecallmethod()) == 'FindPartOnRayWithWhitelist' and getcallingscript() == game.Players.LocalPlayer.PlayerGui['_L.Handler'].GunHandlerLocal then
                wait(9e9)
                return
            end
            return namecall(self,...)
        end
    end)

    if success then
        notify("Anticheat", "Bypass Sucessful")
    else
        notify('Error', err)
end

wait(1)

notify("ANOMIC V.1.2", "Scripts made by H3LLL0 - Forum: F A Z E D")


local c = 1
function zigzag(X)
    return math.acos(math.cos(X * math.pi)) / math.pi
end

print("Loading | 20%")

-- Aimbot / Hitboxes Page
local Aimb = Main:addPage("Main", 5012544693)
local ASection1 = Aimb:addSection("HitBoxes")
ASection1:addToggle("Head hitboxes", nil, function(v)
    Hitboxes = v
end)
ASection1:addSlider("Hitbox size", 1, 0, 55, function(v)
    headHitboxSize = v
end)

--Player Page
local PLa = Main:addPage("Player", 5012544693)
local PlrSection = PLa:addSection("Movement")
PlrSection:addSlider("Player Fov", 50, 0, 170, function(valuex)
    camera.FieldOfView = valuex
end)
PlrSection:addToggle("God / AutoHeal", nil, function(v)
    AutoHeal = v
end)
local plrApp = PLa:addSection("Appearance")
plrApp:addToggle("Outfit Editer", nil, function(v)
    LPlayer.PlayerGui.AvatarEditor.Enabled = v
end)
plrApp:addColorPicker("Skin Color", Color3.fromRGB(255, 255, 255), function(s)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",s,"SkinColor")
end)
plrApp:addColorPicker("Hair Color", Color3.fromRGB(255, 255, 255), function(s)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").EquipAvatarItem:FireServer("Color",s,"HairColor")
end)
plrApp:addToggle("Rainbow Character", nil, function(v)
    rainbow_char = v
end)
plrApp:addToggle("Rainbow Hair", nil, function(v)
    rainbow_hair = v
end)
local plrSection = PLa:addSection("Camera Offset")
plrSection:addToggle("Enabled", nil, function(state)
    CameraOffset = state
end)
plrSection:addSlider("Camera offset Z", 0, 0, 20, function(valuex)
    CameraoffsetZ = valuex
end)
plrSection:addSlider("Camera offset Y", 0, 0, 20, function(valuex)
    CameraoffsetY = valuex
end)
plrSection:addSlider("Camera offset X", 0, 0, 20, function(valuex)
    CameraoffsetX = valuex
end)
local teamSection = PLa:addSection("TeamChanger  (Cooldown)")
teamSection:addDropdown("Team changer", {"Gunsmith", "Civilian", "Crafter", "Advanced Gunsmith", "Trucker", "Tow Trucker", "Secret Service", "Advanced Car Dealer", "Car Dealer","Deliverant", "Criminal", "Crafter", "Cab Driver", "Paramedic", "Mayor", "Military", "SWAT", "Sheriff"}, function(team)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").TeamChanger:FireServer(team)
end)

-- ESP Page
local Esp = Main:addPage("ESP | Visuals", 5012544693)
local EspSection = Esp:addSection("ESP")
EspSection:addToggle("ESP Enabled", nil, function(v)
    esp_Enabled = v
end)
local maxDisance = 1000;
EspSection:addSlider("Max distance (Helps stop lag)", 100, 0, 2000, function(v)
    maxDisance = v
end)
local EspSection1 = Esp:addSection("ESP Enabled")
EspSection1:addToggle("ESP Boxes", nil, function(state)
    esp_Boxes = state
end)
EspSection1:addToggle("ESP Health", nil, function(state)
    esp_Health = state
end)
EspSection1:addToggle("ESP Names", nil, function(state)
    esp_Names = state
end)
EspSection1:addToggle("ESP status level", nil, function(state)
    esp_WantedLevel = state
end)
EspSection1:addColorPicker("ESP Main Color", Color3.fromRGB(200, 0, 0), function(s)
    esp_Main_Colour = s
end)
local EspSection2 = Esp:addSection("ESP Chams")
EspSection2:addToggle("Chams Enabled", nil, function(v)
    esp_Chams = v
end)
EspSection2:addColorPicker("Chams Color", Color3.fromRGB(255, 0, 0), function(s)
    esp_Chams_Colour = s
end)
local wrldSection = Esp:addSection("Client World")
wrldSection:addSlider("ClockTime", 0, 0, 23, function(valuex)
    wLighting.ClockTime = valuex
end)
wrldSection:addSlider("Brightness", 1, 0, 25, function(valuex)
    wLighting.Brightness = valuex
end)
wrldSection:addSlider("Exposure", 1, 0, 5, function(valuex)
    wLighting.ExposureCompensation = valuex
end)
wrldSection:addToggle("Shadows", nil, function(state)
    wLighting.GlobalShadows = state
end)
wrldSection:addToggle("Color Correction", nil, function(state)
    wLighting.ColorCorrection.Enabled = state
end)
wrldSection:addColorPicker("Color Correction", Color3.fromRGB(255, 255, 255), function(s)    
    wLighting.ColorCorrection.TintColor = s    
end)
wrldSection:addColorPicker("Ambient", Color3.fromRGB(150, 140, 140), function(s)    
    wLighting.Ambient = s    
end)

local tele = Main:addPage("Teleportation", 5012544693)
local teleSection = tele:addSection("Player")
local targetName = nil;
teleSection:addTextbox("Target Name", "Default", function(plr)
    print(plr)
    targetName = plr
end)
teleSection:addButton("Teleport to target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
        end
    end
end)
local teleSection2 = tele:addSection("Location Teleport")
teleSection2:addButton("Arway", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1861.14111, -65.5734253, -1310.6853, 0.998740196, 0, -0.0501802117, 0, 1, 0, 0.0501802117, 0, 0.998740196)
end)
teleSection2:addButton("Pahrump", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-73.3169708, 9.45411873, 40.8025475, 0.0519082919, 0, -0.998651743, 0, 1, 0, 0.998651743, 0, 0.0519082919)
end)
teleSection2:addButton("Eastdike", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3044.31445, -4.52655077, -3741.91479, -0.939210117, -1.1611624e-07, -0.343343019, -1.19063124e-07, 1, -1.24975301e-08, 0.343343019, 2.91416864e-08, -0.939210117)
end)
teleSection2:addButton("Eaphis Plateau", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1751.93347, 77.9265747, 556.575073, 0.99836874, 0, 0.0570888072, 0, 1, 0, -0.0570888072, 0, 0.99836874)
end)
teleSection2:addButton("Okby Steppe", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3894.29224, -2.04217577, -3309.31274, 0.819154441, 5.08817486e-08, 0.573573053, -8.20474284e-08, 1, 2.84667561e-08, -0.573573053, -7.03788601e-08, 0.819154441)
end)
teleSection2:addButton("Depository", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2051.33301, -67.4034195, -1436.65967, 0.989166439, 0, 0.146798298, 0, 1, 0, -0.146798298, 0, 0.989166439)
end)
teleSection2:addButton("Airfield", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1884.29016, -21.3613071, -36.481102, -0.659217179, 1.00295431e-07, -0.751953006, 6.3527267e-08, 0.99999994, 7.7687254e-08, 0.751953006, 3.44318352e-09, -0.659217179)
end)
teleSection2:addButton("Player lobby", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(451.888794, -8.47341156, -1337.15466, -0.0644594803, 5.36564535e-08, -0.997920215, 3.67105028e-13, 1, 5.37682183e-08, 0.997920215, 3.46550766e-09, -0.0644594803)
end)
teleSection2:addButton("Safe Spot 1", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2122.71143, -83.3322983, -1404.4574, -0.701904893, -3.58332279e-08, 0.712271094, -3.54125085e-08, 1, 1.54112971e-08, -0.712271094, -1.4406039e-08, -0.701904893)
end)
teleSection2:addButton("Safe Spot 2", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2945.89185, -137.832367, -631.946899, -0.0719730258, -0.0382576138, 0.996672332, -5.91074745e-08, 0.999264121, 0.0383570902, -0.997406602, 0.00276061334, -0.0719199777)
end)
teleSection2:addButton("Safe Spot 3", function()
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365)
end)

local misc = Main:addPage("Miscellaneous", 5012544693)
local miscSection0 = misc:addSection("Discord")
local miscSection = misc:addSection("Misc")
miscSection0:addButton("join Discord", function()
    syn.request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Origin"] = "https://discord.com"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            cmd = "INVITE_BROWSER",
            args = {
                code = "chBXmh2C4Q"
            },
            nonce = game:GetService("HttpService"):GenerateGUID(false)
        }),
      })
end)
miscSection:addButton("Unlock cars (LOOP)", function() 
    while wait(3) do
        for i,v in pairs(game:GetService("Workspace").PlayerVehicles:GetDescendants()) do
            if v:IsA("VehicleSeat") or v:IsA("Seat") then
                v.Disabled = false
                wait(.3)
            end
        end
    end
end)
miscSection:addToggle("Mark all atm's", nil, function(state)
    if state then
        clientMarkerModule:MarkAllATMs();
    else 
        clientMarkerModule:DeleteATMMarkings();
    end
end)

local boomSection = misc:addSection("BoomBox player (Hold Boombox")
boomSection:addButton("Among us Drip", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=6065418936")
end)
boomSection:addButton("Rick & Morty", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=7009577773")
end)
boomSection:addButton("Gangsters Paridise", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=4710724900")
end)
boomSection:addButton("Moonlight", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=2924787912")
end)
boomSection:addButton("Righteous", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=4588756335")
end)
boomSection:addButton("Screaming", function() 
    game:GetService("Players").LocalPlayer.Character.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=271550300")
end)
print("Loading | 30%")

local Ui = Main:addPage("UI", 5012544693)
local UISection = Ui:addSection("UI")
UISection:addKeybind("GUI Keybind", Enum.KeyCode.LeftAlt, function()    
    Main:toggle()
    end, function()    
end)
print("Loading | 40%")
local colors = Ui:addSection("Colors")
for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
        colors:addColorPicker(theme, color, function(color3)            
        Main:setTheme(theme, color3)            
    end)
end

print("Loading | 50%")
coroutine.wrap(function()
    while wait(2)do
        pcall(function()     
            if Hitboxes then   
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Name ~= game.Players.LocalPlayer.Name and v.Character and v.Character:FindFirstChild('Head')then
                        v.Character.Head.Size = Vector3.new(headHitboxSize,headHitboxSize,headHitboxSize)
                        v.Character.Head.Transparency = 0.7
                        v.Character.Head.CanCollide = false
                    end
                end
            end
        end)
    end
end)()
coroutine.wrap(function()
    while wait(1)do
        pcall(function()            
            if esp_Enabled then
                if esp_Chams then          
                    for _,v in pairs(Players:GetPlayers()) do
                        if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v ~= LPlayer then
                            local distance = LPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
                            for _,c in pairs(charParts) do
                                if v.Character:FindFirstChild(c) and distance < maxDisance then
                                    local part = v.Character[c]
                                    local a = Instance.new("BoxHandleAdornment")
                                    if c == "Head"then
                                        a.Size = Vector3.new(1.05,1.05,1.05)
                                    else
                                        a.Size = part.Size + Vector3.new(.05,.05,.05)
                                    end
                                    a.Parent = game.CoreGui
                                    a.AlwaysOnTop = true
                                    a.Adornee = part
                                    a.ZIndex = 0
                                    a.Transparency = 0.5
                                    a.Color3 = esp_Chams_Colour
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
    if esp_Enabled then       
        for _,v in pairs(Players:GetChildren()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v ~= LPlayer then
            local part = v.Character.HumanoidRootPart             
            local distance = LPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
            local _,b=game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if b then
                    if esp_Names and distance < maxDisance and distance > 7 then
                        local a=Drawing.new("Text")
                        a.Text=v.Name 
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1
                        a.Color=esp_Main_Colour
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/40)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end
                    if esp_Boxes and distance < maxDisance then
                        local a=Drawing.new("Quad")
                        a.Visible=true
                        a.Color=esp_Main_Colour
                        a.Thickness=1
                        a.Transparency=1
                        a.Filled=false
                        a.PointA=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).Y)
                        a.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)
                        a.PointC=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)
                        a.PointD=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end
                    if esp_Health and distance < maxDisance then
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
                    if esp_WantedLevel and distance < maxDisance and distance > 7 then
                        local a = Drawing.new("Text")
                        local wantedLevel = v.Character.Wanted.Value
                        if wantedLevel == 1 then                           
                            a.Text = "Innocent" 
                            a.Color = Color3.fromRGB(60, 163, 0)
                        else
                            a.Text = "Wanted"
                            a.Color = Color3.fromRGB(180, 0, 0)
                        end
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1                        
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/75)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end                                         
                end
            end                       
        end
    end  
    if LPlayer.Character.Humanoid.Health < 70 and LPlayer.Character.Humanoid.Health > 0 and AutoHeal then        
        if not LPlayer.Backpack:FindFirstChild("Medi Kit") then
            purchaseItem("Medi Kit")         
        else                     
            for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
                if t:IsA("Tool") and t.Name == "Medi Kit" then          
                    LPlayer.Character.Humanoid:EquipTool(t)            
                    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").ToolEvent:FireServer("Heal",LPlayer.Character, t)  
                end
            end
        end
    end    
    if rainbow_hair or rainbow_char then      
        local colorx = Color3.fromHSV(zigzag(c),1,1)
        c = c + .001
        if rainbow_hair then        
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"HairColor")
        end
        if rainbow_char then           
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"SkinColor")            
        end
    end  
    if CameraOffset then 
        game.Workspace.CurrentCamera.CFrame = game.Workspace.CurrentCamera.CFrame * CFrame.new(CameraoffsetX,CameraoffsetY,CameraoffsetZ)
    end
end)

Main:SelectPage(Main.pages[1], true)
print("Finished Loading | 100%")
