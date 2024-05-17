extends State

@onready var sheep = $"../.."
@onready var animation_player = $"../../AnimationPlayer"

@export var roll_time: float = 2.0

var explosion_scene = preload("res://objects/explosion.tscn")

var blowup_timer: float = 0.0

func _ready() -> void:
	state_name = "roll"

func _enter_state() -> void:
	animation_player.play("roll")
	sheep.speed = 5

func _process_state(delta: float) -> void:
	blowup_timer = clampf(blowup_timer + delta, 0, roll_time)
	
	if blowup_timer == roll_time:
		var explosion: Node2D = explosion_scene.instantiate()
		explosion.global_position = sheep.global_position
		sheep.get_parent().add_child(explosion)
		
		sheep.queue_free()

func _physics_process_state(delta: float) -> void:
	sheep.move()
