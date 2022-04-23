import "Screens/Screen"
import "Screens/OpeningScreen/OpeningScreenInputHandler"

class('OpeningScreen').extends(Screen)

	function OpeningScreen:init()
		OpeningScreen.super.init(self)
		--self.anyButtonFlashRefreshRate = 500 -- how quickly the 'press any button' prompt will flash on and off (in ms)
	end
	
	function OpeningScreen:load()
	
		-- reset from previous screen, change gameState's current screen, and register this screens input handler
		Screen:transitionScreens()
		gameState["currentScreen"] = "openingScreen"
		playdate.inputHandlers.pop()
		playdate.inputHandlers.push(openingScreenInputHandler)
		
		-- load opening screen background --
		Screen:loadBackgroundImage("opening_screen")
		
		-- load press any button sprite (prompts the user for first input in the opening screen) --
		local pressAnyButtonSprite = nil
		local pressAnyButtonImage = gfx.image.new("images/sprites/press_any_button.png")
		local showPressAnyButtonSprite = true
		
		pressAnyButtonSprite = gfx.sprite.new(pressAnyButtonImage)
		pressAnyButtonSprite:moveTo(200, 200)
		pressAnyButtonSprite:add()
		
		-- Add a timer to the press any button sprite --
		-- so that text can flash on and off. --
		local keyTimer = nil
		local function flashText()
			showPressAnyButtonSprite = not showPressAnyButtonSprite
			pressAnyButtonSprite:setVisible(showPressAnyButtonSprite)
		end
		
		--flash 'press any button' on and off using a timer callback
		keyTimer = playdate.timer.new(500, flashText)
		keyTimer.repeats = true
		
	end
	
	function OpeningScreen:update()
	end