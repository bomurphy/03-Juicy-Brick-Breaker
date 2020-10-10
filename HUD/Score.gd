extends Node2D


func _ready():
	Global.connect("changed", self, "_on_Global_changed")
	update_score()
	update_lives()


func update_score():
	$Score.text = "SCORE: " + str(Global.score)

func update_lives():
	$Lives.text = "LIVES: " + str(Global.lives)
	
func _on_Global_changed():
	update_score()
	update_lives()
