extends ColorRect

onready var label: = $Label

func _ready() -> void:
	label.text = tr(label.text) % [ScoreData.total_bottles_collected, ScoreData.tries]
