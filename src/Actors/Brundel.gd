extends Area2D
# Script that controls the Brundel character at the end

func _on_body_entered(body: KinematicBody2D) -> void:
	# Stop the player from moving and stop input from keyboard 
	body.speed.x = 0
	yield(get_tree().create_timer(.5), "timeout")
	body.set_physics_process(false)
	body.animated_sprite.play("idling")
	
