extends CharacterBody2D

const SPEED = 200
var target_position = Vector2()
var target_y = position.y


var killed = false; 
signal die
signal coin

var cur_skin

func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = file.get_line()
	content = JSON.new().parse_string(content)
	cur_skin = content["skin"]
	$AnimatedSprite2D.play(cur_skin)
	file.close()

func map(x, in_min, in_max, out_min, out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
	
func _physics_process(delta):
	if killed == true:
		return
	var mouse_position = get_global_mouse_position()
	target_y = mouse_position.y
	target_y = map(target_y, -192, 887, -300, 1000);
	print(mouse_position.y, " ---- ", target_y," ---- ", position.y)
	var x = mouse_position.x
	print(x, " ---- ", position.x)
	if position.y - target_y > 7:
		velocity.y = -SPEED
	elif target_y - position.y > 7:
		velocity.y = SPEED
	else:
		velocity.y = 0
		
	move_and_slide()
	
func kill():
	emit_signal("die")
	$AnimatedSprite2D.play("die_" + cur_skin)
	killed = true
	
func coin_get():
	emit_signal("coin")

