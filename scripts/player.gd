extends CharacterBody2D

const TILE_SIZE: int = 64

# Speed in tiles per second
@export var speed: float = 6.0
@export var default_attack_cooldown: float = 0.6

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

var is_running: bool = false
var is_attacking: bool = false
var attack_cooldown: float = 0.6

func _process(delta: float) -> void:
	if(is_attacking):
		attack_cooldown = clampf(attack_cooldown - delta, 0, attack_cooldown)
	else:
		attack_cooldown = default_attack_cooldown
	
	if(attack_cooldown == 0):
		is_attacking = false

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(!is_attacking):
		velocity = input_dir * speed * TILE_SIZE
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
	if(input_dir.is_zero_approx()):
		is_running = false
	else:
		is_running = true
	
	if(input_dir.x < 0): sprite.flip_h = true
	elif(input_dir.x > 0): sprite.flip_h = false
	
	if(Input.is_action_just_pressed("attack")):
		attack()
	
	if(!is_attacking):
		if(is_running):
			animation_player.play("run")
		else:
			animation_player.play("idle")

func attack() -> void:
	animation_player.play("attack_side_1")
	is_attacking = true
