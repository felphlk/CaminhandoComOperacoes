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


func _on_Mapa_fim(teste):
	$Fim.show()
	$Fim/player_01/Label.text=str(teste[0])
	$Fim/player_02/Label.text=str(teste[1])
	$Fim/player_03/Label.text=str(teste[2])
	$Fim/player_04/Label.text=str(teste[3])
	$Fim/TextoFim.text="O jogador que ganhou foi:"+str(teste.max())
