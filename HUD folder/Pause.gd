extends Control

var delay_can_despause = false

func start_delay():
	delay_can_despause = true
	await get_tree().create_timer(0.1).timeout
	delay_can_despause = false

func pause():
	if delay_can_despause:
		return
	
	show()
	get_tree().paused = true
	start_delay()

func  despaused():
	if delay_can_despause:
		return
	
	hide()
	get_tree().paused = false
	start_delay()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("start"):
		despaused()
