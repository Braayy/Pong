extends Player

func _ready():
	._ready()
	self.position.x = 100	

func _physics_process(delta):
	var movement_strength = Input.get_axis("ui_up", "ui_down")
	self.move_and_collide(Vector2(0, movement_strength) * self.speed * delta)
