extends Node


func _ready():
	var SERVER_IP = "127.0.0.1"
	var SERVER_PORT = 11345

	print("connecting to " + SERVER_IP + ":" + str(SERVER_PORT) + " from " + self.get_name())
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().network_peer = peer
	print("peer: " + str(peer))

	#get_tree().client = self
