-- Color system for Hydra datatexts
local T, C, L = unpack(select(2, ...))
local ccolor = RAID_CLASS_COLORS[T.myclass]
hexa, hexb = C["datatext"].color, "|r"

if C["datatext"].classcolor then
	hexa = string.format("|c%02x%02x%02x%02x", 255, ccolor.r * 255, ccolor.g * 255, ccolor.b * 255)
end

--[[
NORMAL_FONT_COLOR_CODE      = "|cffffd200";
HIGHLIGHT_FONT_COLOR_CODE   = "|cffffffff";
RED_FONT_COLOR_CODE         = "|cffff2020";
GREEN_FONT_COLOR_CODE       = "|cff20ff20";
GRAY_FONT_COLOR_CODE        = "|cff808080";
YELLOW_FONT_COLOR_CODE      = "|cffffff00";
LIGHTYELLOW_FONT_COLOR_CODE = "|cffffff9a";
ORANGE_FONT_COLOR_CODE      = "|cffff7f3f";
ACHIEVEMENT_COLOR_CODE      = "|cffffff00";
FONT_COLOR_CODE_CLOSE       = "|r";
 
NORMAL_FONT_COLOR           = {r=1.00, g=0.82, b=0.00};
HIGHLIGHT_FONT_COLOR        = {r=1.00, g=1.00, b=1.00};
RED_FONT_COLOR              = {r=1.00, g=0.10, b=0.10};
DIM_RED_FONT_COLOR          = {r=0.80, g=0.10, b=0.10};
GREEN_FONT_COLOR            = {r=0.10, g=1.00, b=0.10};
GRAY_FONT_COLOR             = {r=0.50, g=0.50, b=0.50};
YELLOW_FONT_COLOR           = {r=1.00, g=1.00, b=0.00};
LIGHTYELLOW_FONT_COLOR      = {r=1.00, g=1.00, b=0.60};
ORANGE_FONT_COLOR           = {r=1.00, g=0.50, b=0.25};
PASSIVE_SPELL_FONT_COLOR    = {r=0.77, g=0.64, b=0.00};
  
   
RAID_CLASS_COLORS = {
 ["HUNTER"]      = { r = 0.67, g = 0.83, b = 0.45 },
 ["WARLOCK"]     = { r = 0.58, g = 0.51, b = 0.79 },
 ["PRIEST"]      = { r = 1.00, g = 1.00, b = 1.00 },
 ["PALADIN"]     = { r = 0.96, g = 0.55, b = 0.73 },
 ["MAGE"]        = { r = 0.41, g = 0.80, b = 0.94 },
 ["ROGUE"]       = { r = 1.00, g = 0.96, b = 0.41 },
 ["DRUID"]       = { r = 1.00, g = 0.49, b = 0.04 },
 ["SHAMAN"]      = { r = 0.00, g = 0.44, b = 0.87 },
 ["WARRIOR"]     = { r = 0.78, g = 0.61, b = 0.43 },
 ["DEATHKNIGHT"] = { r = 0.77, g = 0.12, b = 0.23 },
};
--]]
