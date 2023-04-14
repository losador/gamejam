extends CharacterBody2D


func _ready():
	$AnimatedSprite2D.play("idle")

func _on_character_body_2d_die():
	$AnimatedSprite2D.stop()
