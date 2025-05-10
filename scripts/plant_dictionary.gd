extends Node

# 1.5 inches for wheat 1.33 inches for pepper 1 inch for carrots 1.6 for corn

var cropInfoDictionary = {
	"Wheat": {
		"Value": 30.00,
		"PlantCost": 14.00,
		"CropGrowthIncrement": 40,
		"WeatherFrailty": {
			"Tornado": 50,
			"Rain": 0.25
			},
		"UpgradePrices": {
			"Sell": 45,
			"Rain": 60,
			"Tornado": 70,
			"Cost": 50
			}
		},
	"Corn": {
		"Value": 16.00,
		"PlantCost": 11.00,
		"CropGrowthIncrement": 23,
		"WeatherFrailty": {
			"Tornado": 75,
			"Rain": 0.25
			},
		"UpgradePrices": {
			"Sell": 45,
			"Rain": 60,
			"Tornado": 70,
			"Cost": 50
			}
		},
	"Carrots": {
		"Value": 40.00,
		"PlantCost": 20.00,
		"CropGrowthIncrement": 40,
		"WeatherFrailty": {
			"Tornado": 25,
			"Rain": -0.25
			},
		"UpgradePrices": {
			"Sell": 45,
			"Rain": 60,
			"Tornado": 70,
			"Cost": 50
			}
		},
	"Pepper": {
		"Value": 39.00,
		"PlantCost": 22.00,
		"CropGrowthIncrement": 26.25,
		"WeatherFrailty": {
			"Tornado": 50,
			"Rain": -0.25
			},
		"UpgradePrices": {
			"Sell": 45,
			"Rain": 60,
			"Tornado": 70,
			"Cost": 50
			}
		},
	"Wild Onions": {
		"Value": 5.00,
		"PlantCost": 4.00,
		"CropGrowthIncrement": 75,
		"WeatherFrailty": {
			"Tornado": 0,
			"Rain": -0.25
			},
		"UpgradePrices": {
			"Sell": 45,
			"Rain": 60,
			"Tornado": 70,
			"Cost": 50
			}
		},
}
