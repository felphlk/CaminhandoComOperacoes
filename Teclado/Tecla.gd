extends Control

# Declare member variables here. Examples:
# var a = 2
signal clicou
var numero=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	print("oi")
	emit_signal("clicou",self)
	
	
