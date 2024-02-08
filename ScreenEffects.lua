-- Cria uma tabela para salvar o estado dos quadros
local addonName, addonTable = ...
OverlayState = OverlayState or {}
ScreenEffects = ScreenEffects or {}

-- Função para criar um quadro com persistência de estado
local function CreatePersistentFrame(frameName, r, g, b, a, slashCommand)
    local frame = _G[frameName] or CreateFrame("Frame", frameName, UIParent)
    frame:SetAllPoints(UIParent)
    frame.texture = frame.texture or frame:CreateTexture(nil, "BACKGROUND")
    frame.texture:SetAllPoints(frame)
    frame.texture:SetColorTexture(r, g, b, a)
    frame:EnableMouse(false)
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    if OverlayState[frameName] then
        frame:Show()
    else
        frame:Hide()
    end

    _G["SLASH_" .. slashCommand .. "1"] = "/" .. string.lower(slashCommand)
    SlashCmdList[slashCommand] = function()
        local isShown = not frame:IsShown()
        frame:SetShown(isShown)
        OverlayState[frameName] = isShown
    end

    -- Função para alternar a visibilidade do quadro
    local function ToggleFrame()
        local isShown = not frame:IsShown()
        frame:SetShown(isShown)
        OverlayState[frameName] = isShown
    end

    -- Restaura o estado do quadro quando o jogador entra no mundo
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_ENTERING_WORLD" then
            local isShown = OverlayState[frameName]
            frame:SetShown(isShown)
        end
    end)

    return ToggleFrame
end

local function CreatePersistentFrameOnlyColor(r, g, b, a)
    local frameName = "ScreenEffectsColorPicker"
    local slashCommand = "ScreenEffectsColorPickerSlash"

    local frame = _G[frameName] or CreateFrame("Frame", frameName, UIParent)
    frame:SetAllPoints(UIParent)
    frame.texture = frame.texture or frame:CreateTexture(nil, "BACKGROUND")
    frame.texture:SetAllPoints(frame)
    frame.texture:SetColorTexture(r, g, b, a)
    frame:EnableMouse(false)
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    if OverlayState[frameName] then
        frame:Show()
    else
        frame:Hide()
    end

    _G["SLASH_" .. slashCommand .. "1"] = "/" .. string.lower(slashCommand)
    SlashCmdList[slashCommand] = function()
        local isShown = not frame:IsShown()
        frame:SetShown(isShown)
        OverlayState[frameName] = isShown
    end

    -- Função para alternar a visibilidade do quadro
    local function ToggleFrame()
        local isShown = not frame:IsShown()
        frame:SetShown(isShown)
        OverlayState[frameName] = isShown
    end

    -- Restaura o estado do quadro quando o jogador entra no mundo
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_ENTERING_WORLD" then
            local isShown = OverlayState[frameName]
            frame:SetShown(isShown)
        end
    end)

    return ToggleFrame
end


-- Cria os quadros com as cores e comandos correspondentes
CreatePersistentFrame("CyanOverlay", 0, 1, 1, 0.2, "CYANOVERLAY")
CreatePersistentFrame("VibrantOverlay", 1, 0, 1, 0.2, "VIBRANTOVERLAY")
CreatePersistentFrame("SepiaOverlay", 0.76, 0.56, 0.35, 0.2, "SEPIAOVERLAY")
CreatePersistentFrame("CoffeeOverlay", 0.86, 0.58, 0.36, 0.2, "COFFEEOVERLAY")
CreatePersistentFrame("SandOverlay", 1.94, 1.78, 1.28, 0.2, "SANDOVERLAY")
CreatePersistentFrame("NightOverlay", 0.01, 0.01, 0.01, 0.5, "NIGHTOVERLAY")
CreatePersistentFrame("OldOverlay", 0.50, 0.50, 0.50, 0.4, "OLDOVERLAY")

-- Comando para listar todos os comandos disponíveis
SLASH_SEOVERLAY1 = "/se"
SlashCmdList["SEOVERLAY"] = function()
    InterfaceOptionsFrame_OpenToCategory("Screen|cffC7EF00Effects|r")
    InterfaceOptionsFrame_OpenToCategory("Screen|cffC7EF00Effects|r")
end


SlashCmdList["CYANOVERLAY"] = function()
    local frame = _G["CyanOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["CyanOverlay"] = isShown
end

SLASH_CYANOVERLAY1 = "/cyan"

SlashCmdList["VIBRANTOVERLAY"] = function()
    local frame = _G["VibrantOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["VibrantOverlay"] = isShown
end

SLASH_VIBRANTOVERLAY1 = "/vb"

SlashCmdList["SEPIAOVERLAY"] = function()
    local frame = _G["SepiaOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["SepiaOverlay"] = isShown
end

SLASH_SEPIAOVERLAY1 = "/sepia"


SlashCmdList["COFFEEOVERLAY"] = function()
    local frame = _G["CoffeeOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["CoffeeOverlay"] = isShown
end

SLASH_COFFEEOVERLAY1 = "/cf"

SlashCmdList["SANDOVERLAY"] = function()
    local frame = _G["SandOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["SandOverlay"] = isShown
end

SLASH_SANDOVERLAY1 = "/sand"

SlashCmdList["NIGHTOVERLAY"] = function()
    local frame = _G["NightOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["NightOverlay"] = isShown
end

SLASH_NIGHTOVERLAY1 = "/night"

SlashCmdList["OLDOVERLAY"] = function()
    local frame = _G["OldOverlay"]
    local isShown = not frame:IsShown()
    frame:SetShown(isShown)
    OverlayState["OldOverlay"] = isShown
end

SLASH_OLDOVERLAY1 = "/old"

----------------------------------------------------
-- Init - Tables - Saves
-- Config Frame
-- Panel
local function InitSettings()
    ScreenEffects.panel = CreateFrame("Frame", "$parentScreenEffects", InterfaceOptionsFramePanelContainer)
    ScreenEffects.panel.name = "Screen|cffC7EF00Effects|r"
    InterfaceOptions_AddCategory(ScreenEffects.panel, addonName)
end

local function Main_ScreenEffects()
    
    -- Color Picker 
    local function ColorPicker_Cancelled()
        local color = ColorPickerFrame.previousValues
        COLOR_MY_UI.Color = color
    end

    local function ColorPicker_Changed(self)
        local r, g, b = ColorPickerFrame:GetColorRGB()
        local color = { r = r, g = g, b = b }
        COLOR_MY_UI.Color = color
    end

    -- Global Color Function
    local function ScreenEffects_ShowColorPicker()
        if ColorPickerFrame:IsShown() then return end
        ColorPickerFrame.previousValues = COLOR_MY_UI[character].Color
        ColorPickerFrame.cancelFunc = ColorPicker_Cancelled
        ColorPickerFrame.opacityFunc = ColorPicker_Changed
        ColorPickerFrame.func = ColorPicker_Changed
        ColorPickerFrame.swatchFunc = ColorPicker_Changed
        ColorPickerFrame:ClearAllPoints()
        ColorPickerFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", GetCursorPosition())
        ShowUIPanel(ColorPickerFrame)
    end
    -- Choose a Color (Color Picker)
    local ScreenEffectsVertexColorFramesColorPicker = CreateFrame("Button", "$parentScreenEffectsVertexColorFramesColorPicker", ScreenEffects.panel, "UIPanelButtonTemplate")
    ScreenEffectsVertexColorFramesColorPicker:SetPoint("TOPRIGHT", -150, -80)
    ScreenEffectsVertexColorFramesColorPicker:SetHeight(30)
    ScreenEffectsVertexColorFramesColorPicker:SetWidth(120)
    ScreenEffectsVertexColorFramesColorPicker.text = ScreenEffectsVertexColorFramesColorPicker.text or ScreenEffectsVertexColorFramesColorPicker:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
    ScreenEffectsVertexColorFramesColorPicker.text:SetPoint("CENTER", ScreenEffectsVertexColorFramesColorPicker, "CENTER", 0, 0)
    ScreenEffectsVertexColorFramesColorPicker.text:SetText("Select a Color")
    ScreenEffectsVertexColorFramesColorPicker.text:SetTextColor(229/255, 229/255, 229/255)
    ScreenEffectsVertexColorFramesColorPicker.text:SetShadowColor(0, 0, 0)
    ScreenEffectsVertexColorFramesColorPicker.text:SetShadowOffset(1, -1)
    -- OnClick Function
    ScreenEffectsVertexColorFramesColorPicker:SetScript("OnClick", function(self)
        ScreenEffects_ShowColorPicker()
    end)
    -- Apply Color
    local ScreenEffectsVertexColorFramesColorPicker = CreateFrame("CheckButton", "$parentScreenEffectsVertexColorFramesColorPicker", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    ScreenEffectsVertexColorFramesColorPicker:SetPoint("TOPRIGHT", -100, -80)
    ScreenEffectsVertexColorFramesColorPicker.Text:SetText("Apply Color")
    ScreenEffectsVertexColorFramesColorPicker.Text:SetTextColor(COLOR_MY_UI.Color.r, COLOR_MY_UI.Color.g, COLOR_MY_UI.Color.b)
    ScreenEffectsVertexColorFramesColorPicker.tooltip = "Apply the color you choose from the ColorPicker"
    ScreenEffectsVertexColorFramesColorPicker:SetChecked(ScreenEffectsSettings.ColorPicker)
    -- OnClick Function
    ScreenEffectsVertexColorFramesColorPicker:SetScript("OnClick", function(self)
        ScreenEffectsSettings.ColorPicker = self:GetChecked()
        ScreenEffectsVertexColorFramesColorPicker.Text:SetTextColor(COLOR_MY_UI.Color.r, COLOR_MY_UI.Color.g, COLOR_MY_UI.Color.b)
        local ToggleFrame = CreatePersistentFrameOnlyColor(COLOR_MY_UI.Color.r, COLOR_MY_UI.Color.g, COLOR_MY_UI.Color.b, 0.2)
        ToggleFrame()
    end)
    -- After Login/Reload
    ScreenEffectsVertexColorFramesColorPicker:RegisterEvent("PLAYER_ENTERING_WORLD")
    ScreenEffectsVertexColorFramesColorPicker:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            CreatePersistentFrame("ScreenEffectsColorPicker", COLOR_MY_UI.Color.r, COLOR_MY_UI.Color.g, COLOR_MY_UI.Color.b, 0.2, "ScreenEffectsColorPickerSlash")
            if ScreenEffectsSettings.ColorPicker then
                ScreenEffectsVertexColorFramesColorPicker:SetChecked(true)
            else
                ScreenEffectsVertexColorFramesColorPicker:SetChecked(false)
            end
        end
    end)

    -- Cyan
    local Cyan_CheckButton = CreateFrame("CheckButton", "$parentCyan_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Cyan_CheckButton:SetPoint("TOPLEFT", 10, -80)
    Cyan_CheckButton.Text:SetText("Cyan")
    Cyan_CheckButton.tooltip = "Add a cyan effect to the screen"
    Cyan_CheckButton:SetChecked(ScreenEffectsSettings.Cyan)
    -- OnClick Function
    Cyan_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Cyan = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("CyanOverlay", 0, 1, 1, 0.2, "CYANOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Cyan_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Cyan_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Cyan then
                Cyan_CheckButton:SetChecked(true)
            else
                Cyan_CheckButton:SetChecked(false)
            end
        end
    end)
    
    -- Vibrant
    local Vibrant_CheckButton = CreateFrame("CheckButton", "$parentVibrant_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Vibrant_CheckButton:SetPoint("TOPLEFT", 10, -110)
    Vibrant_CheckButton.Text:SetText("Vibrant")
    Vibrant_CheckButton.tooltip = "Add a vibrant effect to the screen"
    Vibrant_CheckButton:SetChecked(ScreenEffectsSettings.Vibrant)
    -- OnClick Function
    Vibrant_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Vibrant = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("VibrantOverlay", 1, 0, 1, 0.2, "VIBRANTOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Vibrant_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Vibrant_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Vibrant then
                Vibrant_CheckButton:SetChecked(true)
            else
                Vibrant_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Sepia
    local Sepia_CheckButton = CreateFrame("CheckButton", "$parentSepia_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Sepia_CheckButton:SetPoint("TOPLEFT", 10, -140)
    Sepia_CheckButton.Text:SetText("Sepia")
    Sepia_CheckButton.tooltip = "Add a sepia effect to the screen"
    Sepia_CheckButton:SetChecked(ScreenEffectsSettings.Sepia)
    -- OnClick Function
    Sepia_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Sepia = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("SepiaOverlay", 0.76, 0.56, 0.35, 0.2, "SEPIAOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Sepia_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Sepia_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Sepia then
                Sepia_CheckButton:SetChecked(true)
            else
                Sepia_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Coffee
    local Coffee_CheckButton = CreateFrame("CheckButton", "$parentCoffee_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Coffee_CheckButton:SetPoint("TOPLEFT", 10, -170)
    Coffee_CheckButton.Text:SetText("Coffee")
    Coffee_CheckButton.tooltip = "Add a Coffee effect to the screen"
    Coffee_CheckButton:SetChecked(ScreenEffectsSettings.Coffee)
    -- OnClick Function
    Coffee_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Coffee = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("CoffeeOverlay", 0.86, 0.58, 0.36, 0.2, "COFFEEOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Coffee_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Coffee_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Coffee then
                Coffee_CheckButton:SetChecked(true)
            else
                Coffee_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Sand
    local Sand_CheckButton = CreateFrame("CheckButton", "$parentSand_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Sand_CheckButton:SetPoint("TOPLEFT", 10, -200)
    Sand_CheckButton.Text:SetText("Sand")
    Sand_CheckButton.tooltip = "Add a Sand effect to the screen"
    Sand_CheckButton:SetChecked(ScreenEffectsSettings.Sand)
    -- OnClick Function
    Sand_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Sand = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("SandOverlay", 1.94, 1.78, 1.28, 0.2, "SANDOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Sand_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Sand_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Sand then
                Sand_CheckButton:SetChecked(true)
            else
                Sand_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Night
    local Night_CheckButton = CreateFrame("CheckButton", "$parentNight_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Night_CheckButton:SetPoint("TOPLEFT", 10, -230)
    Night_CheckButton.Text:SetText("Night")
    Night_CheckButton.tooltip = "Add a Night effect to the screen"
    Night_CheckButton:SetChecked(ScreenEffectsSettings.Night)
    -- OnClick Function
    Night_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Night = self:GetChecked()
        local ToggleFrame = CreatePersistentFrame("NightOverlay", 0.01, 0.01, 0.01, 0.5, "NIGHTOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Night_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Night_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Night then
                Night_CheckButton:SetChecked(true)
            else
                Night_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Old
    local Old_CheckButton = CreateFrame("CheckButton", "$parentOld_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Old_CheckButton:SetPoint("TOPLEFT", 10, -260)
    Old_CheckButton.Text:SetText("Old")
    Old_CheckButton.tooltip = "Add a Old effect to the screen"
    Old_CheckButton:SetChecked(ScreenEffectsSettings.Old)
    -- OnClick Function
    Old_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Old = self:GetChecked()
        local ToggleFrame =CreatePersistentFrame("OldOverlay", 0.50, 0.50, 0.50, 0.4, "OLDOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Old_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Old_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Old then
                Old_CheckButton:SetChecked(true)
            else
                Old_CheckButton:SetChecked(false)
            end
        end
    end)

    -- NightVision
    local NightVision_CheckButton = CreateFrame("CheckButton", "$parentNightVision_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    NightVision_CheckButton:SetPoint("TOPLEFT", 10, -290)
    NightVision_CheckButton.Text:SetText("NightVision")
    NightVision_CheckButton.tooltip = "Add a NightVision effect to the screen"
    NightVision_CheckButton:SetChecked(ScreenEffectsSettings.NightVision)
    -- OnClick Function
    NightVision_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.NightVision = self:GetChecked()
        local ToggleFrame =CreatePersistentFrame("NightVisionOverlay", 0.04, 0.99, 0.39, 0.3, "NightVisionOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    NightVision_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    NightVision_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.NightVision then
                NightVision_CheckButton:SetChecked(true)
            else
                NightVision_CheckButton:SetChecked(false)
            end
        end
    end)

    -- Hell
    local Hell_CheckButton = CreateFrame("CheckButton", "$parentHell_CheckButton", ScreenEffects.panel, "ChatConfigCheckButtonTemplate")
    Hell_CheckButton:SetPoint("TOPLEFT", 10, -320)
    Hell_CheckButton.Text:SetText("Hell")
    Hell_CheckButton.tooltip = "Add a Hell effect to the screen"
    Hell_CheckButton:SetChecked(ScreenEffectsSettings.Hell)
    -- OnClick Function
    Hell_CheckButton:SetScript("OnClick", function(self)
        ScreenEffectsSettings.Hell = self:GetChecked()
        local ToggleFrame =CreatePersistentFrame("HellOverlay", 0.99, 0.06, 0.06, 0.3, "HellOVERLAY")
        ToggleFrame()
    end)
    -- After Login/Reload
    Hell_CheckButton:RegisterEvent("PLAYER_ENTERING_WORLD")
    Hell_CheckButton:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_ENTERING_WORLD") then
            if ScreenEffectsSettings.Hell then
                Hell_CheckButton:SetChecked(true)
            else
                Hell_CheckButton:SetChecked(false)
            end
        end
    end)
end

-- Color Save
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
    if not COLOR_MY_UI then
        COLOR_MY_UI = {}
    end
    --if not COLOR_MY_UI[character] then
        --COLOR_MY_UI[character] = {}
    --end
    if not COLOR_MY_UI.Color then
        COLOR_MY_UI.Color = { r = 1, g = 1, b = 1 }
    end
end)

-- Init
local f = CreateFrame("Frame")
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
    -- Config/Panel
    if not ScreenEffects then
        local ScreenEffects = {}
    end
    -- AddonSettings
    if not ScreenEffectsSettings then
        ScreenEffectsSettings = {}
    end
    -- Color Init
    if not COLOR_MY_UI then
        COLOR_MY_UI = {}
    end
    if not COLOR_MY_UI.Color then
        COLOR_MY_UI.Color = { r = 1, g = 1, b = 1 }
    end
	InitSettings()
	Main_ScreenEffects()
end)
