extends Node


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		quit()


func start():
	if not has_node("start_menu"):
		pass


func settings():
	if not has_node("settings_menu"):
		pass


func quit():
	get_tree().quit()
