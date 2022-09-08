extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	connect("pressed", self, "_on_press")

func _on_press():
	#var Network = get_node("/root/MainScene/Client/Networking")
	var Network = get_node("/root/MainScene/Networking")
	print("button makeing network call to: " + Network.get_name())
	print(str(Network))
	Network.send_message("Boat")
	#get_tree().client.send_message("Boat")
	#Client.send_message("Boat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
