local T, C, L = unpack(select(2, ...))

---------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
-- This is an example, note that "WIZARD" doesn't exist on WoW. :P
-- It's just to give an example without interfering the default config.
-- A full configuration list can be found in /Tukui/config/config.lua
---------------------------------------------------------------------------

if T.myclass == "WIZARD" then
	C.actionbar.hotkey = false
	C.actionbar.hideshapeshift = true
	C.unitframes.enemyhcolor = true
end

---------------------------------------------------------------------------
-- Per Character Name Config (overwrite /Tukui/config/config.lua and class)
-- Name need to be case sensitive
---------------------------------------------------------------------------

if T.myname == "Tukz" and T.myrealm == "Illidan" then
	C.actionbar.hideshapeshift = true
	C.actionbar.hotkey = false
	C.unitframes.enemyhcolor = true
	C.general.uiscale = 0.64
end

local TelUI_AddonSkins = CreateFrame("Frame")
TelUI_AddonSkins:RegisterEvent("ADDON_LOADED")
TelUI_AddonSkins:SetScript("OnEvent", function(self, event, addon)
   if not addon == "TelUI_AddonSkins" then return end

   CustomSkin = { }

   CustomSkin.normTexture = C["media"].normTex
   CustomSkin.bgTexture = C["media"].blank
   CustomSkin.font = C["media"].font
   CustomSkin.fontSize = 12
   CustomSkin.fontFlags = "OUTLINE"
   CustomSkin.buttonSize = T.buttonsize
   CustomSkin.buttonSpacing = T.buttonspacing
   CustomSkin.borderWidth = T.Scale(2)
   CustomSkin.buttonZoom = { .08, .92, .08, .92 }
   CustomSkin.barSpacing = 1
   CustomSkin.barHeight = 17

   function CustomSkin:SkinBackgroundFrame(frame)
      self:SkinFrame(frame)
      frame:SetTemplate("Default")
      frame:CreateShadow("Default")
   end

   self:UnregisterEvent("ADDON_LOADED")
end)
