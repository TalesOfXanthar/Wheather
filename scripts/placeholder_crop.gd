extends Node2D

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
	pass

func _on_button_pressed():
	if cropState == "Ground" && GlobalTimeScript.cursorState != "Ground":
		if GlobalTimeScript.playerMoney >= PlantDictionary.cropInfoDictionary[GlobalTimeScript.cursorState]["PlantCost"]:
			plant_crop()
		else:
			GlobalTimeScript.textBox = "You can't plant that, you don't have enough money!"
	if frame == 3:
		return_to_ground()

func _on_timer_timeout():
	if frame != 3:
		frame += 1
	$AnimatedSprite2D.frame = frame
		
func plant_crop():
	cropState = GlobalTimeScript.cursorState
	GlobalTimeScript.playerMoney -= PlantDictionary.cropInfoDictionary[cropState]["PlantCost"]
	GlobalTimeScript.textBox = "Planted " + cropState
	$AnimatedSprite2D.animation = cropState
	$CropGrowthIncrementTimer.wait_time = PlantDictionary.cropInfoDictionary[cropState]["CropGrowthIncrement"]
	$CropGrowthIncrementTimer.start()

func return_to_ground():
	GlobalTimeScript.playerMoney += PlantDictionary.cropInfoDictionary[cropState]["Value"]
	GlobalTimeScript.textBox = " You harvested " + cropState + " for $" + str(PlantDictionary.cropInfoDictionary[cropState]["Value"]) + "!"
	cropState = "Ground"
	$AnimatedSprite2D.animation = "Ground"
	$CropGrowthIncrementTimer.stop()
	frame = 0
	print(GlobalTimeScript.playerMoney)

func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if cropState != "Ground" && randi_range(1, 100) > PlantDictionary.cropInfoDictionary[cropState]["WeatherFrailty"]["Tornado"] * (frame + 1)/3:
		cropState = "Ground"
		$AnimatedSprite2D.animation = "Ground"
		$CropGrowthIncrementTimer.stop()
		frame = 0
