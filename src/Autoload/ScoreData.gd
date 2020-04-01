extends Node
# The autoload class that keeps track of all the scores

signal bottles_updated
signal total_bottles_updated
signal level_updated
signal player_died

var bottles: = 0 setget set_bottles
var total_bottles: = 0 setget set_total_bottles
var levels: = 1 setget set_levels
var total_bottles_collected: = 0 setget set_total_collected_bottles
var tries: = 1

func set_bottles(value: int) -> void:
	bottles = value
	emit_signal("bottles_updated")
	
func set_total_bottles(value: int) -> void:
	total_bottles = value
	emit_signal("total_bottles_updated")

func set_levels(value: int) -> void:
	levels = value
	emit_signal("level_updated")
	
func reset() -> void:
	tries += 1
	emit_signal("player_died")
	
func set_total_collected_bottles(value: int) -> void:
	total_bottles_collected = value
	
	
