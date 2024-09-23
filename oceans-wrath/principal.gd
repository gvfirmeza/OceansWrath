extends Node2D

@onready var camera = $GameScene/Camera2D
@onready var target = get_node("./GameScene/Player")

func _process(delta):
	camera.position = target.position

func mudar_cena(atual: Node2D, nova: Node2D):
	atual.queue_free()
	nova.visible = true
	
	if nova.name == "GameScene":
		nova.get_node("./Camera2D").enabled = true

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if %GameOverScreen.visible == true:
			var current_scene = get_tree().current_scene
			get_tree().reload_current_scene()
