extends TileMap

## Provides methods to generate tiles dinamically
class_name TileGenerator

## The camera that will notify this generator when to generate
@export var camera: CameraTracker

var tile_size: Vector2 = tile_set.tile_size

func _ready() -> void:
	camera.updated.connect(on_camera_moved)

func generate_tiles(from: Vector2, to: Vector2) -> void:
	for x in range(from.x, to.x, tile_size.x):
		for y in range(from.y, to.y, tile_size.y):
			var map_position: Vector2i = local_to_map(Vector2(x, y))
			var current_cell: int = get_cell_source_id(0, map_position)
			
			if current_cell != -1: continue
			
			# 0 represents the ground layer
			set_cell(0, map_position, 0, Vector2i(1, 1))

func on_camera_moved(top_left: Vector2, bottom_right: Vector2) -> void:
	generate_tiles(top_left - tile_size, bottom_right + tile_size)
