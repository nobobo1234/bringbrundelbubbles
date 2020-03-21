extends Area2D

func _on_body_entered(body: Node) -> void:
	body.speed.x = 0
	yield(get_tree().create_timer(.5), "timeout")
	body.set_physics_process(false)
	
