extends Node2D

var playersOn = []
var sprites = [] #array com todas as sprites de cada legenda
onready var image = get_node("Image")
export var advance:bool = false
export var back:bool = false
export var passTurn:bool = false

var movement:int = 0

func _ready():
	if advance:
		setup("advance")
	if back:
		setup("back")
	if passTurn:
		setup("passTurn")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup(legendType:String):
	match legendType:
		"advance":
			movement = 3
			#image.set_texture = sprites[0]
		"back":
			movement = -5
			#image.set_texture = sprites[1]
		"passTurn":
			print("Chamar função de passar a vez")
			#image.set_texture = sprites[2]




func _on_Area2D_area_entered(area):
	playersOn.append(area)
	print(area.name)
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	pass # Replace with function body.
