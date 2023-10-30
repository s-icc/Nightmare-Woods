extends PlayerState
class_name PlayerSpawn

func Enter():
	await get_tree().create_timer(1).timeout
	
	if player.animation_playback:
		player.animation_playback.travel("spawn")

func Exit():
	player.set_physics_process(true)

func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass

func set_idle():
	Transitioned.emit(self, "idle")
