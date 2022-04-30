
local boomThreshold <const> = 10

crankaboomScreenInputHandler = {

	-- When the A button is pressed, the info for the next player should be loaded and it is their turn.
	AButtonDown = function()
		
		if crankaboomScreen.currentPlayer == gameState["numPlayers"] then
			crankaboomScreen.currentPlayer = 1
		else
			crankaboomScreen.currentPlayer += 1
		end 
	end,
	
	AButtonHeld = function()
	end,
	
	AButtonUp = function()
	end,
	
	BButtonDown = function()
	end,
	
	BButtonHeld = function()
	end,
	
	BButtonUp = function()
	end,
	
	downButtonDown = function()

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

	end,
	
	upButtonUp = function()
	end,
	
	cranked = function(change, acceleratedChange)
		--print('CHANGE:' .. change .. '\n')
		--print('ACCELERATED_CHANGE:' .. acceleratedChange .. '\n')
		crankaboomScreen:subtractFromDetonationTime(change)
		gameState["Player" .. crankaboomScreen.currentPlayer].partyPoints += 1
		
		-- check if the player loses -- 
		-- timeToDetonate decreases as the crank turns. The upper limit on the random function will decrease as the crank turns.
		-- If the returned value from the random call is within a certain range the user loses. The probability that the value returned
		-- is within the kill range gets higher the more the crank is turned --
		if math.random(1, math.floor(crankaboomScreen.timeToDetonate)) < boomThreshold then
			-- handle player losing and what happens after loss (reset for another round or finish minigame)
			print("KABOOM!!! Player"..crankaboomScreen.currentPlayer.." loses.")
		end
	end
}