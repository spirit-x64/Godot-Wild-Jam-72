extends Node


var game_config


func _ready():
	Settings.connect("settings_updated", sync_settings)


func back():
	Settings.save_config()
	if game_config != null:
		game_config.save_config()
	queue_free()


func sync_settings():
	pass
