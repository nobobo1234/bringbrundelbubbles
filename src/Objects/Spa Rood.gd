extends Area2D

func _on_body_entered(body: Node) -> void:
	ScoreData.bottles += 1
	queue_free()
