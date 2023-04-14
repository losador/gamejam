extends Label


var coins = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add():
	coins += 1
	text = "Coins: %s" % coins


func _on_control_plus_coin():
	add() # Replace with function body.


func _on_control_store():
	var s = FileAccess.open("coins.txt", FileAccess.READ)
	if s == null:
		return
	var content = s.get_as_text()
	s = FileAccess.open("coins.txt", FileAccess.WRITE)
	s.store_line(str(coins + int(content)))
	s.close()  # Replace with function body.
