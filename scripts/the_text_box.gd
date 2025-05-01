extends TextEdit
var textUpdater

func _process(delta: float):
	if GlobalTimeScript.textBox != textUpdater:
		text = GlobalTimeScript.textBox
