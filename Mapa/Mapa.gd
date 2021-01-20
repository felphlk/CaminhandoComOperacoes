extends Node2D

export(PackedScene) var fim
export (PackedScene) var player
export (PackedScene) var tile
export (PackedScene) var tileConta
signal fim
signal clear
var numPlay=2
var startPos=Vector2(12,4)
var playersSprite=["res://ASSETS/player_01.png","res://ASSETS/player_02.png","res://ASSETS/player_03.png","res://ASSETS/player_04.png"]
var positione=[Vector2(-14,-14),Vector2(14,-14),Vector2(-14,14),Vector2(14,14)]
var player_array=[]
var cor_player=["ff6c78","68b6ff","8cf28c","ffe300"]
var bloqueado=[0,0,0,0]
var operacoes=["+","-","/","*"]
var quantasContas=[0,0,0,0]
var turno=0
var dado_clicked=0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass
func _input(event):
	if(Input.is_key_pressed(KEY_O)):
		print("DIRECAO JOGADOR "+str(0)+" e "+player_array[0].direction)
		print("DIRECAO JOGADOR "+str(1)+" e "+player_array[1].direction)

		
func _process(delta):
	if(dado_clicked==1):
		$Dado/Lado1.disabled=true
	else:
		$Dado/Lado1.disabled=false
	$Vez.text="Vez do jogador : "+str(turno+1)
	$Vez.set("custom_colors/font_color",player_array[turno].cor)
func avaiableMovementFoward(dado,special):
		var map=$TileMap.get_used_cells()
		var pl=player_array[turno]
		var pWTM=$TileMap.world_to_map(pl.position)
		var done=1
		for i in range (dado):
			pWTM=$TileMap.world_to_map(pl.position)
#			if(special=="4" or special=="2"and done==1):
#				if(pWTM+Vector2(1,0) in map and pl.direction!="left"):#Right
#					pl.direction="right"
#				elif(pWTM+Vector2(-1,0) in map and pl.direction!="right"):#Left
#					pl.direction="left"
#				done=0
			if(pWTM+Vector2(0,-1) in map and pl.direction!="down"):#Top
				pl.direction="top"
			elif(pWTM+Vector2(0,1) in map and pl.direction!="top"):#Down
				pl.direction="down"
			elif(pWTM+Vector2(1,0) in map and pl.direction!="left"):#Right
				pl.direction="right"
			elif(pWTM+Vector2(-1,0) in map and pl.direction!="right"):#Left
				pl.direction="left"
			
			movement(pl)
		if(pl.can_Special==1 or special=="not"):
			whichTile($TileMap.get_cellv($TileMap.world_to_map(pl.position)),pl,special)
		elif(special=="s"):
			turno()
func avaiableMovementBack(dado,no):
		var map=$TileMap.get_used_cells()
		var pl=player_array[turno]
		var pWTM=$TileMap.world_to_map(pl.position)
		print("ANTES DE MUDAR",pl.direction)
		changeDir()
		print("PRIMEIRA MUDANCA",pl.direction)
		movement(pl)
		print("PRIMEIRA MOVIEMENTAO",pl.direction)
		avaiableMovementFoward(dado-1,no)
		print("DPS AVAIBLE MOVEMENT",pl.direction)
		changeDir()
		print("DPS TROCA DIRECAO",pl.direction)
		pl.can_Special=0
		#yield(get_tree().create_timer(1), "timeout")
		turno()
func changeDir():
	if(player_array[turno].direction=="top"):
		player_array[turno].direction="down"
		return
	elif(player_array[turno].direction=="down"):
		player_array[turno].direction="top"
		return
	elif(player_array[turno].direction=="left"):
		player_array[turno].direction="right"
		return
	elif(player_array[turno].direction=="right"):
		player_array[turno].direction="left"
		return
func movement(pl):
	if(pl.direction=="right"):
		pl.position=pl.position+Vector2(63,0)
#		$Tween.start()
#		$Tween.interpolate_property(player,"position",player.position,player.position+$TileMap.map_to_world((Vector2(2,0))),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	if(pl.direction=="left"):
		pl.position=pl.position+Vector2(-63,0)
#		$Tween.start()
#		$Tween.interpolate_property(player,"position",player.position,player.position+$TileMap.map_to_world((Vector2(-2,0))),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	if(pl.direction=="down"):
		pl.position=pl.position+Vector2(0,64)
#		$Tween.start()
#		$Tween.interpolate_property(player,"position",player.position,player.position+$TileMap.map_to_world((Vector2(0,2))),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	if(pl.direction=="top"):
		pl.position=pl.position+Vector2(0,-64)
#		$Tween.start()
#		$Tween.interpolate_property(player,"position",player.position,player.position+$TileMap.map_to_world((Vector2(0,-2))),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	if(pl.direction=="none"):
		pass
func whichTile(qualCasa,pl,qual):
	dado_clicked=1
	pl.can_Special=0
	var map=$TileMap.get_used_cells()
	if(qualCasa==1):
		if(pl.direction=="down"):
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementBack(3,"1")

		elif(pl.direction=="top"):
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementFoward(3,"s")

	elif(qualCasa==2):
		if(pl.direction=="left"):
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementBack(3,"2")

		else:
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementFoward(3,"s")
			pl.can_Special=0
	elif(qualCasa==3):
		if(pl.direction=="top"):
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementBack(3,"3")
			pl.can_Special=0
		else:
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementFoward(3,"s")
			pl.can_Special=0
	elif(qualCasa==4):
		if(pl.direction=="right"):
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementBack(3,"4")
			pl.can_Special=0
		else:
			yield(get_tree().create_timer(.5), "timeout")
			avaiableMovementFoward(3,"s")
			pl.can_Special=0
			
	elif(qualCasa==5):
		bloqueado[turno] = 1
		$Bloquea.show()
		$Bloquea.text="Jogador "+str(turno+1)+ "\n"+" perdeu o proximo turno"
		$Bloquea.set("custom_colors/font_color",player_array[turno].cor)
		yield(get_tree().create_timer(2), "timeout")
		$Bloquea.hide()
		turno()
		
	elif(qualCasa==6):
		$Teclado.show()
		var i
		randomize()
		i = randi()%3
		var num1=randi()%10+1
		var num2=randi()%10+1
		if(operacoes[i]=="/"):
			while(num1%num2!=0):
				randomize()
				num2=randi()%10+1
		conta(num1,operacoes[i],num2)
	elif(qualCasa==8):
		emit_signal("fim",quantasContas)
	else:
		turno()
func turno():
	if(turno==numPlay-1):
		turno=0
		var k
		for k in range(numPlay):
			player_array[k].can_Special=1
	else:
			turno+=1
	if(bloqueado[turno]==1):
		dado_clicked=1
		$Bloquea.show()
		$Bloquea.text="Jogador "+str(turno+1)+" bloqueado"
		$Bloquea.set("custom_colors/font_color",player_array[turno].cor)
		bloqueado[turno]=0
		yield(get_tree().create_timer(2), "timeout")
		$Bloquea.hide()
		turno()
	dado_clicked=0
	$Dado/Timer.start()
func _on_Menu_numberPlayers(numPl):#INSTANCIA OS JOGADORES
	numPlay=numPl
	for i in range(numPlay):
		var p=player.instance()
		player_array.append(p)
		player_array[i].cor=cor_player[i]
		p.position+=$TileMap.map_to_world(startPos)+positione[i]
		p.get_node("Sprite").texture=load(playersSprite[i])
		p.numberPlayer=i+1
		p.get_node("Sprite").scale*=0.4
		add_child(p)
		set_process(true)
func _on_Dado_number(dado):
	dado_clicked=1
	yield(get_tree().create_timer(1), "timeout")
	
	avaiableMovementFoward(dado,"not")

func conta(num1, sinal, num2):
	if (num2>num1):
		var aux=num1
		num1=num2
		num2=aux
	$Teclado/Num1.text = str(num1)
	
	if (sinal == "+"):
		$Teclado/X.text = "+"
	if (sinal == "-"):
		$Teclado/X.text = "-"
	if (sinal == "*"):
		$Teclado/X.text = "X"
	if (sinal == "/"):
#		while(num1/num2!=0 and num2!=0):
#			num2=randi()%num1+1
		$Teclado/X.text = "/"
	$Teclado/Num2.text = str(num2)

func confirmar(num1, sinal, num2, valor,resposta):
	num1=int(num1)
	num2=int(num2)
	print("RESPOSTA:",resposta)
	print("VALOR",valor)
	if (sinal == "+"):
		if (resposta == abs(valor)):
			quantasContas[turno]+=1
			avaiableMovementFoward(3,"s")
		else:
			avaiableMovementBack(3,"neither")
	elif (sinal == "-"):
		if (resposta == abs(valor)):
			quantasContas[turno]+=1
			avaiableMovementFoward(3,"s")
		else:
			avaiableMovementBack(3,"neither")
	elif (sinal == "X"):
		if (resposta == abs(valor)):
			quantasContas[turno]+=1
			avaiableMovementFoward(3,"s")
		else:
			avaiableMovementBack(3,"neither")
	elif (sinal == "/"):
		if (resposta == abs(valor)):
			quantasContas[turno]+=1
			avaiableMovementFoward(3,"s")
		else:
			print("aqui")
			avaiableMovementBack(3,"neither")
	emit_signal("clear")
	$Teclado.hide()
	dado_clicked=0
	player_array[turno].can_Special=0



	
