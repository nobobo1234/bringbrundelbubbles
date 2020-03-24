extends Actor
# Script that controls the enemy, the Fanta

var dying = false

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x
	
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_Bullet_detector_area_entered(area: Area2D) -> void:
	if area.is_in_group("mentos") && !area.broken:
		dying = true
		set_physics_process(false)
		yield(area.get_node("AnimatedSprite"), "animation_finished")
		queue_free()
