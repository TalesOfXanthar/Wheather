extends Control

func _on_wheat_button_gui_input(event: InputEvent) -> void:
		GlobalTimeScript.cursorState = "Wheat"

func _on_carrot_button_gui_input(event: InputEvent) -> void:
	GlobalTimeScript.cursorState = "Carrot"


func _on_pepper_button_gui_input(event: InputEvent) -> void:
	GlobalTimeScript.cursorState = "Pepper"


func _on_corn_button_gui_input(event: InputEvent) -> void:
	GlobalTimeScript.cursorState = "Corn"
