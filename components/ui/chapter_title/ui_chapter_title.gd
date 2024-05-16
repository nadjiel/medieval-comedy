extends PanelContainer

const UI_CHAPTER_TITLE_CONTENT = preload("res://components/ui/chapter_title/ui_chapter_title_content.tscn")

signal disappeared

@export var title: String

## Appends the title content to the tree
func display_title() -> void:
	var ui_chapter_title_content: MarginContainer = UI_CHAPTER_TITLE_CONTENT.instantiate()
	var label: Label = ui_chapter_title_content.get_child(0)
	label.text = title
	add_child(ui_chapter_title_content)

## Emits a signal indicating this title disappeared just before disappearing
func emit_disappeared_signal() -> void:
	disappeared.emit()
