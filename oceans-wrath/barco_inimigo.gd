extends CharacterBody2D

var vida = 4
var player
var game

func _ready() -> void:
	player = get_node("/root/Principal/GameScene/Player")
	game = get_node("/root/Principal/GameScene")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100
	move_and_slide()
	look_at(player.global_position)

func levar_dano():
	indicador_dano()
	vida -= 1
	if vida <= 0:
		queue_free()
		game.c += 200

func indicador_dano():
	get_node("BarcoInimigo").modulate = Color(0.7, 0.7, 0.7, 0.7)
	var timer = get_tree().create_timer(0.1)
	await timer.timeout
	get_node("BarcoInimigo").modulate = Color(1, 1, 1, 0.678)
