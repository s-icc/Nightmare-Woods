extends PlayerState
class_name PlayerRun

func Enter():	
	if player.animation_playback:
		player.animation_playback.travel("run")

func Exit():
	pass

func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	if player.velocity == Vector2.ZERO:
		Transitioned.emit(self, "idle")
	
	if Input.is_action_just_pressed("roll"):
		Transitioned.emit(self, "roll")

func turn():
	Transitioned.emit(self, "turn")

