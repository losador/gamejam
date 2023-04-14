extends CharacterBody2D


func _ready():
	$AnimatedSprite2D.play("idle")
	$AudioStreamPlayer2D.play()
		

func _physics_process(delta):
	print("WPOS", position.x)
	if not $AnimatedSprite2D.is_playing():
		print("SDADASDASDASDASDAS")
		queue_free()
	velocity.x = -100
	move_and_slide()


func _on_area_2d_body_entered(body):
	body.kill() # Replace with function body.
