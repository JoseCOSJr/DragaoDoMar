extends Node

var money = 0
@export var sfx_add_money: AudioStream
@export var start_item_drop = 3
var amount_item_drop = 0

func add_item_drop(amount):
	amount_item_drop+=amount
	var hud = get_tree().get_first_node_in_group("HUD")
	hud.att_money_inf(money)
	
	if amount_item_drop > 3:
		amount_item_drop = 3
	elif amount_item_drop < 0:
		amount_item_drop = 0
	
	hud.att_item_drop_inf(amount_item_drop)

func add_money(amount):
	money+=amount
	var hud = get_tree().get_first_node_in_group("HUD")
	hud.att_money_inf(money)
	
	if(amount > 0):
		var audioManager = get_tree().get_first_node_in_group("Sound Manager")
		audioManager.respaw_SFX(sfx_add_money, get_parent().global_position)
	
	if money >= 1000:
		var gmManager = get_tree().get_first_node_in_group("GameManager")
		gmManager.Win()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_money(0)
	add_item_drop(start_item_drop)
	amount_item_drop


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
