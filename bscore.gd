extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)

	if file == null:
		return
	var content = file.get_line()
	
	content = JSON.new().parse_string(content)

	
	text = "Best Score: %s" % content["score"] 


# Called every frame. 'delta' is the elapsed time since the previous fra
