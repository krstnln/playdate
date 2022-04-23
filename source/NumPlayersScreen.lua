import "Screen"

class('NumPlayersScreen').extends(Screen)

	function NumPlayersScreen:init()
		NumPlayersScreen.super.init(self)
	end
	
	function NumPlayersScreen:load()
	
		Screen:transitionScreens()
		
		gameState["currentScreen"] = "numPlayersScreen"
		
		-- load opening screen background --
		Screen:loadBackgroundImage("num_players_screen")
		
		--gfx.font.drawText(tostring(gameState["numPlayers"]), 200, 120)
		
	end
	
	