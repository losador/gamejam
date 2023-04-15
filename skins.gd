extends Node2D

var knify_but_text
var hatty_but_text
var devil_but_text
signal kn_choosed
signal ht_choosed
signal df_choosed
# Called when the node enters the scene tree for the first time
func _ready():
	knify_but_text = $knify/Button.text
	hatty_but_text = $hatty/Button.text
	devil_but_text = $devil/Button.text
	
func _process(delta):
	if Input.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://mebnu.tscn")

func _on_button_pressed():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	if knify_but_text.contains("Buy"):
		if int(content["coins"]) >= 200:
			file = FileAccess.open("userdata.json", FileAccess.WRITE)
			content["coins"] -= 200
			content["skins"].append("knify")
			content["skin"] = "knify"
			file.store_string(JSON.new().stringify(content))
			emit_signal("kn_choosed")
			$knify/Button.text = "OK"
	else:
		file = FileAccess.open("userdata.json", FileAccess.WRITE)
		content["skin"] = "knify"
		file.store_string(JSON.new().stringify(content))
		emit_signal("kn_choosed")
		$knify/Button.text = "OK"
	file.close()


func _on_default_butt_pressed():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	file = FileAccess.open("userdata.json", FileAccess.WRITE)
	content["skin"] = "idle"
	file.store_string(JSON.new().stringify(content))
	file.close()
	$defult/default_butt.text = "OK"


func _on_button_hatty_pressed():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	if hatty_but_text.contains("Buy"):
		if int(content["coins"]) >= 500:
			file = FileAccess.open("userdata.json", FileAccess.WRITE)
			content["coins"] -= 500
			content["skins"].append("hatty")
			content["skin"] = "hatty"
			file.store_string(JSON.new().stringify(content))
			emit_signal("ht_choosed")
			$hatty/Button.text = "OK"
	else:
		file = FileAccess.open("userdata.json", FileAccess.WRITE)
		content["skin"] = "hatty"
		file.store_string(JSON.new().stringify(content))
		emit_signal("ht_choosed")
		$hatty/Button.text = "OK"
	file.close() # Replace with function body.


func _on_button_devil_pressed():
	var file = FileAccess.open("userdata.json", FileAccess.READ)
	var content = JSON.new().parse_string(file.get_as_text())
	if devil_but_text.contains("99999"):
		return
	else:
		file = FileAccess.open("userdata.json", FileAccess.WRITE)
		content["skin"] = "devil"
		file.store_string(JSON.new().stringify(content))
		$knify/Button.text = "OK"
	file.close()
