-- Cria uma tabela para salvar o estado dos quadros
OverlayState = OverlayState or {}

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

-- Cria os quadros com as cores e comandos correspondentes
CreatePersistentFrame("CyanOverlay", 0, 1, 1, 0.2, "CYANOVERLAY")
CreatePersistentFrame("VibrantOverlay", 1, 0, 1, 0.2, "VIBRANTOVERLAY")
CreatePersistentFrame("SepiaOverlay", 0.76, 0.56, 0.35, 0.2, "SEPIAOVERLAY")
CreatePersistentFrame("CoffeeOverlay", 0.86, 0.58, 0.36, 0.2, "COFFEEOVERLAY")
CreatePersistentFrame("SandOverlay", 1.94, 1.78, 1.28, 0.2, "SANDOVERLAY")
CreatePersistentFrame("NightOverlay", 0.01, 0.01, 0.01, 0.5, "NIGHTOVERLAY")

-- Comando para listar todos os comandos disponíveis
SLASH_SEOVERLAY1 = "/se"
SlashCmdList["SEOVERLAY"] = function()
    print("Commands (use '/name_of_command'): cyan, vb, sepia, cf, sand, night")
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
