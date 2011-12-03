local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

--------------------------------------------------------------------
-- FPS
--------------------------------------------------------------------

if C["datatext"].fps_ms and C["datatext"].fps_ms > 0 then
	local Stat = CreateFrame("Frame", "TukuiStatFPS")
	Stat:SetFrameStrata("BACKGROUND")	
	Stat:SetFrameLevel(3)
	Stat:EnableMouse(true)
	Stat.Option = C.datatext.fps_ms
	Stat.Color1 = T.RGBToHex(unpack(C.media.datatextcolor1))
	Stat.Color2 = T.RGBToHex(unpack(C.media.datatextcolor2))

	local Text  = Stat:CreateFontString("TukuiStatFPSText", "OVERLAY")
	Text:SetFont(C.media.font, C["datatext"].fontsize)
	T.PP(C["datatext"].fps_ms, Text)

	local int = 1
   local function Update(self, t)
      int = int - t
      if int < 0 then
         -- set up dynamic colors for fps and latency
         local fps_color = GREEN_FONT_COLOR_CODE
         local ms_color  = GREEN_FONT_COLOR_CODE
         local fps_rate  = floor(GetFramerate())
         local ms_rate   = select(3, GetNetStats())
         
         -- fps
         if fps_rate < 15 then
            fps_color = RED_FONT_COLOR_CODE
         elseif fps_rate < 35 then
            fps_color = YELLOW_FONT_COLOR_CODE
         end
         
         -- latency
         if ms_rate > 75 then
            ms_color = YELLOW_FONT_COLOR_CODE
         elseif ms_rate > 350 then
            ms_color = RED_FONT_COLOR_CODE
         end
                        
	      --Text:SetText(Stat.Color2..floor(GetFramerate()).."|r"..Stat.Color1..L.datatext_fps.."|r"..Stat.Color2..ms.."|r"..Stat.Color1..L.datatext_ms.."|r")
         Text:SetText(fps_color..fps_rate..hexb..hexa..L.datatext_fps..hexb..ms_color..ms_rate..hexb..hexa..L.datatext_ms..hexb)
         self:SetAllPoints(Text)
         int = 1                 
      end     
   end
	
	Stat:SetScript("OnUpdate", Update) 
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local anchor, panel, xoff, yoff = T.DataTextTooltipAnchor(Text)
			local _, _, latencyHome, latencyWorld = GetNetStats()
			local latency = format(MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld)
			GameTooltip:SetOwner(panel, anchor, xoff, yoff)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(latency)
			GameTooltip:Show()
		end
	end)	
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)	
	Update(Stat, 10)
end
