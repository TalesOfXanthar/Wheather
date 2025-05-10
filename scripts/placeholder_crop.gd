extends Node2D

@export var cropLocked = false
var frame = 0
var plantAge = 0.0
var plantGrowthIncrement = 1.0
var cropState = "Ground"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "Ground"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#PlantDictionary.cropInfoDictionary["Wheat"]["WeatherFrailty"]["Tornado"] = 0
	if GlobalTimeScript.currentWeather == "Rain" && cropState != "Ground":
		var remainingTimer = $CropGrowthIncrementTimer.time_left
		if randi_range(1, 60) == 60:
			$CropGrowthIncrementTimer.stop()
			var newTime = remainingTimer - PlantDictionary.cropInfoDictionary[cropState]["WeatherFrailty"]["Rain"]
			if newTime < 0.1:
				newTime = 0.1
			$CropGrowthIncrementTimer.start(newTime)
	if GlobalTimeScript.currentWeather == "Hail" && cropState != "Ground":
		var remainingTimer = $CropGrowthIncrementTimer.time_left
		if randi_range(1, 50) == 60:
			$CropGrowthIncrementTimer.stop()
			$CropGrowthIncrementTimer.start(remainingTimer + 0.2)
	
	if cropLocked:
		$Sprite2D.show()
		var stringPrice = str(GlobalTimeScript.cropLockPrice) + ".00"
		var formattedPrice = GlobalTimeScript.valueFormatter(stringPrice)
		$RichTextLabel.text = formattedPrice
		$RichTextLabel.show()
	else:
		$Sprite2D.hide()
		$RichTextLabel.hide()
		if randi_range(1, 65535) == 1 && cropState == "Ground":
			plant_crop("Wild Onions")

func _on_button_pressed():
	if cropLocked == false:
		if cropState == "Ground" && GlobalTimeScript.cursorState != "Ground":
			if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[GlobalTimeScript.cursorState]["PlantCost"]:
				plant_crop(GlobalTimeScript.cursorState)
			else:
				GlobalTimeScript.textBox = "You can't plant that, you don't have enough money!"
		if frame == 3:
			return_to_ground()
	else: 
		if GlobalTimeScript.playerMoney > GlobalTimeScript.cropLockPrice:
			GlobalTimeScript.playerMoney -= GlobalTimeScript.cropLockPrice
			cropLocked = false
			GlobalTimeScript.cropLockPrice *= 2
		else:
			GlobalTimeScript.textBox = "You can't unlock that, you don't have enough money!"
func _on_timer_timeout():
	if frame != 3:
		frame += 1
	$AnimatedSprite2D.frame = frame
	$CropGrowthIncrementTimer.wait_time = PlantDictionary.cropInfoDictionary[cropState]["CropGrowthIncrement"]
	$CropGrowthIncrementTimer.start()
		
func plant_crop(localCropState):
	cropState = localCropState
	$AnimatedSprite2D.animation = cropState
	if localCropState != "Wild Onions":
		GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[cropState]["PlantCost"]
		GlobalTimeScript.textBox = "You planted " + cropState + " for $" + str(PlantDictionary.cropInfoDictionary[cropState]["PlantCost"]) + "!"
		GlobalTimeScript.precipitation += 3
	else:
		$AnimatedSprite2D.frame = 1
		frame = 1
		print("yippee")
	$CropGrowthIncrementTimer.wait_time = PlantDictionary.cropInfoDictionary[cropState]["CropGrowthIncrement"]
	$CropGrowthIncrementTimer.start()

func return_to_ground():
	GlobalTimeScript.playerMoney += PlantDictionary.cropInfoDictionary[cropState]["Value"]
	GlobalTimeScript.textBox = "You harvested " + cropState + " for $" + str(PlantDictionary.cropInfoDictionary[cropState]["Value"]) + "!"
	cropState = "Ground"
	$AnimatedSprite2D.animation = "Ground"
	$CropGrowthIncrementTimer.stop()
	frame = 0
	print(GlobalTimeScript.playerMoney)
	GlobalTimeScript.precipitation -= 2
	GlobalTimeScript.tempature += 2

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	GlobalTimeScript.weatherTrigger = true
	if cropState != "Ground" && randi_range(1, 100) > PlantDictionary.cropInfoDictionary[cropState]["WeatherFrailty"]["Tornado"] * (frame + 1)/3:
		cropState = "Ground"
		$AnimatedSprite2D.animation = "Ground"
		$CropGrowthIncrementTimer.stop()
		frame = 0
