extends Node2D

func _on_button_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))
