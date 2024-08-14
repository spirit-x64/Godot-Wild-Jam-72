extends Node


const game_tab = preload("res://scenes/menus/game_settings_tab.tscn")


var game_config


func _ready():
	sync_settings()
	Settings.connect("settings_updated", sync_settings)
	
	if game_config != null:
		$TabContainer.add_child(game_tab.instantiate())
		sync_game_settings()
		game_config.connect("game_settings_updated", sync_game_settings)


func back():
	Settings.save_config()
	if game_config != null:
		game_config.save_config()
	queue_free()


func sync_settings():
	%power_saving.button_pressed = Settings.power_saving


func sync_game_settings():
	pass


func toggle_power_saving(is_toggled_on: bool):
	Settings.power_saving = is_toggled_on
