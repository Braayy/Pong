extends Label
	
func _process(delta):
	if Input.get_connected_joypads().size() > 0:
		self.text = "Press START to control second paddle"
	else:
		self.text = "Press ENTER to control second paddle"
