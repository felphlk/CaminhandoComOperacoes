extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sair_pressed():
	get_tree().quit()


func _on_Reiniciar_pressed():
	get_tree().reload_current_scene()


func _on_Mapa_fim(quantasContas):
	var i
	show()
	$player_01/Label.text=str(quantasContas[0])
	$player_02/Label.text=str(quantasContas[1])
	$player_03/Label.text=str(quantasContas[2])
	$player_04/Label.text=str(quantasContas[3])
