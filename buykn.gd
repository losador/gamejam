extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	var cs = content["skins"]
	var scs = content["skins"].find("knify")
	if content["skins"].find("knify") != -1:
		text = "Choose"
	else:
		text = "Buy: 200" # Replace with function body.

