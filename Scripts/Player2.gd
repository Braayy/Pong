extends Player

var rng = RandomNumberGenerator.new()
var ai_error = 0

func _ready():
	._ready()
	self.position.x = get_viewport().size.x - 100
	rng.randomize()

func _physics_process(delta):
	if Game.local_multiplayer:
		tick_multiplayer(delta)
	else:
		tick_ai(delta)

func tick_ai(delta):
	var ball = $"../Ball"
	if ball.vel.x < 0: return
	
	var dir = $"../Ball".position.y - self.position.y + ai_error
	self.move_and_collide(Vector2(0, dir).normalized() * speed * delta)

func tick_multiplayer(delta):
	var movement_strength = Input.get_axis("player2_up", "player2_down")
	self.move_and_collide(Vector2(0, movement_strength) * self.speed * delta)

func _on_Timer_timeout():
	ai_error = (rng.randf() * 2 - 1) * 225
