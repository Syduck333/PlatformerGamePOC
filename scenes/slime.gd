extends CharacterBody2D
class_name Slime

const SPEED = 60

var direction = 1


@onready var ray_cast_right: RayCast2D = $"RayCast right"
@onready var ray_cast_left: RayCast2D = $"RayCast left"
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta
	

func kill():
	animated_sprite.play("Death")
	
	 
	
func after_death():
	queue_free()
