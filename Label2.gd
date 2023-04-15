extends Label


func _process(delta):
	var file = FileAccess.open("userdata.json", FileAccess.READ)

	var content = file.get_line()
	
	content = JSON.new().parse_string(content)


	
	text = "Coins: %s" % content["coins"] # Rpass # Replace with function body.

