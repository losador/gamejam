extends Node2D

signal restart
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	emit_signal("restart") # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://mebnu.tscn") # Replace with function body.
