-- main.lua
-- This file will be the main execution point of the project and will also be in charge
-- of coordinating screens, transitions, taking care of game state, etc. It will be like the
-- director of the game.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "Screens/OpeningScreen/OpeningScreen"
import "Screens/NumPlayersScreen/NumPlayersScreen"
import "Screens/ChooseMinigameScreen/ChooseMinigameScreen"
import "Screens/Minigames/CrankaboomScreen"

-- GLOBAL VARIABLES --
-- Try and limit how many global variables we have if possible. Not sure how
-- easy that will be with Lua.
gfx = playdate.graphics
gameState = {} -- a table that stores all of the gamestate variables. See gamestate_desc.txt for details on all variables within the state

-- Each screen within the game will be declared as a global here. --
openingScreen = OpeningScreen()
numPlayersScreen = NumPlayersScreen()
chooseMinigameScreen = ChooseMinigameScreen()
crankaboomScreen = CrankaboomScreen()


-- Anything that you need to do to initialize the game should be done here. This will be the first function that runs in the game.
function initializeGame()

-- init game state variables here --
gameState["numPlayers"] = 2
gameState["minigameIndex"] = 1

openingScreen.load() -- start by loading the opening screen

end

-- MAIN EXECUTION --
initializeGame()





-- This function executes before each frame refresh
function playdate.update()

	-- boiler plate update functions --
	gfx.sprite.update()
	playdate.timer.updateTimers()
	
	-- SCREEN UPDATES (only the active screen's update method will run) --
	openingScreen:update()
	numPlayersScreen:update()
	chooseMinigameScreen:update()
	crankaboomScreen:update()
end