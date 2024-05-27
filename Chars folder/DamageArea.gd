extends Area3D

@export var damage = 1
@export var pushForce = 0
@export var oppositeForce = false
@export var trasnformBase: Node3D
@export var sfx_damage: AudioStream
@export var vfx_hit: PackedScene

signal damage_taked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func TryDamage(body: Node3D):
	if !body.has_node("Hp") || !is_visible_in_tree():
		return
	
	var hpNode = body.find_child("Hp")
	var pushForceNow = -trasnformBase.global_transform.basis.z*pushForce
	if oppositeForce:
		var deltaDist = body.global_transform.origin - global_transform.origin
		deltaDist.y = 0
		pushForceNow = deltaDist.normalized()*pushForce
	var is_apply = hpNode.add_hp(-damage, pushForceNow)
	
	
	if is_apply:
		damage_taked.emit()
		
		if vfx_hit != null:
			var vfx_aux = vfx_hit.instantiate()
			body.add_child(vfx_aux)
			vfx_aux.global_transform  = body.global_transform
			vfx_aux.global_position = body.global_position
			vfx_aux.global_rotation = body.global_rotation


		
		if sfx_damage == null:
			return
		
		var audioManager = get_tree().get_first_node_in_group("Sound Manager")
		audioManager.respaw_SFX(sfx_damage, body.global_position)
