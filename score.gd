extends Label


var score = 0
var is_stop = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_stop == false:
		score += 1
		text = "Score: %s" % score



func _on_control_store():
	is_stop = true
	var s = FileAccess.open("score.txt", FileAccess.READ)
	if s == null:
		return
	var content = s.get_as_text()
	if score > int(content):	
		var file = FileAccess.open("score.txt", FileAccess.WRITE)
		file.store_line(str(score))
		file.close() # Replace with function body.
