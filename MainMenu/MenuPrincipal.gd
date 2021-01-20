extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal numberPlayers
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Iniciar_pressed():
	$Iniciar.hide()
	$"2Player".show()
	$"3Player".show()
	$"4Player".show()
	


func hideAll():
	hide()
func _on_2Player_pressed():
	emit_signal("numberPlayers",2)
	hideAll()


func _on_3Player_pressed():
	emit_signal("numberPlayers",3)
	hideAll()

func _on_4Player_pressed():
	emit_signal("numberPlayers",4)
	hideAll()
