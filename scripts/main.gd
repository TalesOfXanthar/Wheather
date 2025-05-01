extends Node2D

func _process(delta):
	GlobalTimeScript.playerMoney = snapped(GlobalTimeScript.playerMoney, 0.01)
