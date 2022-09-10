extends KinematicBody2D

var JoinMenu = false

func _ready():
	var main = get_node("..")
	print ("Main is " + main.get_name())
	main.connect("Join_Clicked", self, "_on_join_btn_pressed")

func _on_join_btn_pressed():
	print("Join BTN was signaled")
	print (str(JoinMenu) + " to " + str(!JoinMenu))
	if JoinMenu:
		JoinMenu = !JoinMenu
	else:
		JoinMenu = !JoinMenu

func _process(delta):
	var moverate = 5*(3)
	if JoinMenu and get_position().x != 0:
		move_and_collide(Vector2(-moverate,0),true)
	elif JoinMenu == false and get_position().x != 110:
		move_and_collide(Vector2(moverate,0),true)
	print(str(get_position()) )
