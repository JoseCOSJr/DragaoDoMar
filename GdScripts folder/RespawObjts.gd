extends Node3D

@export var posRespaw: Node3D
@export var parent_resp: Node3D
signal respaw_signal

func respawObjt(objtRespaw):
	var objtResp = objtRespaw.instantiate()
	objtResp.global_transform  = global_transform
	objtResp.position = posRespaw.global_position
	objtResp.rotation = posRespaw.global_rotation
	# Deletar depois que fazer o pool obejct
	parent_resp.get_parent().add_child(objtResp)
	respaw_signal.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
