extends Node2D

var has_barril = false

func _input(event):
	if event.is_action_pressed("menu"):
		get_parent().mudar_cena(self, get_parent().get_node("PauseScene"))

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

func spawn_barril():
	if has_barril == false: 
		var novo_inimigo = preload("res://barril_vida.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		novo_inimigo.global_position = %PathFollow2D.global_position
		add_child (novo_inimigo)
		has_barril = true;

func _on_player_health_depleted():
	%GameOverScreen.visible = true

func _on_timer_barco_timeout():
	spawn_barco()

func _on_timer_aguaviva_timeout():
	spawn_aguaviva()

func _on_timer_barril_vida_timeout() -> void:
	spawn_barril()

var c = 0
func _on_timer_coin_timeout() -> void:
	c += 10
	%coins_counter.text = str(c)
	Global.coins = c
