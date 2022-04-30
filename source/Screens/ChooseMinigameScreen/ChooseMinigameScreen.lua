import "Screens/Screen"
import "Screens/ChooseMinigameScreen/ChooseMinigameScreenInputHandler"

local GAME_NAMES = {}

GAME_NAMES[1] = "Cranka-boom (1)!"
GAME_NAMES[2] = "Cranka-boom (2)!"
GAME_NAMES[3] = "Cranka-boom (3)!"

class('ChooseMinigameScreen').extends(Screen)

	function ChooseMinigameScreen:init()
		ChooseMinigameScreen.super.init(self)
	end
	
	function ChooseMinigameScreen:load()
	
		Screen:transitionScreens()
		gameState["currentScreen"] = "chooseMinigameScreen"
		playdate.inputHandlers.pop()
		playdate.inputHandlers.push(chooseMinigameScreenInputHandler)
		
		-- load opening screen background --
		Screen:loadBackgroundImage("choose_minigame_screen")
		
	end
	
	function ChooseMinigameScreen:update()
	
		-- if current screen is active then run the update code. Otherwise skip it. --
		if gameState["currentScreen"] == "chooseMinigameScreen" then
			gfx.drawText('*' .. GAME_NAMES[gameState["minigameIndex"]] .. '*', 140, 120)
		end
	end