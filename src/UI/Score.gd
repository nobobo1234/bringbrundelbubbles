extends Control

onready var score:= $Label
onready var total_bottles: = get_tree().get_nodes_in_group("flessen").size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreData.connect("bottles_updated", self, "update_interface")
	update_interface()

func update_interface() -> void:
	$Label.text = "Flesjes: %s/%s" % [ScoreData.bottles, total_bottles]
