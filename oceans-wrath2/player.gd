extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 1.5
@export var mouse_mov = false

signal health_depleted
var health = 100.0
var rotation_direction = 0

func get_input():
	if(mouse_mov):
		look_at(get_global_mouse_position())
		velocity = transform.x * Input.get_axis("down", "up") * speed
	else:
		rotation_direction = Input.get_axis("ui_left", "ui_right")
		velocity = transform.x * Input.get_axis("down", "up") * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	const DAMAGE_RATE = 15.0
	var overlapping_mobs = %HitBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		print(delta)
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
