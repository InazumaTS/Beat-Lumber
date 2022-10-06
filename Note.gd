extends Node2D


var is_colliding = false
var picker
var is_collected = false
export var speed =50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(speed*Vector2(0,-1)*delta)
	collect()
	if global_position.y<0:
		queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("picker"):
		is_colliding = true 
		picker = area.get_parent()


func _on_Area2D_area_exited(area):
	if area.is_in_group("picker"):
		is_colliding = false

func collect():
	if not is_collected:
		if is_colliding and picker:
			if picker.is_collecting:
				is_collected = true
				queue_free()
