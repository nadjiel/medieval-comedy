extends CharacterBody2D

const TILE_SIZE: int = 64

# Speed in tiles per second
@export var speed: float = 6.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

var input_dir: Vector2
var input_attack: bool

func _process(delta: float) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	input_attack = Input.is_action_just_pressed("attack")

func _physics_process(delta: float) -> void:
	move_and_slide()

func move() -> void:
	velocity = input_dir * speed * TILE_SIZE

func adjust_sprite_side() -> void:
	if(input_dir.x < 0): sprite.flip_h = true
	elif(input_dir.x > 0): sprite.flip_h = false
