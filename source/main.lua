import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = pd.graphics

local gridview = pd.ui.gridview.new(32, 32)

gridview:setNumberOfColumns(8)
gridview:setNumberOfRows(6)
gridview:setCellPadding(2, 2, 2, 2)

function gridview:drawCell(section, row, column, selected, x, y, width, height)
if selected then
		gfx.fillCircleInRect(x, y, width, height)
	else
		gfx.drawCircleInRect(x, y, width, height)
	end
end

function pd.update()
	gridview:drawInRect(100, 70, 200, 100)
	pd.timer.updateTimers()
end
