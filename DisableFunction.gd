extends Node

@export var objtDisable: Node3D
@export var only_hide = false

func disable_objt():
	if only_hide:
		objtDisable.hide()
		objtDisable.set_physics_process(false)
	else:
		objtDisable.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
