
local boomThreshold <const> = 10

crankaboomScreenInputHandler = {

	-- When the A button is pressed, the info for the next player should be loaded and it is their turn.
	AButtonDown = function()
		
		if gameState["currentScreen"] == "crankaboomScreen" then
			crankaboomScreen.currentPlayer = crankaboomScreen:getNextPlayer()
		elseif gameState["currentScreen"] == "crankaboomScreen_playerKilled" then
			crankaboomScreen.currentPlayer = crankaboomScreen:getNextPlayer()
			crankaboomScreen:resetScreen()
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
		
		if gameState["currentScreen"] == "crankaboomScreen" then 
		
			crankaboomScreen:subtractFromDetonationTime(change)
			gameState["Player" .. crankaboomScreen.currentPlayer].deltaPoints += 1		
		
			-- check if the player loses -- 
			-- timeToDetonate decreases as the crank turns. The upper limit on the random function will decrease as the crank turns.
			-- If the returned value from the random call is within a certain range the user loses. The probability that the value returned
			-- is within the kill range gets higher the more the crank is turned --
			if math.random(1, math.max(math.floor(crankaboomScreen.timeToDetonate), 100)) < boomThreshold then
				-- handle player losing and what happens after loss (reset for another round or finish minigame)
				gameState["Player"..crankaboomScreen.currentPlayer].alive = false
				
				crankaboomScreen.remainingPlayers -= 1
				crankaboomScreen:clearScreen()
				
				-- check if there are still any remaining players
				if crankaboomScreen.remainingPlayers == 1 then
					gameState["currentScreen"] = "crankaboomScreen_gameOver"
				else
					gameState["currentScreen"] = "crankaboomScreen_playerKilled"
				end
				
			end
		end
	end
}