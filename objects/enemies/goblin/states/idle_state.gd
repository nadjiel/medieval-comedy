extends State

@onready var goblin = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var follow_state = $"../FollowState"
@onready var attack_state = $"../AttackState"

@export var attack_interval: float = .5
var attack_interval_timer: float = 0

func _ready():
	state_name = "idle"

func _enter_state():
	animation_player.play("idle")

func _exit_state():
	attack_interval_timer = 0

func _process_state(delta: float) -> void:
	if goblin.should_chase():
		transition.emit(follow_state)
		return
	
	attack_interval_timer = clampf(attack_interval_timer + delta, 0, attack_interval)
	if(attack_interval_timer == attack_interval):
		transition.emit(attack_state)
		return
	
	goblin.adjust_sprite_side()
