extends State

@onready var sheep = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var roll_state = $"../RollState"

var min_distance: float = GameManager.TILE_SIZE
var target: Character

func _ready() -> void:
	state_name = "follow"

func _enter_state() -> void:
	animation_player.play("bounce")

func _process_state(delta: float) -> void:
	if Input.is_action_just_pressed("sheep_cannon"):
		transition.emit(roll_state)
		return
	
	sheep.input_direction = (target.position - sheep.position).normalized()
	
	if sheep.position.distance_to(target.position) > min_distance:
		sheep.speed = target.speed
	else:
		sheep.speed = 0
	
	sheep.adjust_sprite_side()

func _physics_process_state(delta: float) -> void:
	sheep.move()
