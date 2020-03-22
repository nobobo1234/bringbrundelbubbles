extends ColorRect
# Script for the dialog box

onready var text: = $Text
onready var sprite: = $Sprite
onready var timer: = $Timer
var dialog: = []
var page: = 0

signal dialog_ended

func _ready() -> void:
	get_parent().get_parent().connect("dialog_setup", self, "set_dialog")
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if text.get_visible_characters() > text.get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				sprite.texture = load(dialog[page].sprite)
				text.set_bbcode(dialog[page].text)
				text.set_visible_characters(0)
			else:
				emit_signal("dialog_ended")
		else:
			text.set_visible_characters(text.get_total_character_count())
	
func set_dialog() -> void:
	text.set_bbcode(dialog[page].text)
	text.set_visible_characters(0)
	sprite.texture = load(dialog[page].sprite)
	set_process_input(true)

func _on_Timer_timeout() -> void:
	 text.set_visible_characters(text.get_visible_characters() + 1)

func _on_Brundel_body_entered(body: Node) -> void:
	visible = true
	timer.start()
