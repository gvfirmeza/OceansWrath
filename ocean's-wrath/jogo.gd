extends Node2D

var ReadyCompleted = false

var UpperLeftX = 0.0
var UpperLeftY = 0.0
var LowerRightX = 0.0
var LowerRightY = 0.0
var SpriteWidth = 0.0
var SpriteHeight = 0.0

var NewXPosition = 0.0
var NewYPosition = 0.0
var Character: Node2D
var CharacterVelocity = Vector2()
var CharacterPosition = Vector2()

@export var WarpWaitForPhysics = true

func Initialize():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var borda_mapa = $borda_mapa
	print("Sprite position: ", borda_mapa.global_position)
	print("Sprite X size: ", borda_mapa.texture.get_width())
	print("Sprite Y size: ", borda_mapa.texture.get_width())
	
	ReadyCompleted = true
	Initialize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
