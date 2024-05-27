extends AnimationPlayer

@export var animationPlay: String

# Called when the node enters the scene tree for the first time.
func _ready():
	play(animationPlay)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
