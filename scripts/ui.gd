extends Control

func _on_wheat_button_pressed():
	GlobalTimeScript.cursorState = "Wheat"

func _on_carrot_button_pressed():
	GlobalTimeScript.cursorState = "Carrot"
