extends PlayerState
class_name PlayerIdle

func Enter():
	if player.animation_playback:
		player.animation_playback.travel("idle")

func Exit():
	pass

func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if player.velocity != Vector2.ZERO:
		Transitioned.emit(self, "run")
