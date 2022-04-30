-- A player class used to store useful info about users throughout minigames. --

class('Player').extends(Object)

function Player:init(id)
	Player.super.init(self)
	self.id = id -- unique id to each player
	self.partyPoints = 0 -- total number of party points user has accumulated throughout the minigames
	self.deltaPoints = 0 -- number of points user obtained during the minigame (can be used to subtract from total if user lost the minigame. They don't get to keep the points if they lost).
	self.alive = true -- each player starts out alive in each minigame. This boolean can be used to keep track of whether or not they are out of the current minigame.
end