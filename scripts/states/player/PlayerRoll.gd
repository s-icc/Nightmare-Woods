extends PlayerState
class_name PlayerRoll

func Enter():
	player.set_physics_process(false)
	
	if player.animation_playback:
		player.animation_playback.travel("roll")

func Exit():
	player.set_physics_process(true)

func Update(_delta: float):
	pass
	
func Physics_Update(_delta: float):
	pass

func roll():
	var tween: Tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE)\
						.set_ease(Tween.EASE_OUT)
	tween.tween_method(roll_to, 0, 3.5, 0.35)

func roll_to(distance: float):
	var direction = player.velocity.normalized()
	direction *= distance
	player.move_and_collide(direction)

func set_idle():
	Transitioned.emit(self, "idle")
