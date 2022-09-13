extends Node

var id0
var querying
var ServerName
var ServerImg
var ServerIP
var ServerMax
var ServerPlayers = []
var ClientSearchIP

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_player_disconnected")
	get_tree().connect("connected_to_server", self, "_on_connected_to_server")
	get_tree().connect("connection_failed", self, "_on_connection_failed")
	get_tree().connect("server_disconnected", self, "_on_disconnected_from_server")

func create_server(ip,port,name,playmax):

	# Initialize the networking system
	var net = NetworkedMultiplayerENet.new()

	# Try to create the server
	if (net.create_server(4546, 8) != OK):
		print("Failed to create server")
		emit_signal("server_not_created")
		return
	else:
		print ("server data inputed")
	# Assign it into the tree
	get_tree().set_network_peer(net)
	ServerIP = ip + ":" + str(port)
	ServerName = name
	ServerImg = ("file")
	ServerMax = playmax
	print("server creationg atempted")
	print("server id is " + str(get_tree().get_network_unique_id()) )

func query_(ip,port,id):
	querying = true
	print("starting connection to: " + ip +":"+str(port) )
	ClientSearchIP = (ip+":"+str(port) )
	var net = NetworkedMultiplayerENet.new()
	if (net.create_client(ip, port) != OK):
		print("Failed to join server")
		Buildticket("offline","Offline",ClientSearchIP,"...", "00","00",false,id)
		return
	else:
		print("conecting to server...")
		id0 = id
	get_tree().set_network_peer(net)
	print("starting connection")
	rpc_id(1,"helloOut",get_tree().get_network_unique_id())

remote func helloOut(herID):
	print("game requesting confiremation")
	rpc_id(herID,"helloIn")

remote func helloIn():
	print("connected to: " + ClientSearchIP)
	if querying:
		print("player  querying... >")
		var myID = [get_tree().get_network_unique_id(),id0]
		# Update the player_info dictionary with the obtained unique network ID
		rpc_id(1, "infoQur", myID)
		print("...")



remote func Buildticket(imgName,nametxt,ip,state,playmax,playnum,online,id):
	#ticket(imgName,nametxt,ip,state,playmax,playnum,online):
	print("Build Ticket")
	get_node("/root/MainScene/Menu/Main/Join").ticket(
		imgName,nametxt,ip,state,playmax,playnum,online,id)
	#get_node("/root/MainScene/Menu/Main/Join").ticket(imgName,nametxt,state,playmax,playnum,online,id)

remote func infoQur(herID):
	print("EVENT: this server has been queryed by " + str(herID[0]))
	var imgName = ServerImg
	var nametxt = ServerName
	var state = "waiting"
	var playmax = ServerMax
	var playnum = ServerPlayers.size()
	var online = true
	var id = id0
	var ip = ServerIP
	rpc_id(herID[0],"Buildticket",imgName,nametxt,ip,state,playmax,playnum,online,id)

# Everyone gets notified whenever someone disconnects from the server
func _on_player_connected(id):
	pass
	if false:
		print("player  querying... >")
		var myID = [get_tree().get_network_unique_id(),id0]
		# Update the player_info dictionary with the obtained unique network ID
		rpc_id(id, "infoQur", myID)
		print("...")

# Peer trying to connect to server is notified on success
func _on_player_disconnected(id):
	print("player diss")

# Peer trying to connect to server is notified on success
func _on_connected_to_server():
	print("connection staus")
	rpc_id(1,"helloOut",get_tree().get_network_unique_id())


# Peer trying to connect to server is notified on failure
func _on_connection_failed():
	print ("Failed to connect to: " + ClientSearchIP )
	get_tree().set_network_peer(null)

# Peer is notified when disconnected from server
func _on_disconnected_from_server():
	print("server diss")
