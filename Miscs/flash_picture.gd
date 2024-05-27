extends Area3D

@export var angRange = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func obtEnter(body: Node3D):
	if !body.has_method("add_money_for_picture"):
		return
	
	var deltaDist = body.global_transform.origin - global_transform.origin
	var angY = deltaDist.signed_angle_to(-global_transform.basis.z, Vector3.UP)
	angY = rad_to_deg(angY)
	#print(angY)
	if abs(angY*2) > angRange:
		return
	
	body.add_money_for_picture()
