extends CharacterBody2D

var mode

func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = file.get_line()
	content = JSON.new().parse_string(content)
	mode = content["mode"]
	$AnimatedSprite2D.play("idle")
	$AudioStreamPlayer2D.play()
		

func _physics_process(delta):
	if not $AnimatedSprite2D.is_playing():
		#if mode == "first":
		queue_free()
		#else:
		##	var num_times = randi() % 20 + 1
		#	for i in range(num_times):
		#		queue_free()
	if mode == "first":
		velocity.x = -100
		move_and_slide()
		


func _on_area_2d_body_entered(body):
	if $AnimatedSprite2D.frame > 1:
		body.kill() # Replace with function body.
