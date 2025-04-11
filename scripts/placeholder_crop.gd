extends Node2D

var frame = 0

var plantAge = 0.0
@export var plantGrowthIncrement = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0
	$Timer.start(plantGrowthIncrement)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed():
	if frame == 3:
		queue_free()


func _on_timer_timeout():
	frame += 1
	$AnimatedSprite2D.frame = frame
	if frame != 3:
		$Timer.start
