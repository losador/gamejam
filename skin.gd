extends Label


func _process(delta):
	var file = FileAccess.open("userdata.json", FileAccess.READ)

	var content = file.get_line()
	
	content = JSON.new().parse_string(content)
	
	var skin = content["skin"] if content["skin"] != "idle" else "default"

	
	text = "Current Skin: %s" % skin
