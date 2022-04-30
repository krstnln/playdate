import "Screens/Screen"
import "Screens/NumPlayersScreen/NumPlayersScreenInputHandler"

class('NumPlayersScreen').extends(Screen)

	function NumPlayersScreen:init()
		NumPlayersScreen.super.init(self)
	end
	
	function NumPlayersScreen:load()
	
		Screen:transitionScreens()
		gameState["currentScreen"] = "numPlayersScreen"
		playdate.inputHandlers.pop()
		playdate.inputHandlers.push(numPlayersScreenInputHandler)
		
		-- load opening screen background --
		Screen:loadBackgroundImage("num_players_screen")
		
	end
	
	function NumPlayersScreen:update()
		
		-- if current screen is active then run the update code. Otherwise skip it. --
		if gameState["currentScreen"] == "numPlayersScreen" then 
		
			gfx.drawText('*' .. tostring(gameState["numPlayers"]) .. '*', 200, 120)
			
		end
	end