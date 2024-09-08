extends Node2D

func mudar_cena(atual: Node2D, nova: Node2D):
	atual.visible = false
	nova.visible = true
	
	# Ativar a câmera apenas quando a cena for GameScene
	if nova.name == "GameScene":
		$GameScene/CharacterBody2D/Camera2D.enabled = true
