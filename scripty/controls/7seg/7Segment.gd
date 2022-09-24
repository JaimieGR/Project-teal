extends Node2D

func create(x,y,id):
	set_name("7Segment"+str(id))
	#print("now at "+str(x)+","+str(y))
	set_position(Vector2(x,y))

func set_(N):
	var num = str(N)
	var map
	if num == "0":
		map = [true,true,true,false,true,true,true]
	elif num == "1":
		map = [false,false,false,false,false,true,true]
	elif num == "2":
		map = [false,true,true,true,true,true,false]
	elif num == "3":
		map = [false,false,true,true,true,true,true]
	elif num == "4":
		map = [true,false,false,true,false,true,true]
	elif num == "5":
		map = [true,false,true,true,true,false,true]
	elif num == "6":
		map = [true,true,true,true,true,false,true]
	elif num == "7":
		map = [false,false,true,false,false,true,true]
	elif num == "8":
		map = [true,true,true,true,true,true,true]
	elif num == "9":
		map = [true,false,true,true,true,true,true]
	else:
		map = [false,false,true,true,true,false,false]

	#print(num+" is being mapped to " + str(map))
	for j in range(map.size()):
		var node = get_node(str(j+1))
		if map[j] == true:
			node.show()
			node.set_frame(j)
		else:
			node.hide()
			node.set_frame(j)

func _process(delta):
	pass
