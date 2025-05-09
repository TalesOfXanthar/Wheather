extends Node

# 1.5 inches for wheat 1.33 inches for pepper 1 inch for carrots 1.6 for corn

var cropInfoDictionary = {
	"Wheat": {
		"Value": 30.00,
		"PlantCost": 13.99,
		"CropGrowthIncrement": 40,
		"RainGood": true,
		"WeatherFrailty": {
			"Tornado": 50
			}
		},
	"Corn": {
		"Value": 16.00,
		"PlantCost": 10.99,
		"CropGrowthIncrement": 23,
		"RainGood": true,
		"WeatherFrailty": {
			"Tornado": 75
			}
		},
	"Carrots": {
		"Value": 60,
		"PlantCost": 20,
		"CropGrowthIncrement": 2,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 25
			}
		},
	"Pepper": {
		"Value": 39.00,
		"PlantCost": 21.99,
		"CropGrowthIncrement": 26.25,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 25
			}
		},
}
