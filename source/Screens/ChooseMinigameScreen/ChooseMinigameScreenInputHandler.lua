
chooseMinigameScreenInputHandler = {

	AButtonDown = function()
		crankaboomScreen:load()
	end,
	
	AButtonHeld = function()
	end,
	
	AButtonUp = function()
	end,
	
	BButtonDown = function()
		numPlayersScreen:load()
	end,
	
	BButtonHeld = function()
	end,
	
	BButtonUp = function()
	end,
	
	downButtonDown = function()
		if gameState["minigameIndex"] > 1 then
			gameState["minigameIndex"] = gameState["minigameIndex"] - 1
		end
	end,
	
	downButtonUp = function()
	end,
	
	leftButtonDown = function()
	end,
	
	leftButtonUp = function()
	end,
	
	rightButtonDown = function()
	end,
	
	rightButtonUp = function()
	end,
	
	upButtonDown = function()
		if gameState["minigameIndex"] < 3 then
			gameState["minigameIndex"] = gameState["minigameIndex"] + 1
		end
	end,
	
	upButtonUp = function()
	end,
	
	cranked = function(change, acceleratedChange)
	end
}