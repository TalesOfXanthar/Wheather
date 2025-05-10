extends Node
var globalTimeDilation = 1
var cursorState = "Ground"
var playerMoney = 5000
var textBox = ""
var currentWeather = "None"
var weatherTrigger = false
var precipitation = 50
var tempature = 50
var cropLockPrice = 32

#func moneyCheck(price):
#	if playerMoney - price > PlantDictionary.cropInfoDictionary["Corn"]["PlantCost"]:
#		return true
#	else:
#		return false
