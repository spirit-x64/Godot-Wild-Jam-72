extends Node


var settings_menu = preload("res://scenes/menus/settings_menu.tscn")


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		quit()


func start():
	if not has_node("start_menu"):
		pass


func settings():
	if not has_node("settings_menu"):
		add_child(settings_menu.instantiate())


func quit():
	get_tree().quit()
