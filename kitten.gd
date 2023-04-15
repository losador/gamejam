extends CharacterBody2D
var _timer
var anims = ["first", "second", "third"]

func _ready():
	$AnimatedSprite2D.play(anims.pick_random())
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", _on_Timer_timeout)
	_timer.set_wait_time(10)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	$AnimatedSprite2D.play(anims.pick_random())
