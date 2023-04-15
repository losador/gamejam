extends CharacterBody2D


func _ready():
	$AnimatedSprite2D.play("idle")
	$AudioStreamPlayer2D.play()
		

func _physics_process(delta):
	if not $AnimatedSprite2D.is_playing():
		queue_free()
	velocity.x = -100
	move_and_slide()


func _on_area_2d_body_entered(body):
	if $AnimatedSprite2D.frame > 1:
		body.kill() # Replace with function body.
