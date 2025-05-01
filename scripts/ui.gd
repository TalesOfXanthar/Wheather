extends Control

func _on_wheat_button_gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Wheat"
				MOUSE_BUTTON_RIGHT:
					pass

func _on_carrot_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Carrot"
				MOUSE_BUTTON_RIGHT:
					pass
