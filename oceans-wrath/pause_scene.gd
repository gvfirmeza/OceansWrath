extends Node2D

func _on_button_resume_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))

func _on_button_menu_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("MenuScene"))

func _on_button_quit_pressed() -> void:
	get_tree().quit()
