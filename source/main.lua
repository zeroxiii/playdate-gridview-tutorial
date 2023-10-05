import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics

local gridview = pd.ui.gridview.new(32, 32)

gridview:setNumberOfColumns(8)
gridview:setNumberOfRows(6)
gridview:setCellPadding(2, 2, 2, 2)

local gridviewSprite = gfx.sprite.new()
gridviewSprite:setCenter(0, 0)
gridviewSprite:moveTo(100, 70)
gridviewSprite:add()

function gridview:drawCell(section, row, column, selected, x, y, width, height)
if selected then
		gfx.fillCircleInRect(x, y, width, height)
		gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
	else
		gfx.drawCircleInRect(x, y, width, height)
		gfx.setImageDrawMode(gfx.kDrawModeCopy)
	end
	local cellText = tostring(row) .. "-" .. tostring(column)
	local fontHeight = gfx.getSystemFont():getHeight()
	gfx.drawTextInRect(cellText, x, y + (height/2 - fontHeight/2) + 2, width, height, nil, nil, kTextAlignment.center)
end

function pd.update()
	if pd.buttonJustPressed(pd.kButtonUp) then
		gridview:selectPreviousRow(true)
	elseif pd.buttonJustPressed(pd.kButtonDown) then
		gridview:selectNextRow(true)
	elseif (pd.buttonJustPressed(pd.kButtonLeft)) then
		gridview:selectPreviousColumn(false)
	elseif (pd.buttonJustPressed(pd.kButtonRight)) then
		gridview:selectNextColumn(false)
	end

	local gridviewImage = gfx.image.new(200, 100)
	gfx.pushContext(gridviewImage)
		gridview:drawInRect(0, 0, 200, 100)
	gfx.popContext()
	gridviewSprite:setImage(gridviewImage)

	gfx.sprite.update()

	pd.timer.updateTimers()
end
