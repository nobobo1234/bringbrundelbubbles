extends ColorRect
# Script that loads the conversation for the welcome screen and sends you to
# level one if the conversation is done

signal dialog_setup

export var level_one: PackedScene

var file: = File.new()

onready var dialog_box: = $CanvasLayer/DialogBox

func _ready() -> void:
	dialog_box.connect("dialog_ended", self, "go_to_level_one")
	
	file.open("res://src/Conversations/welcome.json", File.READ)
	var json: = file.get_as_text()
	dialog_box.dialog = parse_json(json)
	file.close()
	emit_signal("dialog_setup")
	dialog_box.timer.start()
	
func go_to_level_one() -> void:
	get_tree().change_scene_to(level_one)
