extends CharacterBody3D

const MAX_PICTURES_TAKEN = 10

@export var speed = 3.0
@export var money_per_picture = 10
@export var vision_range = 10
var pictures_taked = 0

@onready var navigation_agent = $NavigationAgent
@onready var animation_tree : AnimationTree = $AnimationTree

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var player = get_tree().get_first_node_in_group("Player") as CharacterBody3D
	var currentLocation = global_transform.origin
	var deltaDist = player.global_transform.origin-currentLocation
	if deltaDist.length() > vision_range:
		velocity = Vector3(0, velocity.y, 0) 
		return
		
	navigation_agent.set_target_position(player.global_transform.origin)
	var nextLocation = navigation_agent.get_next_path_position()
	var new_velocity = (nextLocation-currentLocation).normalized()*speed
	new_velocity.y = velocity.y
	velocity = new_velocity
	move_and_slide()
	updateAnima()

func updateAnima():
	var direction2D = Vector2(velocity.x, -velocity.z)
	
	if abs(direction2D.y) > 0.5:
		direction2D.x = 0
	else :
		direction2D.y = 0
	direction2D = direction2D.normalized()
	
	if direction2D.length_squared() == 0:
		return
	
	animation_tree["parameters/Dragon_Move/blend_position"] = direction2D

func add_money_for_picture():
	if pictures_taked >= MAX_PICTURES_TAKEN:
		return
	
	var player = get_tree().get_first_node_in_group("Player")
	var inv = player.find_child("PlayerInventory")
	inv.add_money(money_per_picture)
	pictures_taked += 1
