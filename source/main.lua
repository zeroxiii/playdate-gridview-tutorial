import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = pd.graphics

local gridview = pd.ui.gridview.new(32, 32)

gridview:setNumberOfColumns(8)
gridview:setNumberOfRows(6)

function pd.update()
	gridview:drawInRect(100, 70, 200, 100)
	pd.timer.updateTimers()
end
