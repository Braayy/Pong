extends KinematicBody2D

var speed = 400
var vel = Vector2(0, 0)

signal scored(player)

var rng = RandomNumberGenerator.new()
var valid_start_directions = [
	Vector2(0.7071, -0.7071),
	Vector2(0.7071, 0.7071),
	Vector2(-0.7071, 0.7071),
	Vector2(-0.7071, -0.7071)
]

func _ready():
	self.reset()

func _process(delta):
	if self.position.x < 0:
		player_scored(2)
	elif self.position.x > get_viewport().size.x:
		player_scored(1)

func _physics_process(delta):
	var col = self.move_and_collide(vel * speed * delta)
	if col:
		self.vel = self.vel.bounce(col.normal)

func reset():
	self.position = Vector2(
		get_viewport().size.x / 2,
		get_viewport().size.y / 2
	)
	
	self.rng.randomize()
	self.vel = valid_start_directions[self.rng.randi_range(0, self.valid_start_directions.size() - 1)]

func player_scored(player):
	self.reset()
	self.emit_signal("scored", player)
