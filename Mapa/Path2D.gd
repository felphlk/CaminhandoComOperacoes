extends Path2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var follow= get_node("PathFollow2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#follow.set_offset(follow.get_offset()+120*delta)
	pass
