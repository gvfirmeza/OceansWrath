extends CharacterBody2D

var vida = 1
var player
var game

func _ready() -> void:
	player = get_node("/root/Principal/GameScene/Player")
	game = get_node("/root/Principal/GameScene")
	$Aguaviva/AnimationPlayer.play("agua_viva_idle")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 70
	move_and_slide()
	look_at(player.global_position)

func levar_dano():
	vida -= 1
	if vida <= 0:
		queue_free()
		game.c += 50
