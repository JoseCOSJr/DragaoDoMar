extends Node3D

@onready var path_follow: PathFollow3D = $PathFollow3D

@export var time_making_path = 10.0
var countTime = 0.0

@export var random_start = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if random_start:
		countTime = randf()*time_making_path


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countTime += delta
	if countTime > time_making_path:
		countTime-=time_making_path
	
	path_follow.progress_ratio = countTime/ time_making_path
