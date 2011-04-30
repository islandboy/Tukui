----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.myclass == "PRIEST" then
	-- do some config!
end

----------------------------------------------------------------------------
-- Per Character Name Config (overwrite general and class)
-- Name need to be case sensitive
----------------------------------------------------------------------------

if T.myname == "Tukz" then
	-- yeah my default config is not really like default tukui.
	C.actionbar.hotkey = false
	C.actionbar.hideshapeshift = true
	C.unitframes.enemyhcolor = true
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
