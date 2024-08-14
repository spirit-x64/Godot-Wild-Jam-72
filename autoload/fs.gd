extends Node


func load_json(path: String, object: Object = null) -> Variant:
	if not FileAccess.file_exists(path):
		push_error("ERR_CODE[%s] (%s)" %[ERR_FILE_NOT_FOUND, path])
		return null
	
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("ERR_CODE[%s] (%s)" % [FileAccess.get_open_error(), path])
		return null
	
	var data = await JSON.parse_string(file.get_as_text())
	
	file.close()
	
	if object != null:
		if data is Dictionary:
			for key in data:
				object.set(key, data[key])
		else:
			object.set(path.get_basename(), data)
	
	return data


func save_json(path: String, value) -> int: # returns Error code
	if not DirAccess.dir_exists_absolute(path.get_base_dir()):
		print("making: '%s'" % [path.get_base_dir()])
		var make_dir_status = DirAccess.make_dir_recursive_absolute(path.get_base_dir())
		if make_dir_status:
			push_error("ERR_CODE[%s] (%s)" % [make_dir_status, path])
			return make_dir_status
	
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		push_error("ERR_CODE[%s] (%s)" % [FileAccess.get_open_error(), path])
		return FileAccess.get_open_error()
	
	file.store_line(JSON.stringify(value, "  "))
	
	file.close()
	return OK
