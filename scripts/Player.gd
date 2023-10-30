extends CharacterBody2D
class_name Player

@export var speed = 40

@onready var animation_tree = $AnimationTree
@onready var animation_playback = animation_tree.get("parameters/playback") \
			as AnimationNodeStateMachinePlayback
@onready var state_machine = $"State Machine" as StateMachine

var is_fliped: bool = false

signal direction_changed

func _ready():
	set_physics_process(false)

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("left"):
		if !is_fliped and animation_playback.get_current_node() != "turn":
			is_fliped = true
			direction_changed.emit()
		
		velocity += Vector2.LEFT
	elif Input.is_action_pressed("right"):
		if is_fliped and animation_playback.get_current_node() != "turn":
			is_fliped = false
			direction_changed.emit()
		
		velocity += Vector2.RIGHT
	
	if Input.is_action_pressed("up"):
		velocity += Vector2.UP
	elif Input.is_action_pressed("down"):
		velocity += Vector2.DOWN
	
	velocity = velocity.normalized() * speed
	move_and_slide()

func _physics_process(_delta):
	read_input()
