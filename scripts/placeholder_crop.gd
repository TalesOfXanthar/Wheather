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
	pass

func _on_button_pressed():
	if cropState == "Ground" && GlobalTimeScript.cursorState != "Ground":
		plant_crop()
	if frame == 3:
		return_to_ground()

func _on_timer_timeout():
	if frame != 3:
		frame += 1
	$AnimatedSprite2D.frame = frame
		
func plant_crop():
	cropState = GlobalTimeScript.cursorState
	$AnimatedSprite2D.animation = cropState
	$CropGrowthIncrementTimer.wait_time = ($PlantDictionaryScript.cropInfoDictionary[cropState]["CropGrowthIncrement"] * GlobalTimeScript.globalTimeDilation)
	$CropGrowthIncrementTimer.start()

func return_to_ground():
	GlobalTimeScript.playerMoney += $PlantDictionaryScript.cropInfoDictionary[cropState]["Value"]
	cropState = "Ground"
	$AnimatedSprite2D.animation = "Ground"
	$CropGrowthIncrementTimer.stop()
	frame = 0
	print(GlobalTimeScript.playerMoney)
	
