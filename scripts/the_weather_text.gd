extends RichTextLabel
var weather = GlobalTimeScript.currentWeather

func _ready() -> void:
	pass

func _process(delta: float):
	if weather == "Wind":
		text = "The wind seems to be picking up..."
	
