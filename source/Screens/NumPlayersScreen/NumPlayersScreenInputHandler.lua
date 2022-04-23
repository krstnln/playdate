
numPlayersScreenInputHandler = {

	AButtonDown = function()
		chooseMinigameScreen.load()
	end,
	
	AButtonHeld = function()
	end,
	
	AButtonUp = function()
	end,
	
	BButtonDown = function()
		openingScreen.load()
	end,
	
	BButtonHeld = function()
	end,
	
	BButtonUp = function()
	end,
	
	downButtonDown = function()
		
		if gameState["numPlayers"] > 1 then
			gameState["numPlayers"] = gameState["numPlayers"] - 1
		end
	end,
	
	downButtonUp = function()
	end,
	
	leftButtonDown = function()
		if gameState["numPlayers"] > 1 then
			gameState["numPlayers"] = gameState["numPlayers"] - 1
		end
	end,
	
	leftButtonUp = function()
	end,
	
	rightButtonDown = function()
		if gameState["numPlayers"] < 6 then
			gameState["numPlayers"] = gameState["numPlayers"] + 1
		end
	end,
	
	rightButtonUp = function()
	end,
	
	upButtonDown = function()
		if gameState["numPlayers"] < 6 then
			gameState["numPlayers"] = gameState["numPlayers"] + 1
		end
	end,
	
	upButtonUp = function()
	end,
	
	cranked = function(change, acceleratedChange)
	end
}