extends Label


var score = 0
var th = 0
var is_stop = false
signal thousand
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if is_stop == false:
		if score - th == 1000:
			emit_signal("thousand")
		score += 1
		text = "Score: %s" % score



func _on_control_store():
	is_stop = true
	var s = FileAccess.open("userdata.json", FileAccess.READ)
	var stored = s.get_line()
	
	var content = JSON.new().parse_string(stored)
	
	if score > int(content["score"]):	
		var file = FileAccess.open("userdata.json", FileAccess.WRITE)
		content["score"] = score
		file.store_line(JSON.new().stringify(content))
		file.close() # Replace with function body.
