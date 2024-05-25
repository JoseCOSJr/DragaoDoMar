extends Node

@export var objtRespaw: PackedScene
@export var posRespaw: Node3D

func respawObjt():
	var objtResp = objtRespaw.instantiate() as Node3D
	objtResp.global_position = posRespaw.global_position
	objtResp.global_rotation = posRespaw.global_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
