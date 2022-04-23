import "Screen"

class('ChooseMinigameScreen').extends(Screen)

	function ChooseMinigameScreen:init()
		ChooseMinigameScreen.super.init(self)
	end
	
	function ChooseMinigameScreen:load()
	
		Screen:transitionScreens()
		
		gameState["currentScreen"] = "chooseMinigameScreen"
		
		-- load opening screen background --
		Screen:loadBackgroundImage("choose_minigame_screen")
		
	end
	
	