extends Character

# Speed in tiles per second
@export var speed: float = 6.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var sword_attack_area: AttackArea = $SwordAttackArea

var input_dir: Vector2
var input_attack: bool

var facing_direction: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	GameManager.player_position = position
	input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	input_attack = Input.is_action_just_pressed("attack")

func _physics_process(delta: float) -> void:
	move_and_slide()

func move() -> void:
	velocity = input_dir * speed * GameManager.TILE_SIZE

func adjust_sprite_side() -> void:
	if(input_dir.x < 0):
		facing_direction = Vector2.LEFT
		sprite.flip_h = true
	elif(input_dir.x > 0):
		facing_direction = Vector2.RIGHT
		sprite.flip_h = false

func attack() -> void:
	sword_attack_area.attack(facing_direction)
