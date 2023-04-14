extends CharacterBody2D

const SPEED = 200
var target_position = Vector2()
var target_y = position.y

func map(x, in_min, in_max, out_min, out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	target_y = mouse_position.y
	target_y = map(target_y, -192, 887, -100, 200);
	print(target_y," ---- ", position.y)
	if target_y < position.y:
		velocity.y = -SPEED
	else:
		velocity.y = SPEED
		
	move_and_slide()
