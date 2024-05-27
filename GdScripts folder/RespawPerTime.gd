extends Node

@onready var timer: Timer = $Timer

@export var respaw_obj : Node3D
@export var time_respaw = 10

var pos_respaw : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = time_respaw
	pos_respaw = respaw_obj.global_position

func respaw_Obt_func():
	respaw_obj.global_position = pos_respaw
	respaw_obj.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if respaw_obj.is_visible_in_tree():
		return
	
	if timer.is_stopped():
		timer.start()
