extends Control


onready var timer =$Timer
onready var music = $Music
# Called when the node enters the scene tree for the first time.




func _on_Easy_pressed():
	get_tree().change_scene("res://Levels/EasyLeveL.tscn")


func _on_Timer_timeout():
	music.playing = true
