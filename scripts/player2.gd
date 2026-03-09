extends CharacterBody2D




const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var is_attacking = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var kick_area : Area2D = $KickArea

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("playertwoattack"):
		is_attacking = true
		animated_sprite.play("Attack_Kick")
		var areas = kick_area.get_overlapping_bodies()
		print(areas.size())
		for area in areas:
			if area is Slime:
				area.kill()
	
	# Handle jump.
	if Input.is_action_just_pressed("playertwojump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	var lastAnimDirection: String = "Forward"
	var direction = Input.get_axis("playertwoleft", "playertworight")
	
	
	#flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
			if direction == 0 and not is_attacking:
				animated_sprite.play("Idle")
			elif not is_attacking:
				animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")

	#play anims


	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _animation_finished() -> void:
	is_attacking = false
	animated_sprite.play("Idle")
