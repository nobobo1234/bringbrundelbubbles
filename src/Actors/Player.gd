extends Actor
# Script that controlsa the player

const MENTOS = preload("res://src/Objects/Mentos.tscn")
const IS_PLAYER = true # For preventing mentos of breaking inside player

var flip = 1.0 

onready var animated_sprite: = $AnimatedSprite

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("up") and _velocity.y < 0.0
	var direction: = get_direction()
	change_sprites(direction)
	
	if Input.is_action_just_pressed("shoot"):
		shoot_fireball(direction)
	
	# change_sprites(direction)
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		-1.0 if Input.is_action_just_pressed("up") and is_on_floor() else 0.0
	)

func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func change_sprites(direction: Vector2) -> void:
	if direction.x == 1.0:
		animated_sprite.set_flip_h(false)
		flip = 1.0
	elif direction.x == -1.0:
		animated_sprite.set_flip_h(true)
		flip = -1.0
	
	if direction.x == 0.0:
		animated_sprite.play("idling")
	else:
		animated_sprite.play("walking")
		
func shoot_fireball(direction: Vector2) -> void:
	var mentos = MENTOS.instance()
	mentos.add_to_group("mentos")
	get_parent().add_child(mentos)
	if direction.x != 0:
		mentos.direction = direction
	else:
		mentos.direction = Vector2(flip, 0)
	mentos.position = $Position2D.global_position


func _on_EnemyDetector_body_entered(body: KinematicBody2D) -> void:
	if body.is_in_group("fanta") && !body.get("dying"):
		ScoreData.reset()
		queue_free()

