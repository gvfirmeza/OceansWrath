extends Node2D

@onready var player_name = get_node("/root/Principal/MenuScene")
@onready var camera = $GameScene/Camera2D
@onready var target = get_node("./GameScene/Player")

func _process(delta):
	camera.position = target.position

func mudar_cena(atual: Node2D, nova: Node2D):
	atual.visible = not atual.visible
	nova.visible = not nova.visible

	if nova.name == "GameScene":
		nova.get_node("./Camera2D").enabled = true
		get_node("GameScene").process_mode = Node.PROCESS_MODE_ALWAYS
	
	if nova.name == "PauseScene":
		get_node("./GameScene/Camera2D").enabled = false
		get_node("GameScene").process_mode = Node.PROCESS_MODE_DISABLED
		
	if nova.name == "MenuScene":
		get_node("GameScene").process_mode = Node.PROCESS_MODE_DISABLED
		get_tree().reload_current_scene()
		get_node("MenuScene").process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if %GameOverScreen.visible == true:
			var current_scene = get_tree().current_scene
			var sw_result: Dictionary = await SilentWolf.Scores.save_score(player_name.player_name, Global.coins).sw_save_score_complete
			print("Score persisted successfully: " + str(sw_result.score_id))
			get_tree().reload_current_scene()
