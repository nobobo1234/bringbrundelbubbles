extends Control

onready var score:= $Label
onready var leveltext: = $Level
onready var total_bottles: = get_tree().get_nodes_in_group("flessen").size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreData.connect("bottles_updated", self, "update_interface")
	ScoreData.connect("level_updated", self, "update_interface")
	update_interface()

func update_interface() -> void:
	score.text = "Flesjes: %s/%s" % [ScoreData.bottles, total_bottles]
	leveltext.text = "Level: %s" % ScoreData.levels

func _on_Score_tree_entered() -> void:
	total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.bottles = 0
	ScoreData.levels += 1

