extends TextEdit
var textUpdater

func _ready() -> void:
	GlobalTimeScript.textBox = "Welcome to Wheather, Version 0.1!"

func _process(delta: float):
	if GlobalTimeScript.textBox != textUpdater:
		text = GlobalTimeScript.textBox
