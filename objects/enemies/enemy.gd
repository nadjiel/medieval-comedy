extends CharacterBody2D

class_name Enemy

# WARNING: HealthBar should be searched by type, not by name
@onready var health_bar: HealthBar = $HealthBar

func _ready():
	health_bar.die.connect(on_death)

func damage(amount: float) -> void:
	if health_bar: health_bar.damage(amount)
	print(self.name, " damaged, health: ", health_bar.health)

func on_death(death_effect_scene: PackedScene) -> void:
	if death_effect_scene:
		var death_effect = death_effect_scene.instantiate()
		death_effect.position = position
		get_parent().add_child(death_effect)
	
	queue_free()
