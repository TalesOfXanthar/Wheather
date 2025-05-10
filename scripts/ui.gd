extends Control

func _on_wheat_button_gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Wheat"
				MOUSE_BUTTON_RIGHT:
					print ("Right")
					$TabContainer.hide()
					$TabContainer/Upgrades/Wheat/Economy.show()
					$TabContainer/Upgrades/Wheat/Resistance.show()
					$TabContainer/Upgrades/Exit.show()
					
func _on_carrot_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Carrots"
				MOUSE_BUTTON_RIGHT:
					pass


func _on_pepper_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Pepper"
				MOUSE_BUTTON_RIGHT:
					pass


func _on_corn_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Corn"
				MOUSE_BUTTON_RIGHT:
					pass

func _on_wheat_pressed() -> void:
	$TabContainer/Upgrades/Crops.hide()
	$TabContainer/Upgrades/Selection.show()
	$"TabContainer/Upgrades/Selection/Wheat Upgrades".show()

func _on_button_pressed() -> void:
	$TabContainer/Upgrades/Selection.hide()
	$TabContainer/Upgrades/Crops.show()
