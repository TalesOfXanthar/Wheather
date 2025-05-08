extends Node2D

@export var tornado_scene: PackedScene

func _process(delta: float):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
	# print(PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"])
	if randi_range(0, 100) == 100:
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
		
		$MenuMoneyBackround/Cash.text = str(GlobalTimeScript.playerMoney)
