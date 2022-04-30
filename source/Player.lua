class('Player').extends(Object)

function Player:init(id)
	Player.super.init(self)
	self.id = id
	self.partyPoints = 0
end