extends Node2D

onready var dialog_box: = $CanvasLayer/DialogBox
var file: = File.new()

signal dialog_setup

func _ready() -> void:
	file.open("res://src/Conversations/last.json", File.READ)
	var json: = file.get_as_text()
	dialog_box.dialog = parse_json(json)
	file.close()
	emit_signal("dialog_setup")
