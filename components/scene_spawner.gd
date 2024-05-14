extends Path2D

## Instantiates packed scenes at random points of the path it extends
##
## If there's no PathFollow2D child to this node, all spawn will occurr at
## this node's global position
class_name SceneSpawner

const SECONDS_PER_MINUTE: int = 60

@export var packed_scenes: Array[PackedScene]
@export var spawn_per_minute: float

var path_follow: PathFollow2D

var cooldown: float = 0
var interval: float

func _ready() -> void:
	for child in get_children():
		if child is PathFollow2D:
			path_follow = child
			break

func _process(delta: float) -> void:
	if !packed_scenes: return
	if spawn_per_minute == 0: return
	
	cooldown = clampf(cooldown - delta, 0, cooldown)
	if cooldown > 0: return
	
	interval = SECONDS_PER_MINUTE / spawn_per_minute
	cooldown = interval
	
	var i: int = randi_range(0, packed_scenes.size() - 1)
	var packed_scene: PackedScene = packed_scenes[i]
	
	if !packed_scene: return
	
	var scene: Node = packed_scene.instantiate()
	scene.global_position = randomize_point()
	get_parent().add_child(scene)

func randomize_point() -> Vector2:
	if !path_follow: return global_position
	
	path_follow.progress_ratio = randf()
	
	return path_follow.global_position
