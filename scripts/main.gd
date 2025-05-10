extends Node2D

@export var tornado_scene: PackedScene
var initiated = false
var rainChecker = 0

func _ready() -> void:
	$WeatherCheck.start(randi_range(10,15))

func _process(delta: float):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
	
	if str(GlobalTimeScript.playerMoney)[-3] == "." || GlobalTimeScript.playerMoney > 999.99:
		$Money.text = GlobalTimeScript.valueFormatter(str(GlobalTimeScript.playerMoney))
	else:
		$Money.text = GlobalTimeScript.valueFormatter(str(GlobalTimeScript.playerMoney)) + "0"
	
	# print(PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"])
	
	if GlobalTimeScript.currentWeather == "Wind" && !initiated:
		print("yeah cool")
		GlobalTimeScript.precipitation += 5
		initiated = true
		$WeatherTimer.start(randi_range(5,10))
		#randi_range(5,10)
	
	elif GlobalTimeScript.currentWeather == "Rain" && randi_range(1, 500) == 500:
		GlobalTimeScript.precipitation -= abs(rainChecker - 2)
		GlobalTimeScript.tempature -= abs(rainChecker - 2)
		if randi_range(1, 2) == 2:
			rainChecker += 1
			if rainChecker == 6:
				GlobalTimeScript.currentWeather = "None"
		print("So your probably wondering how I got here...")
	
	elif GlobalTimeScript.currentWeather == "Hail" && randi_range(1, 450) == 450:
		GlobalTimeScript.precipitation -= abs(rainChecker - 4)
		GlobalTimeScript.tempature += abs(rainChecker + 4)
		if randi_range(1, 3) != 1:
			rainChecker += 1
			if rainChecker == 5:
				GlobalTimeScript.currentWeather = "None"
		print("So you probably know how I got here...")
	
	elif GlobalTimeScript.currentWeather == "Clouds" && randi_range(1, 400) == 400:
		GlobalTimeScript.tempature -= 1
		GlobalTimeScript.precipitation += 1
		if randi_range(1, 2) != 1:
			rainChecker += 1
			if rainChecker == 10:
				GlobalTimeScript.currentWeather = "None"
	
	if GlobalTimeScript.precipitation > 100:
		GlobalTimeScript.precipitation = 100
	if GlobalTimeScript.precipitation < 0:
		GlobalTimeScript.precipitation = 0
	if GlobalTimeScript.tempature > 100:
		GlobalTimeScript.tempature = 100
	if GlobalTimeScript.tempature < 0:
		GlobalTimeScript.tempature = 0
	
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
		GlobalTimeScript.tempature -= 1
		if GlobalTimeScript.weatherTrigger == true:
			GlobalTimeScript.currentWeather = "None"
			GlobalTimeScript.weatherTrigger = false
			print("it worked!!!")


func _on_settings_pressed() -> void:
	set_process(false)
	$WeatherCheck.stop()
	$WeatherTimer.stop()
	$MainMenu.show()
	


func _on_weather_check_timeout() -> void:
	$WeatherCheck.start(randi_range(10,15))
	if GlobalTimeScript.currentWeather == "None":
		if randi_range(20,100) < GlobalTimeScript.precipitation:
			if randi_range(1,80) > GlobalTimeScript.tempature:
				if randi_range(1,50) > GlobalTimeScript.tempature:
					#High precipitation, passed low temp check, passed really low temp check
					GlobalTimeScript.currentWeather = "Hail"
					print(GlobalTimeScript.currentWeather)
					rainChecker = 0
				else:
					#High precipitation, passed low temp check, failed really low temp check
					GlobalTimeScript.currentWeather = "Rain"
					print(GlobalTimeScript.currentWeather)
					rainChecker = 0
			else:
				#High precipitation, failed low temp check
				GlobalTimeScript.currentWeather = "Clouds"
				print(GlobalTimeScript.currentWeather)
				rainChecker = 0
		else:
			if randi_range(20,100) < GlobalTimeScript.tempature:
				#Low precipitation, passed high temp check
				GlobalTimeScript.currentWeather = "Wind"
				print(GlobalTimeScript.currentWeather)


func _on_play_button_pressed() -> void:
	set_process(true)
	$WeatherCheck.start($WeatherCheck.time_left)
	$MainMenu.hide()
	$MainMenu/CreditsBackround.hide()
	$MainMenu/CreditsText.hide()


func _on_credits_button_pressed() -> void:
	$MainMenu/CreditsBackround.show()
	$MainMenu/CreditsText.show()
