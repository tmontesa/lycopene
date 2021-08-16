extends Node

# ======================================
# Public
# ======================================

func generate(path: String) -> Array:
	var resource_array = {}
	
	path = "res://" + path
	var directory = Directory.new()
	print("Creating database for path: " + path)
	
	if (directory.open(path) != OK):
		print ("ERROR: Cannot open path.")
		return resource_array
	
	directory.list_dir_begin()
	var filename = directory.get_next()
	
	while (filename != ""):
		if (!directory.current_is_dir()):
			var resource = load(path + "/" + filename)

			if (resource != null):
				resource_array[resource.id.to_upper()] = resource
			else:
				print ("ERROR: Cannot load resource " + filename)
			
		filename = directory.get_next()
	
	return resource_array

