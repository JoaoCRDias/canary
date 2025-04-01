local CastleWarOn = GlobalEvent("CastleWarOn")
function CastleWarOn.onTime(interval)
	Game.broadcastMessage(string.format("[Castle War] The castle has been opened and will close in 10 minutes.", MESSAGE_GAME_HIGHLIGHT))
	Castle:load()
	return true
end
CastleWarOn:time("21:00:00")
CastleWarOn:register()
