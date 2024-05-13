extends CharacterBody2D

# Speed in tiles per second
@export var speed: float = 3

var direction: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	direction = (GameManager.player_position - position).normalized()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func move() -> void:
	velocity = direction * speed * GameManager.TILE_SIZE
