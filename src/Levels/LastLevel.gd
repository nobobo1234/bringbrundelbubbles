extends Node2D
# Script that loads the conversation Brundel has with the player in the last level

signal dialog_setup

var file: = File.new()

onready var dialog_box: = $CanvasLayer/DialogBox

func _ready() -> void:
	file.open("res://src/Conversations/last.json", File.READ)
	var json: = file.get_as_text()
	dialog_box.dialog = parse_json(json)
	file.close()
	emit_signal("dialog_setup")
