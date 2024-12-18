extends Node2D

var player_name = "Guest"
@onready var line_edit: LineEdit = $InputNomePlayer
@onready var label_points: Label = $ItemList/LabelPoints

func _ready():
	line_edit.text_changed.connect(_on_LineEdit_text_changed)

func _on_LineEdit_text_changed(new_text: String) -> void:
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
	var lista = sw_scores.scores.size()
	
	while i < lista:
		label_points.text += str(i + 1,"º", " " , sw_scores.scores[i].player_name, " " ,sw_scores.scores[i].score, "\n")
		i += 1

func _on_button_fechar_leaderboard_pressed() -> void:
	%ItemList.visible = false


func _on_button_help_menu_pressed() -> void:
	if(%ListHelpMenu.visible == false):
		%ListHelpMenu.visible = true
	else:
		%ListHelpMenu.visible = false
