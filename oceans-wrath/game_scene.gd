extends Node2D

func spawn_mob():
	var novo_inimigo = preload("res://barco_inimigo.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	novo_inimigo.global_position = %PathFollow2D.global_position
	add_child (novo_inimigo)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOverScreen.visible = true
	#get_tree().paused = true
