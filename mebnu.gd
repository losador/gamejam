extends Node2D

func _ready():
	var file = FileAccess.open("score.txt", FileAccess.WRITE)
	file = FileAccess.open("coins.txt", FileAccess.WRITE)
	file.close()
func _on_button_pressed():
	print("START")
	get_tree().change_scene_to_file("res://level_+.tscn")  # Replace with function body.


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
