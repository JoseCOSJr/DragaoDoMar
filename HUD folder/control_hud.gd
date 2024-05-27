extends Control

@export var lifes_obj_array: Array[Control]
@export var money_text_label: RichTextLabel

func  att_lifes_inf(hpNow):
	for x in lifes_obj_array.size():
		if x+1 > hpNow:
			lifes_obj_array[x].hide()
		else :
			lifes_obj_array[x].show()

func  att_money_inf(moneyNow):
	money_text_label.text = "[center]"+ str(moneyNow) +" $[/center]"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
