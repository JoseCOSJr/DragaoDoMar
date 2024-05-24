extends CharacterBody3D

const SPEED = 3.0

var direction = Vector3.FORWARD

@onready var animation_tree : AnimationTree = $AnimationTree

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left_move", "right_move", "up_move", "down_move")
	direction = (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	#if direction.length_squared() > 0:
		#look_at(global_position+direction)
		#global_rotation_degrees.x = 0
		#global_rotation_degrees.z = 0
	
	move_and_slide()
	update_animations()

func update_animations():
	var direction2D = Vector2(direction.x, direction.z)
	if abs(direction2D.y) > 0.25:
		direction2D.x = 0
	else :
		direction2D.y = 0
	
	direction2D = direction2D.normalized()
	
	if direction2D.length_squared() > 0:
		animation_tree["parameters/Idle/blend_position"] = direction2D
		animation_tree["parameters/Move/blend_position"] = direction2D
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		return
	
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/is_moving"] = false
