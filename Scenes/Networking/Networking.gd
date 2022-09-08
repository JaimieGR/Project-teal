extends Node
var Server

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass
	var home = self.get_parent().get_name()
	print("im from: " + home)
	if str(home) == "root":
		print("IM A SERVER")
		Server = true

	else:
		print("IM A PLAYER")
		Server = false
	#get_tree().connect("receive_message",self,"_recive_message")


func send_message(stringy):
	print("this is eagle base we are sending " + stringy)
	print(get_tree().get_network_connected_peers())
	rpc_id(1,"receive_message",stringy)

remote func receive_message(stringy):
	print("Huston we have: " + stringy)
	get_tree().quit()
