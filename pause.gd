extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS # Replace with function body.

signal pressed
signal store
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():

	emit_signal("pressed")


func _on_button_2_store():
	emit_signal("store") # Replace with function body.
