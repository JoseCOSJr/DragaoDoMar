extends Node

@export var base_emit_sound: PackedScene

func respaw_SFX(clip:AudioStream, posResp: Vector3):
	var sfxObj = base_emit_sound.instantiate() as AudioStreamPlayer3D
	sfxObj.global_transform = $Node3D.global_transform
	$Node3D.add_child(sfxObj)
	sfxObj.global_position = posResp
	sfxObj.stream = clip
	sfxObj.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
