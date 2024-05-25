extends Camera3D

const  offsetCam = Vector3(0,10,5)
@onready var targetFollow = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_target(newTarget):
	print(newTarget)
	targetFollow = newTarget

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if targetFollow == null:
		return
	
	var posGo = targetFollow.global_position + offsetCam
	position = posGo

