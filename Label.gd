extends Label


var score = 0

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score += 1
	text = "Score: %s" % score

