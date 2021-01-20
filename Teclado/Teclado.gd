extends Control

export (PackedScene) var Tecla
# Declare member variables here. Examples:
signal confirma
var textures=["res://ASSETS/keyButton_0.png","res://ASSETS/keyButton_1.png",
"res://ASSETS/keyButton_2.png",
"res://ASSETS/keyButton_3.png","res://ASSETS/keyButton_4.png","res://ASSETS/keyButton_5.png","res://ASSETS/keyButton_6.png",
"res://ASSETS/keyButton_7.png","res://ASSETS/keyButton_8.png","res://ASSETS/keyButton_9.png"]
var texturesPressed=["res://ASSETS/keyButton_overlay0.png","res://ASSETS/keyButton_overlay1.png",
"res://ASSETS/keyButton_overlay2.png",
"res://ASSETS/keyButton_overlay3.png","res://ASSETS/keyButton_overlay4.png","res://ASSETS/keyButton_overlay5.png",
"res://ASSETS/keyButton_overlay6.png","res://ASSETS/keyButton_overlay7.png","res://ASSETS/keyButton_overlay8.png","res://ASSETS/keyButton_overlay9.png"]
var cor1
var cor2
var j=0
var nod=[]
var picked=[]
var selecionado=0
var quem=1
var can_click=1
var valor
var num1
var num2
var sinal
# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(0,10):
			var f=Tecla.instance()
			$GridContainer.add_child(f)
			nod.append(f)
			f.get_node("TextureButton").texture_normal=load(textures[j])
			f.get_node("TextureButton").texture_pressed=load(texturesPressed[j])
			f.numero=j
			f.connect("clicou",self,"click")
func click(user):
	if(($Resposta.get_text()).length()<=2):
		$Resposta.text+=str(user.numero)
func _on_Clear_pressed():
	$Resposta.text=""
func _on_Confirmar_pressed():
	num1 = int($Num1.text)
	num2 = int($Num2.text)
	sinal = $X.text
	var resposta=int($Resposta.text)
	var valor
	if (sinal == "+"):
		valor=num1+num2
	if (sinal == "-"):
		valor=num1-num2
	if (sinal == "*"):
		valor=num1*num2
	if (sinal == "/"):
		valor=num1/num2
	emit_signal("confirma", num1, sinal, num2, valor,resposta)
	
	resetText()

func resetText():
	$Resposta.text=""
	$Num1.text=""
	$Num2.text=""
#func _input(ev):
#	if Input.is_key_pressed(KEY_0):
#		click(nod[0])
#	if Input.is_key_pressed(KEY_1):
#		click(nod[1])
#	if Input.is_key_pressed(KEY_2):
#		click(nod[2])
#	if Input.is_key_pressed(KEY_3):
#		click(nod[3])
#	if Input.is_key_pressed(KEY_4):
#		click(nod[4])
#	if Input.is_key_pressed(KEY_5):
#		click(nod[5])
#	if Input.is_key_pressed(KEY_6):
#		click(nod[6])
#	if Input.is_key_pressed(KEY_7):
#		click(nod[7])
#	if Input.is_key_pressed(KEY_8):
#		click(nod[8])
#	if Input.is_key_pressed(KEY_9):
#		click(nod[9])
func _process(delta):
#	if(Input.is_key_pressed(KEY_ENTER)):
#		_on_Confirmar_pressed()
#	if(Input.is_key_pressed(KEY_BACKSPACE)):
#		_on_Clear_pressed()
	pass


func _on_Mapa_clear():
	$Resposta.text=""
