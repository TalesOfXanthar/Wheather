extends Node2D
@export var time = 8
@export var isDay = true 
func _ready():
	pass

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if isDay == true:
		time = 8
	elif time >= 7:
		time = 0
	else:
		time += 1
	$Moon.frame = time
