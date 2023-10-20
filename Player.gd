extends CharacterBody3D

var keys = {
"w":KEY_W, 
"a":KEY_A, 
"s":KEY_S, 
"d":KEY_D, 
}

var move = Vector3.ZERO
var gravity = -9.8
var speed = 4.0
var sensitivty = 0.01

func _process(delta):
	move = input()
	
	velocity = move * speed
	velocity.y = 0
	move_and_slide()

func input():
	var vector = Vector3.ZERO
	
	if Input.is_key_pressed(keys["w"]):
		vector += Vector3.FORWARD
	if Input.is_key_pressed(keys["a"]):
		vector += Vector3.LEFT
	if Input.is_key_pressed(keys["s"]):
		vector += Vector3.BACK
	if Input.is_key_pressed(keys["d"]):
		vector += Vector3.RIGHT
	
	var local = transform.basis.z * vector.z
	local += transform.basis.x * vector.x
	
	return local.normalized()

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y += event.relative.x * -sensitivty
		rotation.x += event.relative.y * -sensitivty
