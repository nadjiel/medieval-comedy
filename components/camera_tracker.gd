extends Camera2D

## A camera that allows tracking its boundaries positions easily
class_name CameraTracker

## Emitted when the camera positions updates
signal updated(top_left: Vector2, bottom_right: Vector2)

var prev_top_left
var prev_bottom_right

var top_left: Vector2
var bottom_right: Vector2

func _process(delta: float) -> void:
	calculate_positions()

func calculate_positions() -> void:
	var canvas_transform: Transform2D = get_canvas_transform()
	var canvas_origin: Vector2 = canvas_transform.get_origin()
	var canvas_scale: Vector2 = canvas_transform.get_scale()
	top_left = -canvas_origin / canvas_scale
	
	var viewport_rect: Rect2 = get_viewport_rect()
	var view_size: Vector2 = viewport_rect.size / canvas_scale
	bottom_right = top_left + view_size
	
	if(
		(prev_top_left == null || (prev_top_left != top_left)) ||
		(prev_bottom_right == null || (prev_bottom_right != bottom_right))
	):
		updated.emit(top_left, bottom_right)
		
		prev_top_left = top_left
		prev_bottom_right = bottom_right
