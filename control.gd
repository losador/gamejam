extends Control

signal store
signal expand
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal plus_coin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_coin():
	emit_signal("plus_coin") # Replace with function body.


func _on_player_die():
	emit_signal("store") # Replace with function body.



func _on_pause_store():
	emit_signal("store") # Replace with function body.


func _on_score_thousand():
	emit_signal("expand") # Replace with function body.
