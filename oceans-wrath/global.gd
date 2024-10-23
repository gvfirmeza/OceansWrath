extends Node

var coins := 0
var old_coins := 0

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "DORbSnCKsgaRaPQOf5qKL6IQv1giTYP98X4WtfHt",
		"game_id": "oceanswrath",
		"log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/Principal.tscn"
	})
