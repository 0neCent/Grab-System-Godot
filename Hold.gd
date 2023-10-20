extends RayCast3D

var obj = null
var key = KEY_E
@onready var point = $"../Hold"

func _process(delta):
	if Input.is_key_pressed(key):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider
		
		if obj != null:
			obj.position = point.global_position
	else:
		obj = null










