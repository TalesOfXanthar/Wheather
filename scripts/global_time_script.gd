extends Node
var globalTimeDilation = 1
var cursorState = "Ground"
var playerMoney = 50
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

func valueFormatter(valueString):
	var formattedPrice = ""
	var finalFormat = ""
	var mod = valueString.length() % 3
	for i in range(0, valueString.length()):
		if i != 0 && i % 3 == mod:
			formattedPrice += "."
		formattedPrice += valueString[i]
	if valueString.length() > 9:
		finalFormat = "$" + formattedPrice[0] + formattedPrice[1]
		if formattedPrice[2] != ".":
			finalFormat += formattedPrice[2]
		finalFormat += "m"
	elif valueString.length() > 6:
		finalFormat = "$" + formattedPrice[0] + formattedPrice[1]
		if formattedPrice[2] != ".":
			finalFormat += formattedPrice[2]
		finalFormat += "k"
	else:
		finalFormat = "$" + valueString
	return finalFormat
