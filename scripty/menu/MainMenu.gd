extends Node2D

signal Join_Clicked
signal Host_Clicked

func _ready():
	var joinBtn = get_node("Join Btn")
	joinBtn.connect("pressed", self, "_on_join_btn_pressed")
	var hostBtn = get_node("Host Btn")
	hostBtn.connect("pressed", self, "_on_host_btn_pressed")

func _on_join_btn_pressed():
	print("join button was clicked  -  JOIN")
	emit_signal("Join_Clicked")
	#

func _on_host_btn_pressed():
	emit_signal("Host_Clicked")
	print("host button was clicked  -  HOST")
	network.create_server("127.0.0.1",4546,"This server",7)
	#ip"string" port"#" name"string""
