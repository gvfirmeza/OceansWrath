extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game over")
	await $MessageTimer.timeout
	
	$Message.text = "Vamos navegar!"
	$Message.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)



func _on_start_button():
	$StartButton.connect("pressed", _on_start_game)
	
func _on_start_game():
	var carrega = ResourceLoader.load("res://jogo.tscn")
	if carrega:
		var cena_jogo = carrega.instantiate()
		get_tree().root.add_child(cena_jogo)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = cena_jogo

func _on_message_timer_timeout():
	$Message.hide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass
