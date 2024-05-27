extends Node

var money = 0

func add_money(amount):
	money+=amount
	var hud = get_tree().get_first_node_in_group("HUD")
	hud.att_money_inf(money)
	if money > 300:
		var gmManager = get_tree().get_first_node_in_group("GameManager")
		gmManager.Win()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_money(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
