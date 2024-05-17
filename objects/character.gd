extends CharacterBody2D

## Provides functionalities common to all characters
class_name Character

@export var speed: float = 0
@export var sprite: Sprite2D
@export_color_no_alpha var damage_color: Color = Color.RED
@export var death_effect_scene: PackedScene = preload("res://objects/effects/death.tscn")

var input_direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.RIGHT

var health_bar: HealthBar

func _ready():
	for child in get_children():
		if child is HealthBar:
			health_bar = child
			break
	
	if health_bar:
		health_bar.damaged.connect(on_damaged)
		health_bar.die.connect(on_death)

func _physics_process(delta: float) -> void:
	move_and_slide()

func move() -> void:
	velocity = input_direction * speed * GameManager.TILE_SIZE

func adjust_sprite_side() -> void:
	if(input_direction.x < 0):
		facing_direction = Vector2.LEFT
		if sprite: sprite.flip_h = true
	elif(input_direction.x > 0):
		facing_direction = Vector2.RIGHT
		if sprite: sprite.flip_h = false

func damage(amount: float) -> void:
	if health_bar: health_bar.damage(amount)

func on_damaged(amount: float) -> void:
	if !damage_color: return
	
	modulate = damage_color
	
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, .25)

func on_death() -> void:
	if death_effect_scene:
		var death_effect = death_effect_scene.instantiate()
		death_effect.position = position
		get_parent().add_child(death_effect)
	
	queue_free()

func heal(amount: float) -> void:
	if health_bar: health_bar.heal(amount)
