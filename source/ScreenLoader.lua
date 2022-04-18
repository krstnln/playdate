-- ScreenLoader is a helper class that will help you load different screens in throughout the game.
-- It will have class functions that will just load the background image and all the resources of 
-- a certain screen.



class('ScreenLoader').extends(Object)


	function ScreenLoader:init()
		ScreenLoader.super.init(self)
	end
	
	function ScreenLoader:loadOpeningScreen()
		
		gameState["currentScreen"] = "openingScreen"
		
		-- load opening screen background --
		loadBackgroundImage("opening_screen")
		
		-- load press any button sprite --
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
			if showPressAnyButtonSprite == true then
				pressAnyButtonSprite:remove()
				showPressAnyButtonSprite = false
			else
				pressAnyButtonSprite:add()
				showPressAnyButtonSprite = true
			end
		end
		
		--flash 'press any button' on and off using a timer callback
		keyTimer = playdate.timer.new(500, flashText)
		keyTimer.repeats = true
		
	end
	
	function ScreenLoader:loadMinigameScreen()
	
	end
	
	
	-- helper function --
	-- pass the path for the background image that you want to load into this function --
	function loadBackgroundImage(image_path)
	
		local backgroundImage = gfx.image.new( "images/backgrounds/" .. image_path )
		assert( backgroundImage )

		gfx.sprite.setBackgroundDrawingCallback(
			function( x, y, width, height )
				gfx.setClipRect( x, y, width, height ) -- let's only draw the part of the screen that's dirty
				backgroundImage:draw( 0, 0 )
				gfx.clearClipRect() -- clear so we don't interfere with drawing that comes after this
			end
		)
	end