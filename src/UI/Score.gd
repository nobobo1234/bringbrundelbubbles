extends Control

onready var score:= $Score
onready var leveltext: = $Level
onready var total_bottles: = get_tree().get_nodes_in_group("flessen").size()
onready var pause_title: Label = get_node("DiedScreen/Label")
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("DiedScreen")

var paused: = false setget set_paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreData.connect("bottles_updated", self, "update_interface")
	ScoreData.connect("level_updated", self, "update_interface")
	ScoreData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func update_interface() -> void:
	score.text = "Flesjes: %s/%s" % [ScoreData.bottles, total_bottles]
	leveltext.text = "Level: %s" % ScoreData.levels

func _on_PlayerData_player_died() -> void:
	self.paused = true

func _on_Score_tree_entered() -> void:
	total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.bottles = 0
	ScoreData.levels += 1
	
func set_paused(value: bool) -> void:
	$Score.visible = false
	$Level.visible = false
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = true
	

