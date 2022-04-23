
class('Screen').extends(Object)

	function Screen:init()
		Screen.super.init(self)
	end
	
	-- helper function --
	-- anything that needs to be cleaned up between screens should be done here. --
	-- This function should be called at the top of every load screen call. -- 
	function Screen:transitionScreens()
		gfx.sprite.removeAll()
		print(playdate.timer.allTimers())
	end

	function Screen:loadBackgroundImage(image_path)
	
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
		
	