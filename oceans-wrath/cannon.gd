extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		if target_enemy.name != "BarrilVida" and target_enemy.name != "EvolucaoArma":
			look_at(target_enemy.global_position)

func shoot():
	const BALA = preload("res://tiro.tscn")
	var bala_nova = BALA.instantiate()
	bala_nova.global_position = %ShootingPoint.global_position
	bala_nova.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bala_nova)

func _on_timer_timeout() -> void:
	shoot()
