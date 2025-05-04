extends Node2D

func _process(delta: float):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
	print(PlantDictionary["cropInfoDictionary"]["Wheat"]["Value"])
