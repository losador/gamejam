extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	if file == null:
		return
	var content = file.get_as_text()
	content = JSON.new().parse_string(content) 
	if content["mode"] == "second":
		self.set_pressed_no_signal(true)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
