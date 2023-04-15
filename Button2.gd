extends Button

signal store
# Called when the node enters the scene tree for the first time.
func _on_pressed():
	emit_signal("store")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://mebnu.tscn") 

