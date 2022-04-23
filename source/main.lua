-- main.lua
-- This file will be the main execution point of the project and will also be in charge
-- of coordinating screens, transitions, taking care of game state, etc. It will be like the
-- director of the game.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "InputHandlers"
import "OpeningScreen"
import "NumPlayersScreen"
import "ChooseMinigameScreen"

-- GLOBAL VARIABLES --
-- Try and limit how many global variables we have if possible. Not sure how
-- easy that will be with Lua.
gfx = playdate.graphics
gameState = {}
openingScreen = OpeningScreen()
numPlayersScreen = NumPlayersScreen()
chooseMinigameScreen = ChooseMinigameScreen()


-- Anything that you need to do to initialize the game should be done here. This will be the first function that runs in the game.
function initializeGame()

-- init game state variables here --
gameState["numPlayers"] = 1

-- register the main input handler with the system --
playdate.inputHandlers.push(gameInputHandlers)

openingScreen.load()

end

-- MAIN EXECUTION --
initializeGame()





-- This function executes before each frame refresh
function playdate.update()

	gfx.sprite.update()
	playdate.timer.updateTimers()
	
end