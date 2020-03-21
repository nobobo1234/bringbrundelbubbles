extends Polygon2D

onready var text: = $Text
onready var sprite: = $Sprite
onready var timer: = $Timer

var dialog = [
	{
		"sprite": "res://assets/player.png",
		"text": "Hallo meneer Brundel! Ik heb een verassing voor u."
	},
	{
		"sprite": "res://assets/brundel.png",
		"text": "En wat mag die verassing dan wel zijn?"
	}
]
var page = 0

func _ready() -> void:
	text.set_bbcode(dialog[page].text)
	text.set_visible_characters(0)
	sprite.texture = load(dialog[page].sprite)
	set_process_input(true)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if text.get_visible_characters() > text.get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				sprite.texture = load(dialog[page].sprite)
				text.set_bbcode(dialog[page].text)
				text.set_visible_characters(0)
		else:
			text.set_visible_characters(text.get_total_character_count())

func _on_Timer_timeout() -> void:
	 text.set_visible_characters(text.get_visible_characters() + 1)

func _on_Brundel_body_entered(body: Node) -> void:
	visible = true
	timer.start()
