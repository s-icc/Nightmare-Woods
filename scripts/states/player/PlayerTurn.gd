extends PlayerState
class_name PlayerTurn

func Enter():	
	if player.animation_playback:
		player.animation_playback.travel("turn")

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func set_idle():
	Transitioned.emit(self, "idle")
