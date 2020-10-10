extends Node

onready var HUD = get_node("/root/Game/HUD")
onready var Camera1 = get_node("/root/Game/Camera")
onready var Camera2 = get_node("/root/Game/HUD/Camera")
onready var WE = get_node("/root/Game/WorldEnvironment")

signal changed

var lives = 4
var score = 0
var level = 0

func _ready():
	emit_signal("changed")

func update_score(s):
	score += s
	print("Score: " + str(score))
	emit_signal("changed")
	
func update_lives(l):
	lives += l
	print("Lives: " + str(lives))
	emit_signal("changed")
	
func update_level(l):
	level += l 
	emit_signal("changed")

func _process(_delta):
	if Input.is_action_just_pressed("menu"):	
		if HUD.visible:
			HUD.hide()
			Camera2.current = false
			Camera1.current = true
			WE.show()
		else:
			HUD.show()
			Camera1.current = false
			Camera2.current = true
			WE.hide()
