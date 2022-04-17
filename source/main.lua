-- main.lua
-- This file will be the main execution point of the project and will also be in charge
-- of coordinating screens, transitions, taking care of game state, etc. It will be like the
-- director of the game.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "ScreenLoader"

-- GLOBAL VARIABLES --
-- Try and limit how many global variables we have if possible. Not sure how
-- easy that will be with Lua.
gfx = playdate.graphics

-- Anything that you need to do to initialize the game should be done here. This will be the first function that runs in the game.
function initializeGame()


local screenLoader = ScreenLoader() -- grab an instant of screenloader to help navigate between screens

screenLoader.loadOpeningScreen()

end

-- MAIN EXECUTION --
initializeGame()





-- This function executes before each frame refresh
function playdate.update()

	gfx.sprite.update()
	playdate.timer.updateTimers()
	
end