extends State

@onready var goblin = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var idle_state = $"../IdleState"

func _ready() -> void:
	state_name = "follow"

func _enter_state() -> void:
	animation_player.play("run")

func _exit_state() -> void:
	goblin.velocity = Vector2.ZERO

func _process_state(_delta: float) -> void:
	if !goblin.should_chase(): transition.emit(idle_state)

func _physics_process_state(_delta: float) -> void:
	goblin.move()
