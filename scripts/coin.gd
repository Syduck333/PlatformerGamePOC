extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("u got coin")
	queue_free()
