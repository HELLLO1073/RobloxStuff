--[[_G.Enabled = true
_G.ThemeMode = "Purple" -- Red,Green,White]]

local LPlayer = game:GetService("Players").LocalPlayer
local colors = {
     white     = Color3.fromRGB(255,255,255),
     lightGrey = Color3.fromRGB(70,70,70),
     grey      = Color3.fromRGB(50,50,50),
     black     = Color3.fromRGB(0,0,0),     
     stamBar   = Color3.fromRGB(250,20,100),     
}

local function setTheme()
    if LPlayer.PlayerGui:FindFirstChild("MainUIHolder") and LPlayer ~= nil  then 
        LPlayer.PlayerGui.MainMenu.ButtonBar.Teams.BackgroundColor3 = colors.grey
        LPlayer.PlayerGui.MainMenu.ButtonBar.Spawn.BackgroundColor3 = colors.lightGrey
        LPlayer.PlayerGui.MainMenu.ButtonBar.Editor.BackgroundColor3 = colors.grey
        LPlayer.PlayerGui.MainMenu.TeamGUI.BackgroundColor3 = colors.grey
        LPlayer.PlayerGui.MainMenu.TeamGUI.BorderColor3 = colors.lightGrey
        LPlayer.PlayerGui.MainMenu.TeamGUI.Description.BackgroundColor3 = colors.grey
        LPlayer.PlayerGui.MainMenu.TeamGUI.Description.BorderColor3 = colors.lightGrey
        LPlayer.PlayerGui.MainMenu.TeamGUI.TeamBackground.BackgroundColor3 = colors.grey
        LPlayer.PlayerGui.MainMenu.TeamGUI.Description.JoinButton.BackgroundColor3 = colors.lightGrey
        LPlayer.PlayerGui.MainMenu.TeamGUI.Description.JoinButton.BorderColor3 = colors.white
        LPlayer.PlayerGui.AvatarEditor.WearButton.BackgroundColor3 = colors.lightGrey
        LPlayer.PlayerGui.AvatarEditor.WearButton.BorderColor3 = colors.white
        LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.IdBox.BackgroundColor3 = colors.lightGrey 
        LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.IdBox.BorderColor3 = colors.white 
        LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.WearButton.BorderColor3 = colors.white
        LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.WearButton.BackgroundColor3 = colors.lightGrey  
        
        for i,v in pairs(LPlayer.PlayerGui.MainMenu.TeamGUI.TeamBackground:GetChildren()) do
            if v.Name ~= "UIListLayout" then
                v.Design.ImageColor3 = colors.black
            end            
        end 
    end
    if LPlayer.PlayerGui:FindFirstChild("MainUIHolder") and LPlayer ~= nil  then 
        if LPlayer.PlayerGui.MainUIHolder:FindFirstChild("Menus") and LPlayer ~= nil then
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.Basic.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.Basic.BorderColor3 = colors.white           
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.BorderColor3 = colors.lightGrey 
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.BackgroundColor3 = colors.black
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.ImageColor3 = colors.black
            LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.ImageTransparency = 0.5
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BackgroundColor3 = colors.lightGrey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BorderColor3 = colors.lightGrey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.PurchaseForRobux.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.PurchaseOptions.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.Statistics.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BodyColorSelection.Grid.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BodyColorSelection.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BackgroundColor3 = colors.grey 
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BorderColor3 = colors.lightGrey
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.ImageLabel.ImageColor3 = colors.black
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.ImageLabel.ImageTransparency = 0.4
            LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BorderColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.StaminaBar.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.MessageBar.BackgroundColor3 = colors.grey
            LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.BackgroundColor3 = colors.black
            LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.StatNum.TextColor3 = Color3.fromRGB(255,255,255)
            LPlayer.PlayerGui.MainUIHolder.PhoneBar.Phone.ImageColor3 = Color3.fromRGB(30,30,30)
            LPlayer.PlayerGui.MainUIHolder.PhoneBar.Phone.Exlam.TextColor3 = colors.white
            LPlayer.PlayerGui.MainUIHolder.MenuBar.ImageLabel.BackgroundColor3 = colors.black
            LPlayer.PlayerGui.MainUIHolder.MenuBar.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
            LPlayer.PlayerGui.MainUIHolder.MenuBar.BackgroundColor3 = Color3.fromRGB(15,15,15)

            if _G.ThemeMode == "Purple" then
                LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(255, 29, 108) -- Stam
                else if _G.ThemeMode == "Red" then
                    LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(199, 0, 0) -- Stam
                    else if _G.ThemeMode == "Green" then
                        LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(41, 206, 0) -- Stam
                        else if _G.ThemeMode == "White" then
                            LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Stam
                        end
                    end
                end
            end
            if _G.ThemeMode == "Purple" then
                LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(150,0,150) -- Cash
                else if _G.ThemeMode == "Red" then
                    LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(201, 0, 0) -- Cash
                    else if _G.ThemeMode == "Green" then
                        LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(93, 233, 0) -- Cash
                        else if _G.ThemeMode == "White" then
                            LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(255, 255, 255) -- Cash
                        end
                    end
                end
            end

            if LPlayer.PlayerGui.MainUIHolder:FindFirstChild("MenuBar") then
                for i,v in pairs(LPlayer.PlayerGui.MainUIHolder.MenuBar:GetChildren()) do
                    if v.ClassName == "ImageButton" then
                        v.ImageColor3 = Color3.fromRGB(35,35,35)
                    end    
                end        
            end 
        end
    end
end

setTheme()

LPlayer.CharacterAdded:Connect(function()
    if _G.Enabled then
        wait(1)    
        setTheme()
    end
end)
