extends Button


# Replace with function body.


func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	if int(content["score"]) >= 99999:
		text = "Choose"
	else:
		text = "99999 score"
	file.close() # Replace with function body.
