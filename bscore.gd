extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("score.txt", FileAccess.READ)
	var content = file.get_line()
	print(content)
	text = "Best score: %s" % content if content != null else 0 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous fra
