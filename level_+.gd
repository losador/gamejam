extends Node2D

var _timer = null
var _timer1 = null
var coords = [Vector2(743, 279),Vector2(748, 332),Vector2(682, 299),Vector2(677, 386)]
var coords_coin = [Vector2(612, 277),Vector2(612, 302),Vector2(612, 299),Vector2(612, 385)]

var t = false
var node = preload("res://popa.tscn")
var coin_node = preload("res://coin.tscn")


func _ready():

	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", _on_Timer_timeout)
	_timer.set_wait_time(2.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	_timer1 = Timer.new()
	add_child(_timer1)

	_timer1.connect("timeout", _on_Timer_timeout_coin)
	_timer1.set_wait_time(5.0)
	_timer1.set_one_shot(false) # Make sure it loops
	_timer1.start()
	
	
func _process(float) -> void:
	if Input.is_action_pressed("pause"):
		get_tree().paused = true

		self.get_node("pause").show()
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Timer_timeout():
	spawn()

func _on_Timer_timeout_coin():
	spawn_coin()
	
func spawn():
	var node_ins = node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = coords.pick_random()
	
func spawn_coin():
	var node_ins = coin_node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = coords_coin.pick_random()


func _on_pause_pressed():
	get_tree().paused = false
	self.get_node("pause").hide() # Replace with function body.


func _on_character_body_2d_die():
	self.get_node("over").show() 

func _on_over_restart():
	get_tree().reload_current_scene() # Replace with function body.
