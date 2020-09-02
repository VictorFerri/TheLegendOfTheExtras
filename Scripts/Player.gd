extends KinematicBody2D

const gravity = 10
const aceleration = 7
const max_velocity = 70
const jump = -200

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + aceleration, max_velocity)
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x -aceleration, -max_velocity)
		$AnimatedSprite.flip_h = true
	else:
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_jump"):
			motion.y = jump
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
		
	motion = move_and_slide(motion, Vector2(0,-1))
	
