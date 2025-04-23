extends Node2D
@export var time = 0

func _ready():
	$globalTime

func _process(delta: float) -> void:

	
	$Moon.frame = time


func _on_timer_timeout() -> void:
	if time >= 7:
		time = 0
	else:
		time += 1
