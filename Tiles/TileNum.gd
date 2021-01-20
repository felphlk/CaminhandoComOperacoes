extends Sprite

var number1=2
var number2=2
var operation='x'
var answer=number1+number2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass






func _on_Area2D_mouse_entered():
	print(answer)
