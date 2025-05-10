extends Node

# 1.5 inches for wheat 1.33 inches for pepper 1 inch for carrots 1.6 for corn

var cropInfoDictionary = {
	"Wheat": {
		"Value": 30.00,
		"PlantCost": 14.00,
		"CropGrowthIncrement": 40,
		"RainGood": true,
		"WeatherFrailty": {
			"Tornado": 50
			}
		},
	"Corn": {
		"Value": 16.00,
		"PlantCost": 11.00,
		"CropGrowthIncrement": 23,
		"RainGood": true,
		"WeatherFrailty": {
			"Tornado": 75
			}
		},
	"Carrots": {
		"Value": 60.00,
		"PlantCost": 20.00,
		"CropGrowthIncrement": 2,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 25
			}
		},
	"Pepper": {
		"Value": 39.00,
		"PlantCost": 22.00,
		"CropGrowthIncrement": 26.25,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 50
			}
		},
	"Wild Onions": {
		"Value": 5.00,
		"PlantCost": 4.00,
		"CropGrowthIncrement": 50,
		"RainGood": false,
		"WeatherFrailty": {
			"Tornado": 0
			}
		},
}
