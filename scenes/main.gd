extends Node2D
@export var crop_scene: PackedScene


func _on_button_pressed() -> void:
	var crop = crop_scene.instantiate()
