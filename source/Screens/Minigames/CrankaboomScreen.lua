
import "Screens/Screen"
import "Screens/Minigames/CrankaboomScreenInputHandler"

class('CrankaboomScreen').extends('Screen')

	function CrankaboomScreen:init()
		CrankaboomScreen.super.init(self)
		self.currentPlayer = 1
		self.nextPlayer = 1
		self.timeToDetonate = math.random(5000, 10000)
		self.remainingPlayers = nil
		
		
		-- define images and sprites here
		-- bomb image
		local bombImage = gfx.image.new("images/sprites/bomb")
		assert(bombImage)
		self.bombSprite = gfx.sprite.new(bombImage)
		
		-- bomb fuse flame
		local bombFuseFlameImage = gfx.image.new("images/sprites/bomb_fuse_flame")
		assert(bombFuseFlameImage)
		self.bombFuseFlameSprite = gfx.sprite.new(bombFuseFlameImage)
		
		-- pass to next player text
		local passToNextPlayerImage = gfx.image.new("images/sprites/pass_to_next_player_text")
		assert(passToNextPlayerImage)
		self.passToNextPlayerSprite = gfx.sprite.new(passToNextPlayerImage)
		
		-- crank for points text
		local crankForPointsImage = gfx.image.new("images/sprites/crank_for_points_text")
		assert(crankForPointsImage)
		self.crankForPointsSprite = gfx.sprite.new(crankForPointsImage)
		
	end
	
	function CrankaboomScreen:load()
	
		Screen:transitionScreens()
		gameState["currentScreen"] = "crankaboomScreen"
		playdate.inputHandlers.pop()
		playdate.inputHandlers.push(crankaboomScreenInputHandler)		

		self.remainingPlayers = gameState["numPlayers"]
		
		self.bombSprite:moveTo(200, 100)
		self.bombSprite:add()
		
		self.passToNextPlayerSprite:moveTo(195, 210)
		self.passToNextPlayerSprite:add()
		
		self.bombFuseFlameSprite:moveTo(260, 45)
		self.bombFuseFlameSprite:add()
		
		self.crankForPointsSprite:moveTo(195, 175)
		self.crankForPointsSprite:add()
		local showCrankForPointsSprite = true

		local keyTimer = nil
		local function flashText()
			showCrankForPointsSprite = not showCrankForPointsSprite
			self.crankForPointsSprite:setVisible(showCrankForPointsSprite)
		end
		
		--flash 'press any button' on and off using a timer callback
		keyTimer = playdate.timer.new(500, flashText)
		keyTimer.repeats = true
		
	end
	
	function CrankaboomScreen:clearScreen()
		self.bombSprite:remove()
		self.bombFuseFlameSprite:remove()
		self.crankForPointsSprite:remove()
		self.passToNextPlayerSprite:remove()
	end
	
	function CrankaboomScreen:resetScreen()
		self.bombSprite:add()
		self.bombFuseFlameSprite:add()
		self.crankForPointsSprite:add()
		self.passToNextPlayerSprite:add()
		gameState["currentScreen"] = "crankaboomScreen"
		self.timeToDetonate = math.random(5000, 10000)
	end
	
	function CrankaboomScreen:update()
		if gameState["currentScreen"] == "crankaboomScreen" then
			
			gfx.drawText('Player ' .. self.currentPlayer, 10, 10)
			gfx.drawText('Party Points: ' .. gameState["Player"..self.currentPlayer].deltaPoints, 10, 30)
			
			-- this rotation function is inefficent on hardware. Remove when not running on sim --
			self.bombFuseFlameSprite:setRotation(math.random(0, 359))
		elseif gameState["currentScreen"] == "crankaboomScreen_playerKilled" then
		
			gfx.drawText('Player' .. self.currentPlayer .. ' eliminated!', 140, 80)
			gfx.drawText('Pass the Playdate to Player'..self:getNextPlayer(), 90, 140)
			gfx.drawText('Press *A* when ready...', 130, 160)
		elseif gameState["currentScreen"] == "crankaboomScreen_gameOver" then -- last player standing wins --
			
			gfx.drawText('Player' .. self.currentPlayer .. ' eliminated!', 135, 80)
			gfx.drawText('Player'..self:getNextPlayer()..' wins '..gameState["Player"..self:getNextPlayer()].deltaPoints..' points!', 120, 140)
			gfx.drawText('Press *A* when ready...', 125, 160)
		end
	end
	
	function CrankaboomScreen:getNextPlayer()
		
		local nextPlayer = self.currentPlayer + 1
		
		if nextPlayer > gameState["numPlayers"] then -- player number should not go out of bounds --
				nextPlayer = 1
		end

		-- Increment until you find a player still in the game --
		while gameState["Player"..nextPlayer].alive == false
		do
			nextPlayer += 1
			if nextPlayer > gameState["numPlayers"] then -- player number should not go out of bounds --
				nextPlayer = 1
			end
		end
		
		return nextPlayer
	end
	
	function CrankaboomScreen:subtractFromDetonationTime(subAmount)
		self.timeToDetonate = self.timeToDetonate - math.abs(subAmount)
	end