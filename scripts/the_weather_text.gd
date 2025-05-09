extends RichTextLabel
var weather = GlobalTimeScript.currentWeather

func _ready() -> void:
	pass

func _process(delta: float):
	weather = GlobalTimeScript.currentWeather
	if weather == "Wind":
		text = "The wind seems to be picking up..."
	if weather == "None":
		text = "Skies are looking pretty calm..."
