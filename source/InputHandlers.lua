-- This files holds all input handlers.  -- 
-- The ScreenLoader will be responsible for popping and pushing the correct handlers as
-- each screen should have different handlers for different purposes. --

gameInputHandlers = {

	AButtonDown = function()
	
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		elseif gameState["currentScreen"] == "numPlayersScreen" then
			chooseMinigameScreen.load()
		end
	end,
	
	AButtonHeld = function()
	end,
	
	AButtonUp = function()
	end,
	
	BButtonDown = function()
	
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		elseif gameState["currentScreen"] == "numPlayersScreen" then
			openingScreen.load()
		elseif gameState["currentScreen"] == "chooseMinigameScreen" then
			numPlayersScreen.load()
		end
	end,
	
	BButtonHeld = function()
	end,
	
	BButtonUp = function()
	end,
	
	downButtonDown = function()
		
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		end
	end,
	
	downButtonUp = function()
	end,
	
	leftButtonDown = function()
	
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		end
	end,
	
	leftButtonUp = function()
	end,
	
	rightButtonDown = function()
	
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		end
	end,
	
	rightButtonUp = function()
	end,
	
	upButtonDown = function()
	
		if gameState["currentScreen"] == "openingScreen" then
			numPlayersScreen.load()
		end
	end,
	
	upButtonUp = function()
	end,
	
	cranked = function(change, acceleratedChange)
	end
}