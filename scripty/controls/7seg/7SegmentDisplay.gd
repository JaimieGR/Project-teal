extends Node2D
var subgroup7 = []
func _ready():
	pass
func create(x,y,dec,id):
	set_position(Vector2(x,y))
	for j in range(0,4):
		#print("j: " + str(j))
		var resource = load("res://Scenes/7segg/7Segment.tscn")
		var instance = resource.instance()
		add_child(instance)
		if j < dec:
			get_node("7Segment").create(10*j,0,j)
		else:
			get_node("7Segment").create(10*j+(2),0,j)
		get_node("7Segment"+str(j)).set_(8)
		var node = get_node("7Segment"+str(j))
		subgroup7.append(node)
	set_name("7SegmentDisplay"+str(id) )
func set__(N,D):
	var numList
	var num = str(N)
	var dec = str(D)
	for i in range(3-num.length()):
		num = "0"+num
	for i in range(0,2):
		var Num = num[i]
		subgroup7[i].set_(Num)
	subgroup7[3].set_(dec)
