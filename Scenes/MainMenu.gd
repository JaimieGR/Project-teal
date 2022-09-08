extends Node2D

var names = ["Alpha","Bravo","Charlie","Echo","Foxtrot","Golf","Hotel","India","Juliett","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Vicotor","Whiskey","Xray","Yankee","Zulu","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Zero","Charlie","Tango","Papa","Xray","",""]
var tempOnlineBoolean = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():

	Network.connect("server_created", self, "_on_hosting")
	Network.connect("server_not_created", self, "_on_not_created")
	Network.connect("join_success", self, "_on_joined")
	Network.connect("join_fail", self, "_on_join_fail")

	var hostBtn = get_node("Host Btn")
	hostBtn.connect("pressed", self, "tempHost")

	var joinBtn = get_node("Join Btn")
	joinBtn.connect("pressed", self, "tempJoin")

	var crewBtn = get_node("Crew Btn")
	crewBtn.connect("pressed", self, "")

	var menuBtn = get_node("Menu Btn")
	menuBtn.connect("pressed", self, "")

	var aboutBtn = get_node("About Btn")
	aboutBtn.connect("pressed", self, "About")

	var scuttleBtn = get_node("Scuttle Btn")
	scuttleBtn.connect("pressed", self, "endGame")

#no longer in use
func tempServer():
	#print("TESTING: you have 'joined' a server")
	if tempOnlineBoolean:
		tempOnlineBoolean = false
		get_node("online light").set_frame(0)
	else:
		tempOnlineBoolean = true
		get_node("online light").set_frame(1)

func tempHost():
	set_player_info()
	print("BTN: create")
	Network.create_server()
	#hide()

func tempJoin():
	set_player_info()
	print("BTN: join")
	var ip = "127.0.0.1"
	var port = 4546 #11011
	Network.join_server(ip, port)


func endGame():
	#get_node("exitmenuLoc/exitmenu").popup()
	get_tree().quit()

func About():
	OS.shell_open("https://docs.google.com/document/d/e/2PACX-1vR9rBU02_nqCX3NR3MN1NdPDMv7QGyxUNikcqgmAkt-SHYbmpCAGArgt_e_kLLqW8mG_K3RBrZ_orMp/pub")

func _on_joined():
	print("game joined")
	get_node("join light").set_frame(1)
	#self.hide()
func _on_hosting():
	print("hosting game")
	get_node("host light").set_frame(1)


func set_player_info():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var newName = ("Player  "+names[random.randi_range (0,36)]+"-"+names[random.randi_range (0,36)]+"-"+names[random.randi_range (0,36)])
	print("player name is:" + newName)
	Gamestate.player_info.name = newName
	Gamestate.player_info.char_color = 0

func _on_not_created():
	if get_node("host light").get_frame() == 0:
		get_node("host light").set_frame(1)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("host light").set_frame(0)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("host light").set_frame(1)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("host light").set_frame(0)
	print("Failed to create server")

func _on_join_fail():
	if get_node("join light").get_frame() == 0:
		get_node("join light").set_frame(1)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("join light").set_frame(0)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("join light").set_frame(1)
		yield(get_tree().create_timer(0.15), "timeout")
		get_node("join light").set_frame(0)
	print("Failed to join server")

