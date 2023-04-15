extends Node2D
var data = {
	"score": 0,
	"coins": 0,
	"skin": "idle",
	"skins": []
}

func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	if file == null:
		file = FileAccess.open("userdata.json", FileAccess.WRITE)

		file.store_line(JSON.new().stringify(data))
	file.close()# Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.


func _on_skin_pressed():
	get_tree().change_scene_to_file("res://skins.tscn") # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_+.tscn")  # Replace with function body.
