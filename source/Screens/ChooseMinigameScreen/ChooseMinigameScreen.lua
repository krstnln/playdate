import "Screens/Screen"
import "Screens/ChooseMinigameScreen/ChooseMinigameScreenInputHandler"

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
	end