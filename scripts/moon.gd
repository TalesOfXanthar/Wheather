extends Node2D
@export var time = 0
@export var isDay = true 
var moonPhase = -0.5
var specialMoonChance = 0
func _ready():
	pass

func _process(delta: float):
	pass

func _on_timer_timeout():
	if isDay:
		$Moon.animation = "Sun"
		if time == 7:
			isDay = false
			moonPhase += 0.25
			if moonPhase > 7:
				moonPhase = -0.5
			time = 0
			specialMoonChance = randi_range(0, 31)
	else:
		$Moon.animation = "MoonPhases"
		if moonPhase >= 3.5 and moonPhase <= 4.25 and specialMoonChance < 2:
			$Moon.animation = "SpecialMoons"
			$Moon.frame = specialMoonChance
		else:
			$Moon.frame = round(moonPhase)
		if time == 7:
			isDay = true
			time = 0
	time += 1
	
