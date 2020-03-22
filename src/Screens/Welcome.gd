extends ColorRect

onready var dialog_box: = $CanvasLayer/DialogBox
var file: = File.new()
export var level_one: PackedScene

signal dialog_setup

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
