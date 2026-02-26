extends Area2D





@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	print("u got coin")
	
	animation_player.play("pickup")
	
	
	
	
	
