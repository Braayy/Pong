extends KinematicBody2D
class_name Player

var speed = 250

func _ready():
	self.position.y = get_viewport().size.y / 2
