extends Node2D

var frame = 0
var plantAge = 0.0
var plantGrowthIncrement = 1.0
var cropState = "Ground"
var cursorState = "Wheat"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "Ground"
	print("step-1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed():
	print("step0")
	if cropState == "Ground" && cursorState != "Ground":
		print("step1")
		plant_crop()
	#if frame == 3:
	#	$".".queue_free()


func _on_timer_timeout():
	frame += 1
	$AnimatedSprite2D.frame = frame
		
func plant_crop():
	cropState = cursorState
	$AnimatedSprite2D.animation = cropState
	$CropGrowthIncrementTimer.wait_time = $PlantDictionaryScript.cropInfoDictionary[cropState]["CropGrowthIncrement"]
	$CropGrowthIncrementTimer.start()
	
