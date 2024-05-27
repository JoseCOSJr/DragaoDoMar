extends Area3D

@export var damage = 1
@export var pushForce = 0
@export var oppositeForce = false
@export var trasnformBase: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func TryDamage(body: Node3D):
	if !body.has_node("Hp"):
		return
	
	var hpNode = body.find_child("Hp")
	var pushForceNow = -trasnformBase.global_transform.basis.z*pushForce
	if oppositeForce:
		var deltaDist = body.global_transform.origin - global_transform.origin
		deltaDist.y = 0
		pushForceNow = deltaDist.normalized()*pushForce
	hpNode.add_hp(-damage, pushForceNow)
