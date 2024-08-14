extends Node


const config_path := "user://config.json"


signal settings_updated


func _ready():
	await load_config()
	apply_settings()
	connect("settings_updated", apply_settings)


func save_config() -> int:
	var data : Dictionary = {}
	
	for i : Dictionary in self.get_property_list():
		const exclude : Array[String] = ["Settings.gd", "Node", "_import_path", "name", "unique_name_in_owner", "scene_file_path", "owner", "multiplayer", "Process", "process_mode", "process_priority", "process_physics_priority", "Thread Group", "process_thread_group", "process_thread_group_order", "process_thread_messages", "Editor Description", "editor_description", "script"]
		if exclude.has(i.name):
			continue
		
		data[i.name] = self.get(i.name)
	
	return fs.save_json(config_path, data)


func load_config():
	return await fs.load_json(config_path, self)


func apply_settings():
	pass
