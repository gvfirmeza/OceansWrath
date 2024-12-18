extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 1.5
@export var mouse_mov = false

signal health_depleted
signal add_arma
var health = 100.0
var rotation_direction = 0
var is_dead = false

func adicionar_canhao():
	var conhao = preload("res://cannon.tscn")
	var novo_conhao = conhao.instantiate()
	add_child(novo_conhao)

func _ready():
	$Sprite2D/AnimationPlayer.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _process(delta: float) -> void:
	%ProgressBar.value = health

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
	if health >= 0.0:
		move_and_slide()
		$Sprite2D/IdlePlayer.play("idle")
	
	const DAMAGE_RATE = 15.0
	var overlapping_mobs = %HitBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		for i in overlapping_mobs:
			if i.name == "BarrilVida":
				get_parent().has_barril = false
				i.queue_free()
				if health >= 85:
					health = 100;
				else:
					health += 15;
			if i.name == "EvolucaoArma":
				get_parent().has_evolucaoArma = false
				adicionar_canhao()
				add_arma.emit()
				i.queue_free()
			else:
				health -= DAMAGE_RATE * overlapping_mobs.size() * delta
				%ProgressBar.value = health
		
	if health <= 0.0 and not is_dead:
		$Sprite2D/IdlePlayer.stop(true)
		$Sprite2D/AnimationPlayer.play("death")
		$AudioStreamPlayer2D.play()
		is_dead = true

func _on_animation_finished(anim_name):
	if anim_name == "death":
		health_depleted.emit()
		%TimerCoin.stop()
