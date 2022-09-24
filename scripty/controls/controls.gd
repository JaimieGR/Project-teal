extends Node2D

var line = ""
var node
var words = [""]
var wordFin = false
var enter = ""

func _ready():
	if false:
		var sugg_resource = load("res://Scenes/Suggestion.tscn")
		var sugg_instance = sugg_resource.instance()
		add_child(sugg_instance)
		get_node("Suggestion").create(0)
		node = get_node("Suggestion 0")

func _process(delta):
	input()

func input():
	if(Input.is_action_just_released("back")):
		type("_back_")
	if(Input.is_action_just_released("space")):
		type("_space_")
	if(Input.is_action_just_released("A")):
		type("A")
	if(Input.is_action_just_released("B")):
		type("B")
	if(Input.is_action_just_released("C")):
		type("C")
	if(Input.is_action_just_released("D")):
		type("D")
	if(Input.is_action_just_released("E")):
		type("E")
	if(Input.is_action_just_released("F")):
		type("F")
	if(Input.is_action_just_released("G")):
		type("G")
	if(Input.is_action_just_released("H")):
		type("H")
	if(Input.is_action_just_released("I")):
		type("I")
	if(Input.is_action_just_released("J")):
		type("J")
	if(Input.is_action_just_released("K")):
		type("K")
	if(Input.is_action_just_released("L")):
		type("L")
	if(Input.is_action_just_released("M")):
		type("M")
	if(Input.is_action_just_released("N")):
		type("N")
	if(Input.is_action_just_released("O")):
		type("O")
	if(Input.is_action_just_released("P")):
		type("P")
	if(Input.is_action_just_released("Q")):
		type("Q")
	if(Input.is_action_just_released("R")):
		type("R")
	if(Input.is_action_just_released("S")):
		type("S")
	if(Input.is_action_just_released("T")):
		type("T")
	if(Input.is_action_just_released("U")):
		type("U")
	if(Input.is_action_just_released("V")):
		type("V")
	if(Input.is_action_just_released("W")):
		type("W")
	if(Input.is_action_just_released("X")):
		type("X")
	if(Input.is_action_just_released("Y")):
		type("Y")
	if(Input.is_action_just_released("Z")):
		type("Z")
	if(Input.is_action_just_released("~")):
		get_tree().quit()


func type (letter):
	print("===========")
	if letter == "_back_":
		var Len = line.length()
		line.erase(Len-1,1)
		letter = ""
	elif letter == "_enter_":
		words[words.size()-1] = enter
	else:
		print(str(letter))
		if letter == "_space_":
			words.append("")
			letter = " "
			$Path.run("*",true)
		else:
			words[words.size()-1] = words[words.size()-1]+letter
			if !wordFin:
				$Path.run(words[words.size()-1],false)
			print(str(words))
	line = str(line + letter)
	$line.set_text(line)
	#node.edit(line,0)

func Match(oneLeft,word):
	if oneLeft:
		words[words.size()-1] = word
		line = ""
		print("words: " + str(words))
		for i in range(words.size()):
			line = (line + words[i] + " ")
	else:
		enter = word
