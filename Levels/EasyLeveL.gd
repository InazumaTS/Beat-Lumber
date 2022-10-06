extends Node2D
onready var music = $Music
var counter =1
onready var player = $Game/Player
onready var label = $Label
func _on_Timer_timeout():
	music.playing = true

func _process(delta):
	if counter == 85:
		music.stop()
	if player.count ==82:
		label.text = "PERFECT RUN: +100"
		player.value +=100

func _on_Area2D_area_entered(area):
	counter +=1


func _on_Hurt_area_entered(area):
	if area.is_in_group("Pain"):
		Global.camera.shake(0.5,6)
