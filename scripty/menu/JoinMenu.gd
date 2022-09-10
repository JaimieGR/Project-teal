extends Node2D

var vel = 0

func _ready():
	var main = get_node("..")
	print ("Main is " + main.get_name())
	main.connect("Join_Clicked", self, "_on_join_btn_pressed")

func _on_join_btn_pressed():
	print("Join BTN was signaled")
	#print (str(JoinMenu) + " to " + str(!JoinMenu))
	if vel >= 0 && position.x != 0:
		vel = -500
	else:
		vel = 80

func _process(delta):
	if vel < 0:
		vel *= 0.94
	elif vel > 0:
		vel /= 0.94
	else:
		vel = 0
	position.x += vel * delta
	if position.x < 0:
		position.x = 0
		vel = 0
	if position.x > 110:
		position.x = 110
		vel = 0
	print(vel)
	print(position)
