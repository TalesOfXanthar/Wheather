extends Control

func _on_wheat_button_gui_input(event: InputEvent) -> void:
		if event is InputEventMouseButton and event.pressed:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
						GlobalTimeScript.cursorState = "Wheat"
				MOUSE_BUTTON_RIGHT:
					print ("Right")
					$TabContainer/Shop.hide()
					$TabContainer/Upgrades/Wheat/Economy.show()
					$TabContainer/Upgrades/Wheat/Resistance.show()
					
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


func _on_price_pressed() -> void:
	PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"] += 20.00
	GlobalTimeScript.textBox = "Wheat has increaded in value"
	$"TabContainer/Upgrades/Wheat Upgrades/Price".hide()

func _on_button_pressed() -> void:
	$TabContainer/Shop.show()
	$TabContainer/Upgrades/Wheat/Economy.hide()
	$TabContainer/Upgrades/Wheat/Resistance.hide()


func _on_tornado_resistance_pressed() -> void:
	PlantDictionary["cropInfoDictionary"]["Wheat"]["WeatherFrailty"]["Tornado"] += 20.00
	GlobalTimeScript.textBox = "Wheat is now more resistant to tornados"
	$"TabContainer/Upgrades/Wheat/Resistance/Tornado Resistance".hide()
	$TabContainer/Upgrades/Exit.show()
