extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func create(imgName,nametxt,ip,state,playmax,playnum,online,id):
	set_name(("Ticket: "+str(id)))

	if id % 2 == 0:         #even
		get_node("2Dnode/TicketPaper").set_frame(1)
	else:                   #odd
		get_node("2Dnode/TicketPaper").set_frame(0)

	var random = RandomNumberGenerator.new()
	random.randomize()
	get_node("2Dnode/barcode").set_frame(random.randi_range(0,13))

	var loc = Vector2(231,-117+(26*id))

	position.x = loc.x
	position.y = loc.y


	$IP.set_text(str(ip))
	if online:
		$playNum.set_text(str(playnum))
		$maxNum.set_text(str(playmax))

		$Name.set_text(str(nametxt))
		$state.set_text(str(state))
	else:
		$playNum.set_text("00")
		$maxNum.set_text("00")

		$Name.set("custom_colors/default_color", Color(160,3,0,255))
		#$Name.font_color(Color(160,3,0,255))
		$Name.set_text("Offline")
		$state.set_text("...")





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
