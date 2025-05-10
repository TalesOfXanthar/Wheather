extends Control

var uiState = "Wheat"

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
	selection("Wheat")
	
func _on_carrots_pressed() -> void:
	selection("Carrots")
	
func _on_pepper_pressed() -> void:
	selection("Pepper")
	
func _on_corn_pressed() -> void:
	selection("Corn")

func _on_seed_price_pressed() -> void:
	if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Cost"]:
			GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Cost"]
			PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Cost"] *= 2
			PlantDictionary.cropInfoDictionary[uiState]["PlantCost"] -= 0.5
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_tornado_resistance_pressed() -> void:
	if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Tornado"]:
		GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Tornado"]
		PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Tornado"] *= 1.5
		PlantDictionary.cropInfoDictionary[uiState]["WeatherFrailty"]["Tornado"] += 5
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_rain_gains_pressed() -> void:
	if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Rain"]:
		GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Rain"]
		PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Rain"] *= 1.4
		if PlantDictionary.cropInfoDictionary[uiState]["WeatherFrailty"]["Rain"] > 0:
			PlantDictionary.cropInfoDictionary[uiState]["WeatherFrailty"]["Rain"] += 0.15
		else:
			PlantDictionary.cropInfoDictionary[uiState]["WeatherFrailty"]["Rain"] += 0.05
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_sell_value_pressed() -> void:
	if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Sell"]:
		GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Sell"]
		PlantDictionary.cropInfoDictionary[uiState]["UpgradePrices"]["Sell"] *= 1.8
		PlantDictionary.cropInfoDictionary[uiState]["Value"] = snapped(PlantDictionary.cropInfoDictionary[uiState]["Value"] * 1.1, 0.01)
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"
		
func selection(newUIState):
	$TabContainer/Upgrades/Selection.show()
	$TabContainer/Upgrades/Crops.hide()
	uiState = newUIState

func _on_tab_container_tab_clicked(tab: int) -> void:
	$TabContainer/Upgrades/Selection.hide()
	$TabContainer/Upgrades/Crops.show()
