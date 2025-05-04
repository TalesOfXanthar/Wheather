extends Control

func _on_wheat_button_gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Wheat"
				MOUSE_BUTTON_RIGHT:
					print ("Right")
					$TabContainer/Shop.hide()
					$"TabContainer/Upgrades/Wheat Upgrades".show()

func _on_carrot_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Carrot"
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


func _on_price_pressed() -> void:
	PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"] = 70.00
	$"TabContainer/Upgrades/Wheat Upgrades/Price".hide()
