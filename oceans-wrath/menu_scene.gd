extends Node2D

var player_name = "Jurf"
@onready var line_edit: LineEdit = $InputNomePlayer
@onready var label_name: Label = $LabelNomePlayer
@onready var label_points: Label = $ItemList/LabelPoints

func _ready():
	line_edit. text_submitted . connect (_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(new_text: String) -> void:
	label_name.text = "Your name is: " + new_text
	player_name = new_text

func _on_play_button_pressed() -> void:
	get_parent().mudar_cena(self, get_parent().get_node("GameScene"))
	$AudioStreamPlayer2D.stream_paused = true;

func _on_exit_button_pressed() -> void:
	get_tree().quit()

var i = 0
func _on_teste_pressed() -> void:
	%ItemList.visible = true
	var sw_scores: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print(str(sw_scores.scores))
	
	while i < 10:
		label_points.text += str(sw_scores.scores[i].score, " - ", sw_scores.scores[i].player_name, "\n")
		i += 1

func _on_button_fechar_leaderboard_pressed() -> void:
	%ItemList.visible = false
