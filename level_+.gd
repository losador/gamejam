extends Node2D

var timer = null
var _timer = null
var _timer1 = null
var coords = [Vector2(743, 279),Vector2(748, 332),Vector2(745, 299),Vector2(741, 386),Vector2(741, 415),Vector2(696, 240),Vector2(741, 435)]
var coords_second = [
	Vector2(258, 508),
	Vector2(596, 508),
	Vector2(1052, 398),
	Vector2(1052, 255),
	Vector2(937, 197),
	Vector2(258, 264)] 
var coords_coin = [Vector2(612, 277),Vector2(612, 302),Vector2(612, 299),Vector2(612, 385)]

var t = false
var node = preload("res://popa.tscn")
var coin_node = preload("res://coin.tscn")
var is_dead = false
var delay = 2.0
var mode

func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = file.get_line()
	content = JSON.new().parse_string(content)
	mode = content["mode"]
	
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", _on_Timer_timeout)
	_timer.set_wait_time(delay)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	_timer1 = Timer.new()
	add_child(_timer1)

	_timer1.connect("timeout", _on_Timer_timeout_coin)
	_timer1.set_wait_time(5.0)
	_timer1.set_one_shot(false) # Make sure it loops
	_timer1.start()
	
	
func _process(float) -> void:
	if Input.is_action_pressed("pause") and !is_dead:
		get_tree().paused = true

		self.get_node("pause").show()
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Timer_timeout():
	if mode == "first":
		spawn()
	else:
		spawn_second()

func _on_Timer_timeout_coin():
	if mode == "first":
		spawn_coin()
	else:
		spawn_coin_second()
	
func spawn():
	var node_ins = node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = coords.pick_random()
	node_ins.set_z_index(104)
	
func spawn_second():
	var num_objects = RandomNumberGenerator.new().randi_range(5, 20) # generate random integer between 1 and 10
	for i in range(num_objects):
		var node_ins = node.instantiate()
		get_tree().get_root().add_child(node_ins)

		var middleSquare1X = randf_range(249, 1050)
		var middleSquare1Y = randf_range(258, 387)

		var middleSquare2X = randf_range(249, 495)
		var middleSquare2Y = randf_range(258, 387)

		var middleSquare3X = randf_range(780, 959)
		var middleSquare3Y = randf_range(206, 258)

		var randCoord = randi() % 3

		if randCoord == 0:
			node_ins.position = Vector2(middleSquare1X, middleSquare1Y)
		elif randCoord == 1:
			node_ins.position = Vector2(middleSquare2X, middleSquare2Y)
		else:
			node_ins.position = Vector2(middleSquare3X, middleSquare3Y)

		node_ins.set_z_index(104)

	
func spawn_coin():
	var node_ins = coin_node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = coords_coin.pick_random()

func spawn_coin_second():
	var middleSquare1X = randf_range(245, 1045)
	var middleSquare1Y = randf_range(254, 382)

	var middleSquare2X = randf_range(245, 490)
	var middleSquare2Y = randf_range(254, 382)

	var middleSquare3X = randf_range(776, 954)
	var middleSquare3Y = randf_range(202, 254)

	var positions = [
		Vector2(middleSquare1X, middleSquare1Y),
		Vector2(middleSquare2X, middleSquare2Y),
		Vector2(middleSquare3X, middleSquare3Y)
	]

	var node_ins = coin_node.instantiate()
	get_tree().get_root().add_child(node_ins)
	node_ins.position = positions[randi() % positions.size()]

func _on_pause_pressed():
	get_tree().paused = false
	self.get_node("pause").hide() # Replace with function body.


func _on_character_body_2d_die():
	is_dead = true
	self.get_node("over").show() 

func _on_over_restart():
	get_tree().reload_current_scene() # Replace with function body.


func _on_control_expand():
	_timer.set_wait_time(delay - 0.1) # Replace with function body.

	
func _on_control_boosted():
	for i in range(10):
		self.get_node("boost").show()
		await get_tree().create_timer(1).timeout
		self.get_node("boost").hide()
		await get_tree().create_timer(1).timeout
