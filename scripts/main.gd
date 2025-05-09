extends Node2D

@export var tornado_scene: PackedScene
var initiated = false
var rainChecker = 0

func _ready() -> void:
	$WeatherCheck.start(randi_range(5,10))

func _process(delta: float):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
	
	if str(GlobalTimeScript.playerMoney)[-3] == ".":
		$Money.text = "$" + str(GlobalTimeScript.playerMoney)
	else:
		$Money.text = "$" + str(GlobalTimeScript.playerMoney) + "0"
	
	# print(PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"])
	
	if GlobalTimeScript.currentWeather == "Wind" && !initiated:
		print("yeah cool")
		GlobalTimeScript.precipitation += 3
		initiated = true
		$WeatherTimer.start(randi_range(5,10))
		#randi_range(5,10)
	
	elif GlobalTimeScript.currentWeather == "Rain" && randi_range(1, 500) == 500:
		GlobalTimeScript.precipitation -= abs(rainChecker - 2)
		if randi_range(1, 2) == 2:
			rainChecker += 1
			if rainChecker == 6:
				GlobalTimeScript.currentWeather = "None"
		print("So your probably wondering how I got here...")
	
func spawnTornado():
	var tornado = tornado_scene.instantiate()
		
	var tornadoSpawnLocation = $Path2D/PathFollow2D
	tornadoSpawnLocation.progress_ratio = randf()
		
	tornado.position = tornadoSpawnLocation.position
		
	var direction = tornadoSpawnLocation.rotation

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	tornado.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(50.0, 100.0), 0.0)
	tornado.linear_velocity = velocity.rotated(direction)
		
	tornado.rotation = 0

	# Spawn the mob by adding it to the Main scene.
	add_child(tornado)


func _on_weather_timer_timeout() -> void:
	if GlobalTimeScript.currentWeather == "Wind":
		print("yeah cool2")
		initiated = false
		spawnTornado()
		GlobalTimeScript.precipitation -= 2
		if GlobalTimeScript.weatherTrigger == true:
			GlobalTimeScript.currentWeather = "None"
			GlobalTimeScript.weatherTrigger = false
			print("it worked!!!")


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_weather_check_timeout() -> void:
	if GlobalTimeScript.currentWeather == "None":
		if randi_range(20,100) < GlobalTimeScript.precipitation:
			if randi_range(1,80) > GlobalTimeScript.tempature:
				if randi_range(1,50) > GlobalTimeScript.tempature:
					#High precipitation, passed low temp check, passed really low temp check
					GlobalTimeScript.currentWeather = "Hail"
					print(GlobalTimeScript.currentWeather)
				else:
					#High precipitation, passed low temp check, failed really low temp check
					GlobalTimeScript.currentWeather = "Rain"
					print(GlobalTimeScript.currentWeather)
					rainChecker = 0
			else:
				#High precipitation, failed low temp check
				GlobalTimeScript.currentWeather = "Clouds"
				print(GlobalTimeScript.currentWeather)
		else:
			if randi_range(20,100) < GlobalTimeScript.tempature:
				#Low precipitation, passed high temp check
				GlobalTimeScript.currentWeather = "Wind"
				print(GlobalTimeScript.currentWeather)
