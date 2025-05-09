extends Node

# 1.5 inches for wheat 1.33 inches for pepper 1 inch for carrots 1.6 for corn

var cropInfoDictionary = {
	"Wheat": {
		"Value": 50.00,
		"PlantCost": 12.99,
		"CropGrowthIncrement": 40,
		"RainGood": true,
		"WeatherFrailty": {
			"Tornado": 50
			}
		},
	"Corn": {
		"Value": 25.00,
		"PlantCost": 7.69,
		"CropGrowthIncrement": 20,
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
		"Value": 49.00,
		"PlantCost": 19.99,
		"CropGrowthIncrement": 26.25,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 25
			}
		},
}
