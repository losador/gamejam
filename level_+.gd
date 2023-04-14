extends Node2D

var _timer = null

var coords = [Vector2(743, 279),Vector2(748, 332),Vector2(682, 299),Vector2(677, 386)]

var t = false
var node = preload("res://popa.tscn")


func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", _on_Timer_timeout)
	_timer.set_wait_time(2.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Timer_timeout():
	spawn()
	
func spawn():
	var node_ins = node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = coords.pick_random()
