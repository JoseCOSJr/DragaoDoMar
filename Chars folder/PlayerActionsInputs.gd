extends Node

@export var flashPictureObjt : PackedScene
@export var respawNodeFunc : Node3D

var cooldownAction = 0
var can_action = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_cooldown():
	cooldownAction = 0.5

func set_can_action(can):
	can_action = can

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldownAction > 0:
		cooldownAction -= delta
		return
	
	if !can_action:
		return
	
	if Input.is_action_just_pressed("take_picture") :
		respawNodeFunc.respawObjt(flashPictureObjt)
		return
	
	if Input.is_action_just_pressed("throw_item") :
		var respawItem = respawNodeFunc.get_script()
		# respawItem.respawObjt()
		return
