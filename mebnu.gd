extends Node2D
var data = {
	"score": 0,
	"mode": "first",
	"coins": 0,
	"skin": "idle",
	"skins": []
}

var mode

func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	if file == null:
		file = FileAccess.open("userdata.json", FileAccess.WRITE)

		file.store_line(JSON.new().stringify(data))
	file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = file.get_as_text()
	content = JSON.new().parse_string(content) 
	mode = content["mode"]
	file.close()# Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.


func _on_skin_pressed():
	get_tree().change_scene_to_file("res://skins.tscn") # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_+.tscn") 



func _on_check_button_pressed():
	mode = "second" if mode == "first" else "first"
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = file.get_as_text()
	content = JSON.new().parse_string(content) 
	content["mode"] = mode
	file = FileAccess.open("userdata.json", FileAccess.WRITE)
	file.store_line(JSON.new().stringify(content))# Replace with function body.
	file.close()
