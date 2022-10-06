extends KinematicBody2D

onready var hurtbox = $Hurtbox
onready var woodbottom = $WoodBottom
onready var topCheck = $TopCheck
export var mark =2
var velocity = Vector2.ZERO
export var speed =20
const Enemy = preload("res://Lumber/Spike.tscn")
const Fruit = preload("res://Lumber/Fruit.tscn")
var pos = 0
var other_pos = 0

func _ready():
	randomize()
	pos = randi()%20
	other_pos = randi()%20
	if(mark !=1):
		spawn_spike()

func _process(_delta):
	velocity = move_and_slide(velocity)
	if position.x>320 or position.x<-320:
		queue_free()


func spawn_spike():
	if pos>12 or pos<7:
		var enemy  = Enemy.instance()
		add_child(enemy)
		enemy.global_position = global_position
		if pos>12:
			enemy.global_position.x += 24
		else:
			enemy.global_position.x -= 24
	else:
		if other_pos<7 or other_pos>12:
			var fruit = Fruit.instance()
			add_child(fruit)
			fruit.global_position = global_position
			if other_pos<13:
				fruit.global_position.x +=24
			else:
				fruit.global_position.x -=24



func _on_Hurtbox_area_entered(area):
	hurtbox.queue_free()
	topCheck.queue_free()
	woodbottom.queue_free()
	velocity.x = speed*area.LEFTorRIGHT

func _on_WoodBottom_area_exited(_area):
	position.y+=24
