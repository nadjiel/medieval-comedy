extends State

@onready var player = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var idle_state = $"../IdleState"

var cooldown: float = 0.6
var current_cooldown: float = cooldown

func _ready():
	state_name = "attack"

func _enter_state() -> void:
	animation_player.play("attack_side_1")

func _exit_state() -> void:
	current_cooldown = cooldown

func _process_state(delta: float) -> void:
	current_cooldown = clampf(current_cooldown - delta, 0, current_cooldown)
	
	if(current_cooldown == 0.0):
		transition.emit(idle_state)

func _physics_process_state(_delta: float) -> void:
	player.velocity = Vector2.ZERO
