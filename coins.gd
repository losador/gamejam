extends Label


var coins = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add():
	coins += 1
	text = "Coins: %s" % coins


func _on_control_plus_coin():
	add() # Replace with function body.


func _on_control_store():
	var s = FileAccess.open("userdata.json", FileAccess.READ)
	var stored = s.get_line()
	
	var content = JSON.new().parse_string(stored)

	var file = FileAccess.open("userdata.json", FileAccess.WRITE)
	content["coins"] += coins
	file.store_line(JSON.new().stringify(content))
	file.close() # Replace with function body.
