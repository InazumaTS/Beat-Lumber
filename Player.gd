extends KinematicBody2D

onready var Swingin = $SwingofAxe
onready var Slice = $Swingbox
onready var Player_Sprite = $Sprite
onready var Score = $CanvasLayer/score
onready var sprite = $Sprite
onready var flicker = $Flicker
onready var flickeranimation = $FlickerAnimation
onready var hurt = $Hurt
onready var addor = $CanvasLayer/Addorloss
onready var particles = $CPUParticles2D
var NoteHit = 0
var value = 0
var count =0
# warning-ignore:unused_argument
func _process(delta):
	Score.bbcode_text = "Score: %s" %value
	if(Input.is_action_just_pressed("ui_right") and NoteHit==1):
		particles.direction.x = -5
		particles.position.x = 11
		particles.emitting = true
		sprite.play("New Anim")
		addor.bbcode_text= "+10"
		value +=10
		Player_Sprite.flip_h=false
		Swingin.flip_h=false
		Swingin.frame=0
		position.x = 130
		Swingin.play("Swing")
		Slice.position.x = 15
		Slice.monitorable = true
		Slice.LEFTorRIGHT = 1
		count +=1
	if(Input.is_action_just_pressed("ui_left") and NoteHit==1):
		particles.direction.x = 5
		particles.position.x = -11
		particles.emitting = true
		addor.bbcode_text= "+10"
		sprite.play("New Anim")
		value +=10
		Player_Sprite.flip_h=true
		Swingin.flip_h=true
		Swingin.frame=0
		position.x = 187
		Swingin.play("Swing")
		Slice.position.x=-15
		Slice.monitorable = true
		Slice.LEFTorRIGHT = -1
		count += 1




func _on_SwingofAxe_animation_finished():
	particles.emitting = false
	Slice.position.x=0
	sprite.play("default")
	


func _on_Swingbox_area_entered(_area):
	Slice.position.x=0


func _on_Hurt_area_entered(area):
	if area.is_in_group("Pain"):
		addor.bbcode_text= "-30"
		flickeranimation.play("Blink")
		hurt.visible = false
		flicker.start(1.9)
		value -=30
	elif area.is_in_group("Food"):
		addor.bbcode_text = "+50"
		value +=50


func _on_Area2D_area_entered(_area):
	NoteHit = 1


func _on_Area2D_area_exited(_area):
	NoteHit = 0


func _on_Flicker_timeout():
	hurt.visible = true
	flickeranimation.stop()
