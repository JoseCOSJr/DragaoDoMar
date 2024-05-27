extends Node

@export var max_hp = 3
@export var node_move : Node3D
@export var sprite : Sprite3D
var hp_current
var invulnerable = false

func time_invulnerable():
	invulnerable = true
	$TimerBlink.start()
	await get_tree().create_timer(1).timeout
	$TimerBlink.stop()
	sprite.transparency = 0
	invulnerable = false

func make_sprite_Blink():
	sprite.transparency = 0.5
	await get_tree().create_timer(0.25).timeout
	sprite.transparency = 0

func add_hp(add, pushForce):
	if  add < 0:
		if invulnerable || hp_current == 0:
			return
		time_invulnerable()
	
	hp_current+=add
	if hp_current > max_hp:
		hp_current = max_hp
	elif hp_current <= 0:
		hp_current = 0
		node_move.set_can_move(false)
		get_parent().hide()
		var gmManager = get_tree().get_first_node_in_group("GameManager")
		gmManager.GameOver()
		
	var hud = get_tree().get_first_node_in_group("HUD")
	hud.att_lifes_inf(hp_current)
	knock_down(pushForce)

func knock_down(pushForce):
	node_move.set_can_move(false)
	node_move.velocity = pushForce
	await get_tree().create_timer(0.5).timeout
	node_move.set_can_move(true)

# Called when the node enters the scene tree for the first time.
func _ready():
	hp_current = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
