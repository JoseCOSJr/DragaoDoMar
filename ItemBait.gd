extends Area3D

signal signal_get_item
var player_can_get = false

@export var its_respaw_item = false
@export var sfx_get: AudioStream
@export var sfx_bait: AudioStream

func collider_enter(body: Node3D):
	if !is_visible_in_tree():
		return
	
	if body.has_node("Inventory") && player_can_get:
		var inventory = body.find_child("Inventory")
		inventory.add_item_drop(1)
		signal_get_item.emit()
		
		var audioManager = get_tree().get_first_node_in_group("Sound Manager")
		audioManager.respaw_SFX(sfx_get, body.global_position)
		return
	
	if !body.has_method("get_bait_item") || !body.can_move:
		return
	
	var audioManager = get_tree().get_first_node_in_group("Sound Manager")
	audioManager.respaw_SFX(sfx_bait, body.global_position)
	body.get_bait_item()
	signal_get_item.emit()

func delay_player_can_get_item():
	await get_tree().create_timer(3).timeout
	player_can_get = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if its_respaw_item:
		player_can_get = true
		$Timer.stop()
		$"Disable func".only_hide = true
		return
	
	delay_player_can_get_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
