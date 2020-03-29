extends Area2D
# Script that makes the mentos bullet work

export var speed: = 350

var direction: = Vector2(1, 0)
var velocity: = Vector2(0, 0)
var broken: = false

onready var animated_sprite: = $AnimatedSprite

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	velocity.x = direction.x * speed * delta
	translate(velocity)

func _on_body_entered(body: Node) -> void:
	if body.get("IS_PLAYER"):
		return
	direction = Vector2(0, 0)
	animated_sprite.play("break")
	yield(animated_sprite, "animation_finished")
	queue_free()

