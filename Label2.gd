extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("coins.txt", FileAccess.READ)
	print(file)
	var content = file.get_line()
	print(content)
	print("content")
	content = content if content != null else 0
	
	text = "Coins: %s" % content # Rpass # Replace with function body.

