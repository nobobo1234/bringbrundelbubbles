extends Control
# Script for the thing 

onready var score:= $Score
onready var leveltext: = $Level
onready var total_bottles: = get_tree().get_nodes_in_group("flessen").size()
onready var pause_title: Label = get_node("DiedScreen/Label")
onready var scene_tree: = get_tree()
onready var died_overlay: ColorRect = get_node("DiedScreen")
onready var pause_overlay: ColorRect = get_node("PauseScreen")

var died: = false setget set_died
var paused: = false setget set_paused

func _ready() -> void:
	ScoreData.connect("bottles_updated", self, "update_interface")
	ScoreData.connect("level_updated", self, "update_interface")
	ScoreData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = true
	
func set_died(value: bool) -> void:
	score.visible = false
	leveltext.visible = false
	died = value
	scene_tree.paused = value
	died_overlay.visible = value
	
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func update_interface() -> void:
	score.text = "Flesjes: %s/%s" % [ScoreData.bottles, total_bottles]
	leveltext.text = "Level: %s" % ScoreData.levels

func _on_PlayerData_player_died() -> void:
	self.died = true

func _on_Score_tree_entered() -> void:
	total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.total_bottles = get_tree().get_nodes_in_group("flessen").size()
	ScoreData.bottles = 0
	ScoreData.levels += 1
