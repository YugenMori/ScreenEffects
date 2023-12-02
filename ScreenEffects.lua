local cyanFrame = CreateFrame("Frame", "CyanOverlay", UIParent)
cyanFrame:SetAllPoints(UIParent)
cyanFrame.texture = cyanFrame:CreateTexture(nil, "BACKGROUND")
cyanFrame.texture:SetAllPoints(cyanFrame)
cyanFrame.texture:SetColorTexture(0, 1, 1, 0.2) -- RGBA for cyan
cyanFrame:EnableMouse(false)
cyanFrame:SetFrameStrata("FULLSCREEN_DIALOG")
cyanFrame:Hide()

SLASH_CYANOVERLAY1 = "/cyan"
SlashCmdList["CYANOVERLAY"] = function() cyanFrame:SetShown(not cyanFrame:IsShown()) end


local vibrantFrame = CreateFrame("Frame", "VibrantOverlay", UIParent)
vibrantFrame:SetAllPoints(UIParent)
vibrantFrame.texture = vibrantFrame:CreateTexture(nil, "BACKGROUND")
vibrantFrame.texture:SetAllPoints(vibrantFrame)
vibrantFrame.texture:SetColorTexture(1, 0, 1, 0.2) -- RGBA for magenta, a vibrant color
vibrantFrame:EnableMouse(false)
vibrantFrame:SetFrameStrata("FULLSCREEN_DIALOG")
vibrantFrame:Hide()

SLASH_VIBRANTOVERLAY1 = "/vb"
SlashCmdList["VIBRANTOVERLAY"] = function() vibrantFrame:SetShown(not vibrantFrame:IsShown()) end


local sepiaFrame = CreateFrame("Frame", "SepiaOverlay", UIParent)
sepiaFrame:SetAllPoints(UIParent)
sepiaFrame.texture = sepiaFrame:CreateTexture(nil, "BACKGROUND")
sepiaFrame.texture:SetAllPoints(sepiaFrame)
sepiaFrame.texture:SetColorTexture(0.76, 0.56, 0.35, 0.2) -- RGBA for sepia
sepiaFrame:EnableMouse(false)
sepiaFrame:SetFrameStrata("FULLSCREEN_DIALOG")
sepiaFrame:Hide()

SLASH_SEPIAOVERLAY1 = "/sepia"
SlashCmdList["SEPIAOVERLAY"] = function() sepiaFrame:SetShown(not sepiaFrame:IsShown()) end


local coffeeFrame = CreateFrame("Frame", "CoffeeOverlay", UIParent)
coffeeFrame:SetAllPoints(UIParent)
coffeeFrame.texture = coffeeFrame:CreateTexture(nil, "BACKGROUND")
coffeeFrame.texture:SetAllPoints(coffeeFrame)
coffeeFrame.texture:SetColorTexture(0.86, 0.58, 0.36, 0.2) -- RGBA for coffee
coffeeFrame:EnableMouse(false)
coffeeFrame:SetFrameStrata("FULLSCREEN_DIALOG")
coffeeFrame:Hide()

SLASH_COFFEEOVERLAY1 = "/cf"
SlashCmdList["COFFEEOVERLAY"] = function() coffeeFrame:SetShown(not coffeeFrame:IsShown()) end


local sandFrame = CreateFrame("Frame", "SandOverlay", UIParent)
sandFrame:SetAllPoints(UIParent)
sandFrame.texture = sandFrame:CreateTexture(nil, "BACKGROUND")
sandFrame.texture:SetAllPoints(sandFrame)
sandFrame.texture:SetColorTexture(1.94, 1.78, 1.28, 0.2) -- RGBA for sand
sandFrame:EnableMouse(false)
sandFrame:SetFrameStrata("FULLSCREEN_DIALOG")
sandFrame:Hide()

SLASH_SANDOVERLAY1 = "/sand"
SlashCmdList["SANDOVERLAY"] = function() sandFrame:SetShown(not sandFrame:IsShown()) end


local nightFrame = CreateFrame("Frame", "NightOverlay", UIParent)
nightFrame:SetAllPoints(UIParent)
nightFrame.texture = nightFrame:CreateTexture(nil, "BACKGROUND")
nightFrame.texture:SetAllPoints(nightFrame)
nightFrame.texture:SetColorTexture(0.01, 0.01, 0.01, 0.5) -- RGBA for night
nightFrame:EnableMouse(false)
nightFrame:SetFrameStrata("FULLSCREEN_DIALOG")
nightFrame:Hide()

SLASH_NIGHTOVERLAY1 = "/night"
SlashCmdList["NIGHTOVERLAY"] = function() nightFrame:SetShown(not nightFrame:IsShown()) end


SLASH_SEOVERLAY1 = "/se"
SlashCmdList["SEOVERLAY"] = function()
    print("Commands(use '/commandname'): cyan, vb, sepia, cf, sand, night")
end




