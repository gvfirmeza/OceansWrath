extends Node2D

var has_barril = false
var has_evolucaoArma = false
var armas = 0

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
		%PathEvolucaoArma2D.progress_ratio = randf()
		novo_inimigo.global_position = %PathEvolucaoArma2D.global_position
		add_child (novo_inimigo)
		has_barril = true;

func spawn_evolucaoArma():
	if has_evolucaoArma == false:
		var novo_inimigo = preload("res://evolucao_arma.tscn").instantiate()
		%PathEvolucaoArma2D.progress_ratio = randf()
		novo_inimigo.global_position = %PathEvolucaoArma2D.global_position
		add_child (novo_inimigo)
		has_evolucaoArma = true;

func _on_player_health_depleted():
	%GameOverScreen.visible = true

func _on_timer_barco_timeout():
	spawn_barco()


func _on_timer_aguaviva_timeout():
	spawn_aguaviva()

func _on_timer_barril_vida_timeout() -> void:
	spawn_barril()

func _on_timer_evolucao_arma_timeout() -> void:
	if armas < 10:
		spawn_evolucaoArma()

func _on_player_add_arma() -> void:
	armas = armas + 1
	print(armas)

func _on_timer_decreaser_timer_timeout() -> void:
	if $TimerAguaviva.wait_time > 0.3:
		$TimerAguaviva.wait_time = $TimerAguaviva.wait_time - 0.1
		print($TimerAguaviva.wait_time)
	if $TimerBarco.wait_time > 0.4:
		$TimerBarco.wait_time = $TimerBarco.wait_time - 0.05

var c = 0
func _on_timer_coin_timeout() -> void:
	c += 10
	%coins_counter.text = str(c)
	Global.coins = c
