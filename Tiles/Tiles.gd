extends Node2D

signal numeros
var conta=[2,'+',2]
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Area2D_area_entered(area):
	emit_signal("numeros",conta)


