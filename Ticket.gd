extends Node2D

export var websocket_url = "ws://"
var _client = WebSocketClient.new()
var strIP
var id
var right = false

var online
var scan = true
onready var Click = $click
#$clickOther


func _ready():
	z_index = 0
	Click.hide()
	_client.connect("connection_closed", self, "_closed")
	_client.connect("connection_error", self, "_closed")
	_client.connect("connection_established", self, "_connected")
	_client.connect("data_received", self, "_on_data")

func _connect():
	websocket_url = "ws://" + strIP
	#var err = _client.connect_to_url(websocket_url, ["lws-mirror-protocol"])
	var err = _client.connect_to_url(websocket_url)
	#print("...")
	if err != OK:
		print("FAILURE to connect to "+strIP+" | Websocket")
		set_process(false)
		online = false
	else:
		print("Connected to " + strIP + " | Websocket")
		online = true

func create(j,ips,ports):
	id = j
	var ip = ips[j]
	var port = ports[j]
	strIP = (str(ip)+":"+str(port))
	set_name("Ticket: "+str(j))
	if ( (j % 2) == 0):         #even
		get_node("2Dnode/TicketPaper").set_frame(1)
	else:                   #odd
		get_node("2Dnode/TicketPaper").set_frame(0)
	var random = RandomNumberGenerator.new()
	random.randomize()
	get_node("2Dnode/barcode").set_frame(random.randi_range(0,13))
	var loc = Vector2(231,-117+(26*j))
	position.x = loc.x
	position.y = loc.y
	if (ip == ""):
		$IP.set_text("")
		$playNum.set_text("")
		$maxNum.set_text("")
		$Name.set_text("")
		$state.set_text("")
		var del = get_node("2Dnode/Basics")
		del.get_parent().remove_child(del)
		del = get_node("2Dnode/barcode")
		del.get_parent().remove_child(del)
	else:
		if ip != "":
			_connect()
		$IP.set_text(strIP)
		$playNum.set_text("00")
		$maxNum.set_text("00")
		#$Name.font_color(Color(160,3,0,255))
		$Name.set_text("Loading...")
		$state.set_text("...")

func _closed(was_clean = false):
	print("Closed, clean: ", was_clean)
	set_process(false)
	online = false

func _connected(proto = ""):
	print("Connected with protocol: ", proto)

func _on_data():
	pass
	var payload = JSON.parse(_client.get_peer(1).get_packet().get_string_from_utf8()).result
	if payload["packet"] == "qurey":
		qurey(payload)

func qurey(payload):
	$IP.set_text(strIP)
	$playNum.set_text( str(payload["Pnum"]) )
	$maxNum.set_text( str(payload["Mnum"]) )
	$Name.set_text( str(payload["name"]) )
	$state.set_text( str(payload["status"]) )
	scan = false

func _process(delta):
	#print(str(delta) )
	#print("Attempt")
	_client.poll()
	"""
	var err = _client.poll()
	if err != OK:
		print("POLL ERROR atempt failed")
		online = true
		"""
	if !(online):
		print("not online")
		_connect()
	else:
		#print("scanning")
		if scan:
			#print("sending message to " + strIP)
			_client.get_peer(1).put_packet(JSON.print({"packet": "qurey"}) .to_utf8() )


func ClickExit(event):
	if event is InputEventMouseButton and event.pressed:
		print("Closer")
		Click.hide()
		z_index = 0

func join():
	print("Join | Click")

func Click(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				join()
			BUTTON_RIGHT:
				Click.show()
				z_index = 2

