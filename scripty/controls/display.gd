extends Node2D

var group7 = []

func _ready():
	buildSeg7()
	group7[0].set__(096,8)
	group7[1].set__(919,4)
	group7[2].set__(003,3)

func buildSeg7():
	#0:pitch
	#1:depth
	#2:bearing
	for i in range(0,3):
		var resource = load("res://Scenes/7segg/7SegmentDisplay.tscn")
		var instance = resource.instance()
		add_child(instance)
		if i == 0:
			get_node("7SegmentDisplay").create(185,120,3,i)
		elif i == 1:
			get_node("7SegmentDisplay").create(185,149,3,i)
		elif i == 2:
			get_node("7SegmentDisplay").create(246,149,3,i)
		var node = get_node("7SegmentDisplay"+str(i))
		group7.append(node)
	print("7 segments: "+str(group7))
