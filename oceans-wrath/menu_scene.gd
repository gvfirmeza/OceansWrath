extends Node2D

func _on_play_button_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))
	$AudioStreamPlayer2D.stream_paused = true;

func _on_exit_button_pressed() -> void:
	get_tree().quit()
