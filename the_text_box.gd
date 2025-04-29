extends TextEdit
var textUpdater

func _process(delta):
	if GlobalTimeScript.textBox != textUpdater:
		text = GlobalTimeScript.textBox
