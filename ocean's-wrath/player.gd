extends Area2D

signal hit

@export var velocidade = 400

var screen_size

func _on_body_entered():
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("andar_cima"):
		velocity.y -= 1
	if Input.is_action_pressed("andar_baixo"):
		velocity.y += 1
	if Input.is_action_pressed("andar_direita"):
		velocity.x += 1
	if Input.is_action_pressed("andar_esquerda"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * velocidade
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "navegar"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "voar"
		$AnimatedSprite2D.flip_v = velocity.y > 0
	
