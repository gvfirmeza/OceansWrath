extends Node2D

var player_name = "Jurf"
@onready var line_edit: LineEdit = $InputNomePlayer
@onready var label: Label = $LabelNomePlayer

func _ready():
	line_edit. text_submitted . connect (_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(new_text: String) -> void:
	label.text = "Your name is: " + new_text
	player_name = new_text

func _on_play_button_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))
	$AudioStreamPlayer2D.stream_paused = true;

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_teste_pressed() -> void:
	var sw_scores: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_scores.scores))
