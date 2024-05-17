extends TileMap

@onready var camera: Camera2D = $"../Camera2D"

func _ready() -> void:
	print("Ready")
	pass

func _process(delta: float) -> void:
	var canvas_transform = get_canvas_transform()
	var canvas_origin = canvas_transform.get_origin()
	var canvas_scale = canvas_transform.get_scale()
	var top_left = -canvas_origin / canvas_scale
	var view_size = get_viewport_rect().size / canvas_scale
	var bottom_right = top_left + view_size
	#print(bottom_right)
	#print(top_left)
	#print(get_viewport().get_final_transform())
	#print(camera.get_viewport_transform())
