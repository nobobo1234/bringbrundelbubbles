extends Button

var locales = ['nl', 'en_US']
const SAMPLE_TEXT = 'Language: %s'

func _ready() -> void:
	text = SAMPLE_TEXT % TranslationServer.get_locale_name(TranslationServer.get_locale())

func _on_button_up() -> void:
	if 'nl' in TranslationServer.get_locale():
		TranslationServer.set_locale('en_US')
	else:
		TranslationServer.set_locale('nl')
	text = tr(SAMPLE_TEXT) % TranslationServer.get_locale_name(TranslationServer.get_locale())
	rect_size = get_font("font").get_string_size(TranslationServer.get_locale_name(TranslationServer.get_locale()))
