extends Node2D

@export var tornado_scene: PackedScene
var initiated = false

func _process(delta: float):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
	
	if str(GlobalTimeScript.playerMoney)[-3] == ".":
		$Money.text = "$" + str(GlobalTimeScript.playerMoney)
	else:
		$Money.text = "$" + str(GlobalTimeScript.playerMoney) + "0"
	
	# print(PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"])
	
	if GlobalTimeScript.currentWeather == "Wind" && !initiated:
		print("yeah cool")
		initiated = true
		$WeatherTimer.start(randi_range(5,10))
	
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
		if GlobalTimeScript.weatherTrigger == true:
			GlobalTimeScript.currentWeather = "None"
			GlobalTimeScript.weatherTrigger = false
