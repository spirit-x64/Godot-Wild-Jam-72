extends Node


var game_config


func _ready():
	sync_settings()
	Settings.connect("settings_updated", sync_settings)


func back():
	Settings.save_config()
	if game_config != null:
		game_config.save_config()
	queue_free()


func sync_settings():
	%power_saving.button_pressed = Settings.power_saving


func toggle_power_saving(is_toggled_on: bool):
	Settings.power_saving = is_toggled_on
