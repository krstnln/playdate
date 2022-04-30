import "Player"

local minNumPlayers <const> = 2
local maxNumPlayers <const> = 8

numPlayersScreenInputHandler = {

	AButtonDown = function()
		chooseMinigameScreen.load()
		
		-- the number of players playing has been decided so create a structure to hold all player info --
		for i=1, gameState["numPlayers"], 1
		do
			gameState["Player"..i] = Player(i)
		end

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
		
		if gameState["numPlayers"] > minNumPlayers then
			gameState["numPlayers"] = gameState["numPlayers"] - 1
		end
	end,
	
	downButtonUp = function()
	end,
	
	leftButtonDown = function()
		if gameState["numPlayers"] > minNumPlayers then
			gameState["numPlayers"] = gameState["numPlayers"] - 1
		end
	end,
	
	leftButtonUp = function()
	end,
	
	rightButtonDown = function()
		if gameState["numPlayers"] < maxNumPlayers then
			gameState["numPlayers"] = gameState["numPlayers"] + 1
		end
	end,
	
	rightButtonUp = function()
	end,
	
	upButtonDown = function()
		if gameState["numPlayers"] < maxNumPlayers then
			gameState["numPlayers"] = gameState["numPlayers"] + 1
		end
	end,
	
	upButtonUp = function()
	end,
	
	cranked = function(change, acceleratedChange)
	end
}