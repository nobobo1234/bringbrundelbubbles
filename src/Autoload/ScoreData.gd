extends Node

signal bottles_updated
signal total_bottles_updated
signal level_updated

var bottles: = 0 setget set_bottles
var total_bottles: = 0 setget set_total_bottles
var levels: = 0 setget set_levels

func set_bottles(value: int) -> void:
	bottles = value
	emit_signal("bottles_updated")
	
func set_total_bottles(value: int) -> void:
	total_bottles = value
	emit_signal("total_bottles_updated")

func set_levels(value: int) -> void:
	levels = value
	emit_signal("level_updated")
