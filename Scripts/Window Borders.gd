extends Node

export var thickness = 20

func _ready():
	$"Top Border".position.x = get_viewport().size.x / 2
	$"Top Border".position.y = -(thickness / 2)
	$"Top Border/CollisionShape2D".shape.extents.x = get_viewport().size.x / 2
	$"Top Border/CollisionShape2D".shape.extents.y = thickness / 2
	
	$"Bottom Border".position.x = get_viewport().size.x / 2
	$"Bottom Border".position.y = get_viewport().size.y + thickness / 2
	$"Bottom Border/CollisionShape2D".shape.extents.x = get_viewport().size.x / 2
	$"Bottom Border/CollisionShape2D".shape.extents.y = thickness / 2
