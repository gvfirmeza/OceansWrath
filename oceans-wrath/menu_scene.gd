extends Node2D

var score = 6969
var player_name = "Loka"


func _on_play_button_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))
	$AudioStreamPlayer2D.stream_paused = true;

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_teste_pressed() -> void:
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(player_name, score).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))
	
	var sw_scores: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_scores.scores))
