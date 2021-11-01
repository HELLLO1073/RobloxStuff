
--< ANOMIC V SOURCE
--< BY H3

print("Loading GUI")
if game:GetService("CoreGui"):FindFirstChild("Anomic V | 2.5.2") then
    game.CoreGui["Anomic V | 2.5.2"]:Destroy()
end

print("Loading | LIB")
-- Library 
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local Main = library.new("Anomic V | 2.5.2", 5013109572)

--LOGS - (Open source)


-- Ingame theme
print("Theme loading")
loadstring(game:HttpGet("https://raw.githubusercontent.com/HELLLO1073/RobloxStuff/main/AnomicInGameTheme.lua"))()
print("Theme success")

print("Loading | R")
if syn then
    syn.request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    print("Loading | R 50%");
    Body = game:GetService("HttpService"):JSONEncode({
        cmd = "INVITE_BROWSER",
        args = {
            code = "chBXmh2C4Q"
        },
            nonce = game:GetService("HttpService"):GenerateGUID(false)
        }),
    })
end

local chatSettings = require(game:GetService("Chat").ClientChatModules.ChatSettings)
local chatFrame = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame
chatSettings.WindowResizable = true
chatSettings.WindowDraggable = true
chatFrame.ChatChannelParentFrame.Visible=true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

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
local esp_Health       = false
local esp_traces       = false
local esp_WantedLevel  = false
local esp_Main_Colour  = Color3.fromRGB(200, 0, 0)
local rainbow_char     = false
local rainbow_hair     = false
local renderNameTags   = false
local backpackDisplay  = false
-- Main
local RS = game:GetService("ReplicatedStorage")
local itemList = require(game.ReplicatedStorage.Client.ItemList)
local camera   = game:GetService("Workspace").Camera
local wLighting = game:GetService("Lighting")
local teamList = require(RS.Client.TeamList)
local Players  = game:GetService("Players")
local UIS = game:GetService'UserInputService'
local LPlayer  = Players.LocalPlayer
local LPChar = LPlayer.Character
local mouse = LPlayer:GetMouse()
-- Mods
local infiniteStamina = false
local jumpMode = "Infinite"
local infiniteJump = false
local gunSoundSpam = false
local speedBypass = false
local shotgunMod1 = false
local shotgunMod2 = false
local headHitboxSize = 5
local autoStore = false
local AutoHeal = false
local Hitboxes = false
local antiCar = false

local function main()
    repeat wait() until LPChar.HumanoidRootPart.Anchored == false    
        for i, v in next, getconnections(LPChar.DescendantAdded) do
            v:Disable()
    	end
        local _, err = pcall(function()
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local namecall = mt.__namecall

            mt.__namecall = function(self,...)
                local args = {...}
                local method = getnamecallmethod()
                if tostring(method) == 'FindPartOnRayWithWhitelist' and getcallingscript() == LPlayer.PlayerGui['_L.Handler'].GunHandlerLocal then
                    wait(9e9)
                    return
                end
                if tostring(method) == "FireServer" then
                    if shotgunMod1 and tostring(self) == "AmmoRemover" then                        
                        return nil
                    end
                    if shotgunMod2 and tostring(self) == "RayDrawer" then                        
                        return nil
                    end                    
                end
            return namecall(self,...)
        end
    end)         
end
print("Loading | TeamMod")

-- Default team mod
for i,v in pairs(teamList) do    
    v.DataType = v.DataType .. " :  Anomic V"   
    v.Spawns = { "Arway", "Sheriff Station", "Eastdike", "Eaphis Plateau", "Pahrump", "Okby Steppe", "Depository", "Airfield", "Depot", "Clinic", "Towing Company"}    
    v.MaxPlayers = 999 
end
print("Loading | 10%")
-- Functions 
local function sendNotification(title)LPlayer.PlayerGui.Notify.TimePosition = 0 LPlayer.PlayerGui.Notify.Playing = true require(RS:WaitForChild("Client").NotificationHandler):AddToStream(LPlayer,title) end local function purchaseItem(name)RS:FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(name,"Single",nil)end
local function aC(Object, Function) if Object ~= nil then Function(Object)end end
local function noclip() if LPChar ~= nil then for _, child in pairs(LPChar:GetDescendants())do if child:IsA("BasePart") and child.CanCollide == true then child.CanCollide = false end end end end
local function getImageId(item) for i, v in pairs(itemList)do if i == item.Name then return v.ImageID end end end
local function refreshDisplay(plr)local itemDisplay = xdisplay:addItemDisplay(plr) for _,x in pairs(plr.Backpack:GetChildren()) do if x.ClassName == "Tool" then itemDisplay:addItem(x.Name,getImageId(x))end end end
local xdisplay = {}
function xdisplay:addItemDisplay(player)
	if player.Character.UpperTorso:FindFirstChild("ItemDisplay") then		
		player.Character.UpperTorso["ItemDisplay"]:Destroy()		
	end
	print("Added display to " .. player.Name)
	local ItemDisplay = Instance.new("BillboardGui")	
	local UIGridLayout = Instance.new("UIGridLayout")

	ItemDisplay.Name = "ItemDisplay"
	ItemDisplay.Parent = player.Character.UpperTorso
	ItemDisplay.Active = true
	ItemDisplay.MaxDistance = 90
	ItemDisplay.Size = UDim2.new(5, 0, 1.5, 0)
	ItemDisplay.SizeOffset = Vector2.new(0.800000012, 1)
    ItemDisplay.AlwaysOnTop = true

	UIGridLayout.Parent = ItemDisplay
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0.03, 0, 0.005, 0)
	UIGridLayout.CellSize = UDim2.new(0.17, 0, 0.4, 0)
    local insideDisplay = {}

	function insideDisplay:addItem(name,imageId)
        local Item = Instance.new("ImageButton")
	    local ItemImage = Instance.new("ImageLabel")        
		Item.Name = name
		Item.Parent = ItemDisplay
		Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Item.BackgroundTransparency = 1.000
		Item.BorderSizePixel = 0
		Item.Position = UDim2.new(0.300000012, 0, 0.100000001, 0)
		Item.Size = UDim2.new(1.5, 0, 1.5, 0)
		Item.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Item.Image = "rbxassetid://4509767787"

		ItemImage.Name = "ItemImage"
		ItemImage.Parent = Item
		ItemImage.AnchorPoint = Vector2.new(0, 0.5)
		ItemImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ItemImage.BackgroundTransparency = 1.000
		ItemImage.Position = UDim2.new(0, 0, 0.5, 0)
		ItemImage.Size = UDim2.new(1, 0, 1, 0)
		ItemImage.Image = imageId
	end    
    return insideDisplay
end
print("Loading | 15%")
-- Combat Section
local combS = Main:addPage("Main", 5012544693)
local ASection1 = combS:addSection("Head Hitboxes")
local ASection2 = combS:addSection("Weapon Mods")
ASection1:addToggle("Head hitboxes", nil, function(v)
    Hitboxes = v
end)
ASection1:addSlider("Hitbox size", 1, 0, 55, function(v)
    headHitboxSize = v
end)
ASection2:addToggle("Infinite shotgun ammo", nil, function(x)   
    shotgunMod2 = x    
    main()
end)
ASection2:addToggle("Ghost Shotgun", nil, function(x)   
    shotgunMod1 = x    
    main()
end)
ASection2:addToggle("Gun Silencer", nil, function(x)   
    for i,v in pairs(LPChar:GetChildren()) do
        if v:IsA("Tool") then
            if v.Handle:FindFirstChild("ReloadSound") then
                if v.Handle:FindFirstChild("GunEmpty") and x then                   
                    v.Handle.Shot.Name = "" 
                    v.Handle.GunEmpty.Name = "Shot"                                       
                else
                    v.Handle.Shot.Name = "GunEmpty" 
                    v.Handle[""].Name = "Shot"                
                end
            else
                return
            end
        end
    end    
end)
ASection2:addToggle("Gun Sound Spam", nil, function(x)   
    gunSoundSpam = x
end)
ASection2:addButton("No shotgun reload", function()    
    for i, v in pairs(itemList) do
        if v.DataType == "RangedWeapon" and v.Firemode == "Shot" then                         
            v.ReloadTime = 0.01                       
        end 
    end    
end)
--Player Page
local PLa = Main:addPage("Player", 5012544693)
local PlrSection = PLa:addSection("Movement")
local PlrSectionC = PLa:addSection("Crafter Role")
local plrApp = PLa:addSection("Appearance")
local teamSection = PLa:addSection("TeamChanger  (Cooldown)")
PlrSection:addSlider("Player Fov", 50, 0, 170, function(valuex)
    camera.FieldOfView = valuex
end)
PlrSection:addDropdown("Infinite Jump Mode", {"Fly", "Infinite", }, function(x)
    jumpMode = x
end)
PlrSection:addToggle("Infinite Jump", nil, function(v)
    infiniteJump = v
end)   
PlrSection:addToggle("Noclip", nil, function(v)
    if v then
        nx = game:GetService('RunService').Stepped:Connect(noclip)
    else
        nx:Disconnect()
    end
end)
PlrSection:addToggle("Infinite Stamina", nil, function(v)
    infiniteStamina = v    
    for i,x in pairs(LPChar:GetChildren()) do
    if x:IsA("LocalScript") and x.Name ~= "KeyDrawer" and x.Name ~= "Animate" and x.Name ~= "AnimationHandler" then if v then
                x.Disabled = true
            else
                x.Disabled = false
            end 
        end 
    end
end) 
PlrSection:addToggle("Speed Bypass - (Dont walk into terrain)", nil, function(v)    
    speedBypass = v
end)
PlrSection:addToggle("Anti - Car", nil, function(v)    
    antiCar = v
end)
PlrSectionC:addToggle("Crafter + Paramedic Auto-heal", nil, function(v)
    AutoHeal = v
end)
PlrSectionC:addButton("Equip Armor - Helmet + Heavy Vest", function()
    RS:FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Battle Helmet","Single",nil)
    wait(.4)
    RS:FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Heavy Vest","Single",nil)
    wait(.3)
    for i,v in pairs(LPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == "Heavy Vest" then 
            LPChar.Humanoid:EquipTool(v)   
            RS:FindFirstChild("_CS.Events").EquipArmor:FireServer()
        end 
        wait(.5)
        if v:IsA("Tool") and v.Name == "Battle Helmet" then 
            LPChar.Humanoid:EquipTool(v)
            RS:FindFirstChild("_CS.Events").EquipArmor:FireServer() 
        end                 
    end
    sendNotification("Equiped armor")
end)

plrApp:addToggle("Outfit Editer", nil, function(v)
    LPlayer.PlayerGui.AvatarEditor.Enabled = v
end)
plrApp:addDropdown("Presets", {"Black", "Glitch", "Black & White", "Hacker"}, function(t)
    if t == "Black" then
            RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6523367474)
            RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",745499244)
        else if t == "Glitch" then
                RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6296322488)
                RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6296389518)
            else if t == "Hacker" then
                RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",5594922955)
                RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6967030358)
                else if t == "Black & White"  then
                    RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",4797295258)
                    RS["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",4977671127)
                    RS["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(0,0,0),"SkinColor")
                    RS:FindFirstChild("_CS.Events").EquipAvatarItem:FireServer("Color",Color3.fromRGB(255, 255, 255),"HairColor")
                end
            end
        end
    end
end)
plrApp:addColorPicker("Skin Color", Color3.fromRGB(255, 255, 255), function(s)
    RS["_CS.Events"].EquipAvatarItem:FireServer("Color",s,"SkinColor")
end)
plrApp:addColorPicker("Hair Color", Color3.fromRGB(255, 255, 255), function(s)
    RS:FindFirstChild("_CS.Events").EquipAvatarItem:FireServer("Color",s,"HairColor")
end)
plrApp:addToggle("Rainbow Character", nil, function(v)
    rainbow_char = v
end)
plrApp:addToggle("Rainbow Hair", nil, function(v)
    rainbow_hair = v
end)
plrApp:addButton("Glitch player" ,function()   
    local H = LPChar:FindFirstChildWhichIsA('Humanoid')
    local function DO()for i,v in pairs(LPChar:GetDescendants()) do if v.Name == 'OriginalSize' then v:Destroy() end if v.Name == 'OriginalPosition' then v:Destroy()end end end       
    wait(.8)
    DO()
    H:FindFirstChild("BodyDepthScale"):Destroy()    
    wait(.8)
    DO()
    H:FindFirstChild("BodyTypeScale"):Destroy()          
    wait(.8) 
    DO()
    H:FindFirstChild("BodyProportionScale"):Destroy()   
    wait(.8)
    DO()
    H:FindFirstChild("HeadScale"):Destroy() 
    wait(.8)
    DO()
    H:FindFirstChild("BodyWidthScale"):Destroy()  
end)
plrApp:addButton("Respawn" ,function()   
    RS["_CS.Events"].PayLoad:FireServer()
end)
teamSection:addDropdown("Team Changer", {"Gunsmith", "Civilian", "Crafter", "Advanced Gunsmith", "Trucker", "Tow Trucker", "Secret Service", "Advanced Car Dealer", "Car Dealer","Deliverant", "Criminal", "Crafter", "Cab Driver", "Paramedic", "Mayor", "Military", "SWAT", "Sheriff"}, function(team)
    RS:FindFirstChild("_CS.Events").TeamChanger:FireServer(team)
end)
print("Loading | 25%")
-- ESP Page
local Esp = Main:addPage("ESP | Visuals", 5012544693)
local DisplaySection = Esp:addSection("Display")
local EspSection = Esp:addSection("ESP")
DisplaySection:addToggle("Display backpacks", nil, function(v)
    backpackDisplay = v
end)
DisplaySection:addToggle("Names AlwaysOnTop", nil, function(v)
    renderNameTags = v
end)

EspSection:addToggle("ESP Enabled", nil, function(v)
    esp_Enabled = v
end)
local maxDisance = 100;
EspSection:addSlider("Max distance (Helps stop lag)", 100, 0, 2000, function(v)
    maxDisance = v
end)
local EspSection1 = Esp:addSection("ESP Enabled")
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

local Other = Main:addPage("Other Players", 6031280883)
local OtherSection = Other:addSection("Specific")
local OtherSection0 = Other:addSection("Troll")
local targetName = nil;
local plrNum = 1
OtherSection:addTextbox("Target Name", "Default", function(plr)
    print(plr)
    targetName = plr
end)
OtherSection:addButton("Teleport to target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            LPChar.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
            workspace.Camera.CameraSubject = LPChar.Humanoid
        end
    end
end)
OtherSection:addButton("View target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            workspace.Camera.CameraSubject = v.Character.Humanoid
        end
    end
end)
OtherSection:addButton("Un View", function()    
    workspace.Camera.CameraSubject = LPChar.Humanoid       
end)
OtherSection:addButton("Get Backpack items", function()    
    for i,v in pairs(Players:GetChildren()) do
        if v.Name:match(targetName) then
            for c,x in pairs(v.Backpack:GetChildren()) do
                sendNotification("Item: ".. x.Name)
            end
        end
    end     
end)
local donateAmount = 10
local OtherSection = Other:addSection("Donate - Uses Target Name")
OtherSection:addTextbox("Donate Amount Value", "0", function(v)
    donateAmount = v
end)
OtherSection:addSlider("Donate Amount Slider", 10, 0, 100000, function(v)
    donateAmount = v
end)
OtherSection:addButton("Donate to target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then  
            local cas = tostring(donateAmount)
            RS:FindFirstChild("_CS.Events").GiveMoneyToPlr:FireServer(v,cas)
            print(cas)
        end
    end
end)
OtherSection0:addButton("Arrest Player", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            if v.Character.Wanted.Value == 0 then  
                sendNotification(v.Name .. ": Is not wanted")  
            else                            
                oldPos = LPChar.HumanoidRootPart.CFrame
                LPChar.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                wait(.1)
                RS:FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)
                wait(.1)
                RS:FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)
                wait(.1)
                LPChar.HumanoidRootPart.CFrame = oldPos                       
            end
        end
    end
end)
local autoArrest = false
OtherSection0:addToggle("Arrest all", nil, function(state)
    autoArrest = state
end)
local OtherSection = Other:addSection("Spectate")
OtherSection:addButton("View Next Player", function()
    if plrNum < #game.Players:GetPlayers() then
        plrNum = plrNum + 1
        for i,v in pairs(game.Players:GetPlayers()) do
        if i == plrNum then
            game.Workspace.Camera.CameraSubject = v.Character.Humanoid
            if plrNum ~= 1 then
                for i,v in pairs(game:service'Players':GetPlayers()) do
                    if i == plrNum then
                        for c,x in ipairs(v.Backpack:GetChildren()) do
                            sendNotification(plrNum .. ":" .. x.Name)
                            end
                        end
                    end
                end
            end
        end
    end
end)
OtherSection:addButton("View Previous Player", function()
    if plrNum ~= 1 then
        plrNum = plrNum - 1
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if i == plrNum then
            game.Workspace.Camera.CameraSubject = v.Character.Humanoid
            if plrNum ~= 1 then
                for i,v in pairs(game:service'Players':GetPlayers()) do
                    if i == plrNum then
                        for c,x in ipairs(v.Backpack:GetChildren()) do
                            sendNotification(plrNum .. ":" .. x.Name)
                        end
                    end
                end
            end
        end
    end
end)
OtherSection:addButton("View Self", function()
    if plrNum ~= 1 then
        plrNum = 1
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if i == plrNum then
        game.Workspace.Camera.CameraSubject = v.Character.Humanoid
        end
    end
end)
OtherSection:addButton("Teleport To Spectated", function()
    if plrNum ~= 1 then
        for i,v in pairs(game.Players:GetPlayers()) do
            if i == plrNum then
                LPChar.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
                if plrNum ~= 1 then
                    plrNum = 1
                end
                for i,v in pairs(game.Players:GetPlayers()) do
                    if i == plrNum then
                        game.Workspace.Camera.CameraSubject = v.Character.Humanoid
                    end
                end
            end
        end
    end
end)
local tele = Main:addPage("Teleportation", 6031280883)
local teleSection1 = tele:addSection("Player")
local teleSection2 = tele:addSection("Location Teleport")
local teleSection3 = tele:addSection("Safe spots")
local teleSection4 = tele:addSection("Miscellaneous")
local currentVehicle;
coroutine.wrap(function()
    while wait(.7) do
        if LPChar.Humanoid.SeatPart ~= nil then
            currentVehicle = LPChar.Humanoid.SeatPart.Parent
        else 
            currentVehicle = nil
        end
    end
end)()
teleSection1:addKeybind("Click TP Keybind", nil, function()
    if mouse.Target then 
        if currentVehicle ~= nil then
            currentVehicle:SetPrimaryPartCFrame(CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) * CFrame.new(0,-2,0))
        else 
        LPChar.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)      
        end
    end
end)
teleSection2:addButton("Arway", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(1861.14111, -65.5734253, -1310.6853, 0.998740196, 0, -0.0501802117, 0, 1, 0, 0.0501802117, 0, 0.998740196) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(1861.14111, -65.5734253, -1310.6853, 0.998740196, 0, -0.0501802117, 0, 1, 0, 0.0501802117, 0, 0.998740196)end end)
teleSection2:addButton("Pahrump", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(-73.3169708, 9.45411873, 40.8025475, 0.0519082919, 0, -0.998651743, 0, 1, 0, 0.998651743, 0, 0.0519082919) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(-73.3169708, 9.45411873, 40.8025475, 0.0519082919, 0, -0.998651743, 0, 1, 0, 0.998651743, 0, 0.0519082919)end end)
teleSection2:addButton("Eastdike", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(3044.31445, -4.52655077, -3741.91479, -0.939210117, -1.1611624e-07, -0.343343019, -1.19063124e-07, 1, -1.24975301e-08, 0.343343019, 2.91416864e-08, -0.939210117) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(3044.31445, -4.52655077, -3741.91479, -0.939210117, -1.1611624e-07, -0.343343019, -1.19063124e-07, 1, -1.24975301e-08, 0.343343019, 2.91416864e-08, -0.939210117)end end)
teleSection2:addButton("Eaphis Plateau", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(1751.93347, 77.9265747, 556.575073, 0.99836874, 0, 0.0570888072, 0, 1, 0, -0.0570888072, 0, 0.99836874) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(1751.93347, 77.9265747, 556.575073, 0.99836874, 0, 0.0570888072, 0, 1, 0, -0.0570888072, 0, 0.99836874)end end)
teleSection2:addButton("Okby Steppe", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(3894.29224, -2.04217577, -3309.31274, 0.819154441, 5.08817486e-08, 0.573573053, -8.20474284e-08, 1, 2.84667561e-08, -0.573573053, -7.03788601e-08, 0.819154441) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(3894.29224, -2.04217577, -3309.31274, 0.819154441, 5.08817486e-08, 0.573573053, -8.20474284e-08, 1, 2.84667561e-08, -0.573573053, -7.03788601e-08, 0.819154441)end end)
teleSection2:addButton("Depository", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(2051.33301, -67.4034195, -1436.65967, 0.989166439, 0, 0.146798298, 0, 1, 0, -0.146798298, 0, 0.989166439) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(2051.33301, -67.4034195, -1436.65967, 0.989166439, 0, 0.146798298, 0, 1, 0, -0.146798298, 0, 0.989166439)end end)
teleSection2:addButton("Airfield", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(1884.29016, -21.3613071, -36.481102, -0.659217179, 1.00295431e-07, -0.751953006, 6.3527267e-08, 0.99999994, 7.7687254e-08, 0.751953006, 3.44318352e-09, -0.659217179) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(1884.29016, -21.3613071, -36.481102, -0.659217179, 1.00295431e-07, -0.751953006, 6.3527267e-08, 0.99999994, 7.7687254e-08, 0.751953006, 3.44318352e-09, -0.659217179)end end)
teleSection3:addButton("Safe Spot 1", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(2122.71143, -83.3322983, -1404.4574, -0.701904893, -3.58332279e-08, 0.712271094, -3.54125085e-08, 1, 1.54112971e-08, -0.712271094, -1.4406039e-08, -0.701904893) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(2122.71143, -83.3322983, -1404.4574, -0.701904893, -3.58332279e-08, 0.712271094, -3.54125085e-08, 1, 1.54112971e-08, -0.712271094, -1.4406039e-08, -0.701904893)end end)
teleSection3:addButton("Safe Spot 2", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(2945.89185, -137.832367, -631.946899, -0.0719730258, -0.0382576138, 0.996672332, -5.91074745e-08, 0.999264121, 0.0383570902, -0.997406602, 0.00276061334, -0.0719199777) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(2945.89185, -137.832367, -631.946899, -0.0719730258, -0.0382576138, 0.996672332, -5.91074745e-08, 0.999264121, 0.0383570902, -0.997406602, 0.00276061334, -0.0719199777)end end)
teleSection3:addButton("Safe Spot 3", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365)end end)
teleSection4:addButton("Player lobby", function()
if currentVehicle ~= nil then
    currentVehicle:SetPrimaryPartCFrame(CFrame.new(451.888794, -8.47341156, -1337.15466, -0.0644594803, 5.36564535e-08, -0.997920215, 3.67105028e-13, 1, 5.37682183e-08, 0.997920215, 3.46550766e-09, -0.0644594803) * CFrame.new(0,5,0))
else 
LPChar.HumanoidRootPart.CFrame = CFrame.new(451.888794, -8.47341156, -1337.15466, -0.0644594803, 5.36564535e-08, -0.997920215, 3.67105028e-13, 1, 5.37682183e-08, 0.997920215, 3.46550766e-09, -0.0644594803)end end)

-- Buy Page
local Buy = Main:addPage("Auto Buy", 6034509993)
local paintSection    = Buy:addSection("Painting")
local BuySectionAmmo = Buy:addSection("Ammmo Buyer")
local BuySectionMisc2 = Buy:addSection("Misc / Troll")
local currentTool = nil 
local color1 = Color3.fromRGB(255,255,255)
local color2 = Color3.fromRGB(255,255,255)
paintSection:addColorPicker("Primary Color", Color3.fromRGB(255,255,255), function(c)
    color1 = c
end)
paintSection:addColorPicker("Secondary Color", Color3.fromRGB(255,255,255), function(c)
    color2 = c
end)
paintSection:addButton("Paint current tool", function()
    for i,v in pairs(LPChar:GetChildren()) do
        if v:IsA("Tool") and v ~= nil and v.Name ~= "Boombox" and v.Name ~= "Repair Kit" and v.Name ~= "Medi Kit" and v.Name ~= "Health Booster" and v.Name ~= "Stamina Booster" and v.Name ~= "Lockpick" and v.Name ~= "Door Ram" and v.Name ~= "Sprayer" and v.Name ~= "" then  
            currentTool = v
        end
    end
    RS:FindFirstChild("_CS.Events").PaintTool:FireServer(currentTool,color1,color2)
end)
local buyAmmoAmount = 1
local ammoType = ""
BuySectionAmmo:addDropdown("Ammo", {"9mm", "5.56", "12 Gauge", ".50", ".45 ACP", "5.7x28"}, function(valuex)
    ammoType = valuex
end)
BuySectionAmmo:addSlider("Ammo Amount", 1, 0, 200, function(v)
    buyAmmoAmount = v
end)
BuySectionAmmo:addButton("Buy ammo", function()
    for i = 1, buyAmmoAmount, 1 do
        wait(.3)   
        RS:FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(ammoType,"Single",nil)
    end
end)
local kitSpammerEnabled = false
BuySectionMisc2:addToggle("Kit Spammer (Requires right role)", nil, function(state)
    kitSpammerEnabled = state
end)
function getTool(t,old)                  
    LPChar.HumanoidRootPart.CFrame = t.Handle.CFrame * CFrame.new(0,1,0)                  
    RS:FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")                   
    wait()   
    LPChar.HumanoidRootPart.CFrame = t.Handle.CFrame * CFrame.new(0,-2,1)
    RS:FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")    
    wait(.1)
    RS:FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")
    wait(.2)
    LPChar.HumanoidRootPart.Anchored = true                
    LPChar.HumanoidRootPart.CFrame = old
    LPChar.HumanoidRootPart.Anchored = false
end
local misc = Main:addPage("Miscellaneous", 6034509993)
local miscSection = misc:addSection("Misc")
local wepSection = misc:addSection("Misc Tools")
local CarSection = misc:addSection("Misc Vehicle")
wepSection:addToggle("Tool Sniper", nil, function(state)
    if state then  
        local oldCFrame = LPChar.HumanoidRootPart.CFrame         
        for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do            
            if v.Name == "ToolModel" and not v:FindFirstChild("PlayerWhoDropped") then    
                getTool(v,oldCFrame)                                
            end
        end
    end    
end)
wepSection:addToggle("Auto Store items", nil, function(state)
    autoStore = state
end)
miscSection:addButton("No void", function()
    game:GetService("Workspace").FallenPartsDestroyHeight = math.huge - math.huge
end)
miscSection:addButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
miscSection:addButton("Reset cash to 50k", function()
    for _,v in pairs(workspace.PlayerVehicles:GetChildren()) do
        RS["_CS.Events"].FillUpCar:FireServer(v, 9e9)
    end
    wait(.2)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
CarSection:addButton("Unlock cars (LOOP)", function() 
    while wait(1) do
        for i,v in pairs(game:GetService("Workspace").PlayerVehicles:GetDescendants()) do
            if v:IsA("VehicleSeat") or v:IsA("Seat") then
                v.Disabled = false
                wait(.3)
            end
        end
    end
end)
CarSection:addButton("Fill all cars", function()
    for i,v in pairs(workspace.PlayerVehicles:GetChildren()) do
		RS["_CS.Events"].FillUpCar:FireServer(v, 100)        
	end 
end)
local boomSection = misc:addSection("BoomBox player (Hold Boombox")
boomSection:addButton("Stop Song", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Stop","http://www.roblox.com/asset/?id=0")end)
boomSection:addButton("Among us Drip", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=6065418936")end)
boomSection:addButton("Rick & Morty", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=7009577773")end)
boomSection:addButton("Gangsters Paridise", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=2980426576")end)
boomSection:addButton("Moonlight", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=3309207662j")end)
boomSection:addButton("Lucid Dreams", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=6785290094")end)
boomSection:addButton("STAY", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=6815150969")end)
boomSection:addButton("Screaming", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=271550300")end)
boomSection:addButton("End of time", function() 
    LPChar.Boombox.ToolModel.PlayMusicEvent:FireServer("Play","http://www.roblox.com/asset/?id=1647301137")end)
    
print("Loading | 30%")
local Ui = Main:addPage("UI", 6022860343)
local UISection = Ui:addSection("UI")
UISection:addKeybind("GUI Keybind", Enum.KeyCode.LeftAlt, function()    
    Main:toggle()
    end, function()    
end)
local creds = Ui:addSection(": Credits :")
local UISection = Ui:addSection("Makers : H3LLLO / Rhot1c")
local UISection = Ui:addSection("Discord : AV - https://discord.gg/x6zYF5zD")
local UISection = Ui:addSection("H3LLLO : Main Dev")
local UISection = Ui:addSection("Rhot1c : Dev")
local c = 1
function zigzag(X)
    return math.acos(math.cos(X * math.pi)) / math.pi
end
coroutine.wrap(function()
    while wait() do
        if autoStore then   
            pcall(function()                       
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "Boombox" and v.Name ~= "" then 
                        LPChar.Humanoid:EquipTool(v)  
                        wait(.5)
                        RS:FindFirstChild("_CS.Events").AddItem:FireServer(v.Name,false)                    
                    end                              
                end
            end)
        end 
    end
end)()
coroutine.wrap(function()
    while wait(1) do
        if backpackDisplay then   
            pcall(function()                       
                for i,v in pairs(Players:GetChildren()) do
                    if v.Character and v ~= nil and v.Character:FindFirstChild("UpperTorso") then
                        refreshDisplay(v)				           
                    end
                end
            end)
        end 
    end
end)()
coroutine.wrap(function()
    while wait(3) do
        if autoArrest then    
            pcall(function()                      
                for i,v in ipairs(Players:GetChildren()) do
                    if v.Character.Wanted.Value ~= 1 then 
                        wait(.1)                        
                        LPChar.HumanoidRootPart.Anchored = true 
                        LPChar.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2) 
                        LPChar.HumanoidRootPart.Anchored = false 
                        wait(.1)                                               
                        RS:FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)                                                       
                        LPChar.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.5)                      
                        wait(.1)                          
                        LPChar.HumanoidRootPart.Anchored = true              
                        LPChar.HumanoidRootPart.CFrame = CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365)
                        wait(.5)
                        LPChar.HumanoidRootPart.Anchored = false
                    end
                end                
            end)          
        end
    end
end)()
coroutine.wrap(function()
    while wait(0.5) do
        if renderNameTags then    
            pcall(function()                      
                for i,v in pairs(Players:GetChildren()) do
                    if v.Character ~= nil and v ~= LPlayer then
                        v.Character.Head.PlayerDisplay.AlwaysOnTop = true
                        v.Character.Head.PlayerDisplay.MaxDistance = 32
                    end
                end               
            end)          
        end
    end
end)()
coroutine.wrap(function()
    while wait() do
        if kitSpammerEnabled then 
            pcall(function()                        
                RS:FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Repair Kit","Single",nil)
                wait(.1)
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Repair Kit" then 
                        LPChar.Humanoid:EquipTool(v)  
                        wait(.2) 
                        RS:FindFirstChild("_CS.Events").Dropper:FireServer("Repair Kit","Drop")
                    end                              
                end            
            end)
        end
    end
end)()
coroutine.wrap(function()
    while wait(.06) do
        if gunSoundSpam then 
            pcall(function()                
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "" and v ~= nil and v.Handle:FindFirstChild("Mag") then                         
                        RS:FindFirstChild("_CS.Events").AmmoRemover:FireServer(v.Handle.Mag)
                    end                              
                end            
            end)
        end
    end
end)()
coroutine.wrap(function()    
        while wait(1.5) do
            if Hitboxes then
                pcall(function()                  
                    for i,v in pairs(game.Players:GetPlayers()) do
                    if v ~= LPlayer and v.Character and v.Character:FindFirstChild('Head') then
                        v.Character.Head.Size = Vector3.new(headHitboxSize,headHitboxSize,headHitboxSize)
                        v.Character.Head.Transparency = 0.7
                        v.Character.Head.CanCollide = false
                        if v.Character.Humanoid.Health == 0 then
                            v.Character.Head.Size = LPChar.Head.Size
                            v.Character.Head.Transparency = LPChar.Head.Transparency                        
                        end
                    end
                end
            end)
        end
    end
end)()
_G.JHeight = 30
UIS.InputBegan:connect(function(key)
    if infiniteStamina and key.KeyCode == Enum.KeyCode.LeftShift then
        LPChar.Humanoid.WalkSpeed = 23
    end
end)
UIS.InputEnded:connect(function(key)
    if infiniteStamina and key.KeyCode == Enum.KeyCode.LeftShift then
        LPChar.Humanoid.WalkSpeed = 13
    end
end)
UIS.InputBegan:connect(function(UserInput)
    if infiniteJump and jumpMode == "Infinite" and UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        aC(LPChar.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                aC(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JHeight, 0);
                end)
            end
        end)
    end      
end)
UIS.InputBegan:connect(function(p)
    if infiniteJump and jumpMode == "Fly" then          
        if UIS:IsKeyDown(Enum.KeyCode.Space) then 
        repeat wait() 
            aC(LPChar.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    aC(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JHeight, 0);
                    end)
                end
            end)            
            until UIS:IsKeyDown(Enum.KeyCode.Space) == false
        end
    end
end)
print("Loading | 50%")
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
    if LPChar.Humanoid.Health < 70 and LPChar.Humanoid.Health > 0 and AutoHeal then        
        if not LPlayer.Backpack:FindFirstChild("Medi Kit") then
            purchaseItem("Medi Kit")         
        else                     
            for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
                if t:IsA("Tool") and t.Name == "Medi Kit" then          
                    LPChar.Humanoid:EquipTool(t)            
                    RS:FindFirstChild("_CS.Events").ToolEvent:FireServer("Heal",LPChar, t)  
                end
            end
        end
    end   
    if rainbow_hair or rainbow_char then      
        local colorx = Color3.fromHSV(zigzag(c),1,1)
        c = c + .001
        if rainbow_hair then        
            RS["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"HairColor")
        end
        if rainbow_char then           
            RS["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"SkinColor")            
        end
    end  
    if speedBypass and LPChar ~= nil and LPChar.Humanoid and LPChar.Humanoid.Parent then
        if  LPChar.Humanoid.MoveDirection.Magnitude > 0 then
            LPChar:TranslateBy(LPChar.Humanoid.MoveDirection)
        end
    end   
    if antiCar and LPChar ~= nil and LPChar then
        LPChar.HumanoidRootPart.TouchInterest:Destroy()
    end   
end)

print("Loading | 80%")

wait(.5)

sendNotification("Anomic V: Scripts made by H3LLL0 and Rhot1c - Forum: F A Z E D")
wait(.3)

sendNotification("Anomic V: Info can be found in discord")

main()

print("Loading | 90%")

LPlayer.CharacterAdded:Connect(function()
    wait(2.5)
    main()
end)

Main:SelectPage(Main.pages[1], true)

print("Finished Loading | 100%")
