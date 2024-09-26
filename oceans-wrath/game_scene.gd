extends Node2D

func spawn_barco():
	var novo_inimigo = preload("res://barco_inimigo.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	novo_inimigo.global_position = %PathFollow2D.global_position
	add_child (novo_inimigo)

func spawn_aguaviva():
	var novo_inimigo = preload("res://agua_viva.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	novo_inimigo.global_position = %PathFollow2D.global_position
	add_child (novo_inimigo)

func _on_player_health_depleted():
	%GameOverScreen.visible = true

func _on_timer_barco_timeout():
	spawn_barco()

func _on_timer_aguaviva_timeout():
	spawn_aguaviva()
