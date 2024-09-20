extends Node2D

func mudar_cena(atual: Node2D, nova: Node2D):
	atual.queue_free()
	nova.visible = true
	
	if nova.name == "GameScene":
		nova.get_node("Player/Camera2D").enabled = true
