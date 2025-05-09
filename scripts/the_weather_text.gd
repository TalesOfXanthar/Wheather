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
	if weather == "Clouds":
		text = "Lots of clouds hangin' around..."
	if weather == "Rain":
		text = "It's raining cats and dogs..."
	if weather == "Hail":
		text = "It's raining... frozen cats and dogs."
	
