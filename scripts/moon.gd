extends Node2D
@export var time = 5

func _ready():
	$MoonTimer.wait_time = 10

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if time >= 7:
		time = 0
	else:
		time += 1
	$Moon.frame = time
