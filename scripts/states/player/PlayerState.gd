extends State
class_name PlayerState

@export var player: Player

func Enter():
	if player.direction_changed.get_connections().find(turn) == -1:
		player.direction_changed.connect(turn)

func update_flip():
	player.get_node("Sprite2D").flip_h = player.is_fliped
	player.get_node("Dust/SpriteDust").flip_h = player.is_fliped

func turn():
	Transitioned.emit(self, "turn")
