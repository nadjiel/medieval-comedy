extends State

@onready var enemy_spawner = $"../../EnemySpawner"
const GOBLIN = preload("res://objects/enemies/goblin/goblin.tscn")

func _ready() -> void:
	state_name = "First wave"

func _enter_state() -> void:
	print(state_name + " started!")
	enemy_spawner.packed_scenes.append(GOBLIN)
	enemy_spawner.spawn_per_minute = 60
	pass
