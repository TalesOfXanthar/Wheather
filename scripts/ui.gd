extends Control

var sellPriceCost = 1
var seedPriceCost = 1
var tornadoCostPrice = 1
var rainCostPrice = 1

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
	$TabContainer/Upgrades/Crops.hide()
	$TabContainer/Upgrades/Selection.show()
	$"TabContainer/Upgrades/Selection/Wheat Upgrades".show()

func _on_button_pressed() -> void:
	$TabContainer/Upgrades/Selection.hide()
	$TabContainer/Upgrades/Crops.show()

func _on_sell_price_pressed() -> void:
	if GlobalTimeScript.playerMoney >= sellPriceCost:
		$"TabContainer/Upgrades/Selection/Wheat Upgrades/Economy/Sell Price".hide()
		PlantDictionary.cropInfoDictionary["Wheat"]["Value"] *= 1.5
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_seed_price_pressed() -> void:
	if GlobalTimeScript.playerMoney > seedPriceCost:
		$"TabContainer/Upgrades/Selection/Wheat Upgrades/Economy/Seed Price".hide()
		PlantDictionary.cropInfoDictionary["Wheat"]["PlantCost"] *= 0.5
		print("money")
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"
		print("nope")

func _on_tornado_resistance_pressed() -> void:
	if GlobalTimeScript.playerMoney >= tornadoCostPrice:
		$"TabContainer/Upgrades/Selection/Wheat Upgrades/Resistance/Tornado Resistance".hide()
		PlantDictionary.cropInfoDictionary["Wheat"]["WeatherFrailty"]["Tornado"] *= 1.5
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_rain_pressed() -> void:
	pass # Replace with function body.
	if GlobalTimeScript.playerMoney >= sellPriceCost:
		$"TabContainer/Upgrades/Selection/Carrot Upgrades/Economy/Sell Price1"
		PlantDictionary.cropInfoDictionary["Carrots"]["Value"] *= 1.5
	else:
		GlobalTimeScript.textBox = "You can't buy that, you don't have enough money!"

func _on_sell_price_1_pressed() -> void:
	pass # Replace with function body.


func _on_seed_price_1_pressed() -> void:
	pass # Replace with function body.


func _on_tornado_resistance_1_pressed() -> void:
	pass # Replace with function body.


func _on_rain_1_pressed() -> void:
	pass # Replace with function body.


func _on_carrots_pressed() -> void:
	$"TabContainer/Upgrades/Selection/Carrot Upgrades".show()
	$TabContainer/Upgrades/Crops.hide()
	$TabContainer/Upgrades/Selection.show()
