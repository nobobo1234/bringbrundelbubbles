extends Control

onready var locale = OS.get_locale()

func _ready() -> void:
	if locale in TranslationServer.get_loaded_locales():
		TranslationServer.set_locale(locale)
