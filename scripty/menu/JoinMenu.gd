extends Node2D

var vel = 0
var trayOut = false

func _ready():
	print("path: " + get_path())
	var main = get_node("..")
	print ("Main is " + main.get_name())
	main.connect("Join_Clicked", self, "_on_join_btn_pressed")

func _on_join_btn_pressed():
	trayOut = !(trayOut)
	print("Join BTN was signaled")
	#print (str(JoinMenu) + " to " + str(!JoinMenu))
	if vel >= 0 && position.x != 0:
		vel = -500
	else:
		vel = 80
	load_()

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



func load_():
	var file = File.new()
	var path = "res://data/data.json)"

	if (file.open(path, File.WRITE) != 0):
		print("Missing server files")

	if ( (file.file_exists(path) ) == false ):
		print("no file exitance")

	file.open(path, File.READ)
	var data = {}
	data = parse_json(file.get_as_text())
	print(data)
	print("data: " + str(data))
	file.close()


	var ips = ["100.0.0.0","000.0.0.0","127.0.0.1"]
	var ports = [1244,5423,8000]
	var random = RandomNumberGenerator.new()
	random.randomize()
	for i in range(ips.size()):
			network.query_(ips[i],ports[i],i)
	var testing = 0 #10= testing 0= off
	for i in range((testing)):
		#network.query_(ips[i],ports[i],i)

		if random.randi_range(0,5) != 0:
			var imgs=["A","B","C"]
			var names=["The Cola Server","Gameing for me and my mates","Bits and Bangs The brand new server","Starwars Server"]
			var iplist= ["323.0.2.3:5532","824.0.5.2:6894","942.6.3.6:7924","996.3.8.4:87892"]
			var states= ["waiting","playing"]
			var maxP = random.randi_range(2,15)
			var p = random.randi_range(0,maxP)

			ticket(
			imgs[random.randi_range(0,2)],
			names[random.randi_range(0,3)],
			iplist[random.randi_range(0,3)],
			states[random.randi_range(0,1)],
			maxP,
			p,
			true,
			i)
		else:
			var iplist= ["323.0.2.3:5532","824.0.5.2:6894","942.6.3.6:7924","996.3.8.4:87892"]
			ticket("error","Offline",iplist[random.randi_range(0,3)],"...",0,0,false,i)

func ticket(imgName,nametxt,ip,state,playmax,playnum,online,id):
	print("creating ticket for '" + nametxt + "' ip: " + str (ip) )
	var node = get_node("Ticket: "+str(id))
	if node != null:
		node.get_parent().remove_child(node)
	var ticket_resource = load("res://Scenes/Ticket.tscn")
	var ticket_instance = ticket_resource.instance()
	add_child(ticket_instance)
	get_node("Ticket").create(imgName,nametxt,ip,state,playmax,playnum,online,id)
	#print("ticket: " + node.get_name() )

	#create(loc,imgName,nametxt,ip,state,playmax,playnum,online,color)



"""
func save():
	var file = File.new()
	file.open("user://file_data.json", File.WRITE)
	file.store_line(to_json(file_data))
	file.close()

func load():
	var file = File.new()
	if not file.fileExists("user://file_data.json", File.READ)
			 save()
			 return
	file.open("user://file_data.json", File.READ)
	var data = parse_json(file.get_as_text())
	file_data = data

func _ready():
	load()
	if file_data.tutorial.has("name"):
		 print(file_data.tutorial.name)
"""

"""
{
"ids": {"127.0.0.1"},
"ports": {"4546"}
}
"""

"""
	var player_resource = load("res://players/"+(players_list[player])+".tscn")
	var player_instance = player_resource.instance()
	add_child(player_instance)
	get_node("CamUnit").start_cam(player_instance)
"""

"""
	# Construct a dictionary with whatever data you want
var data = {
	player_level = 42,
	last_item = "sword"
}

# Open a file
var file = File.new()
if file.open("user://saved_game.sav", File.WRITE) != 0:
	print("Error opening file")
	return

# Save the dictionary as JSON (or whatever you want, JSON is convenient here because it's built-in)
file.store_line(data.to_json())
file.close()
Load variables

# Check if there is a saved file
var file = File.new()
if not file.file_exists("user://saved_game.sav"):
	print("No file saved!")
	return

# Open existing file
if file.open("user://saved_game.sav", File.READ) != 0:
	print("Error opening file")
	return

# Get the data
var data = {}
data.parse_json(file.get_line())

# Then do what you want with the data
"""
