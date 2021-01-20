extends Control


# Declare member variables here. Examples:
var a
var last_a
signal number
# var b = "text"
var all_Textures=["","res://ASSETS/dice_01.png","res://ASSETS/dice_02.png","res://ASSETS/dice_03.png","res://ASSETS/dice_04.png","res://ASSETS/dice_05.png","res://ASSETS/dice_06.png"]
var i=0
var clicked=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	a=randi()%6+1
	while(a==last_a or a==0):
		randi()%6+1
	$Lado1.texture_normal=load(all_Textures[a])
	

func _on_Lado1_pressed():
	set_process(true)
	yield($Timer,"timeout")
	if(a==null):
		a=1
	$Lado1.texture_normal=load(all_Textures[a])
	emit_signal("number",a)
	set_process(false)
	


func _on_Timer_timeout():
	pass;
