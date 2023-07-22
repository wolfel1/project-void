extends CharacterBody2D


@export var speed = 60

var is_started : bool = true
var target

func init(pos):
	position = pos
	target = pos
	init_camera()
	$CollisionShape2D.disabled = false
	
func init_camera():
	var camera = $Camera2D
	camera.set_limit(SIDE_LEFT, 0)
	camera.set_limit(SIDE_TOP, 0)
	camera.set_limit(SIDE_RIGHT,640)
	camera.set_limit(SIDE_BOTTOM, 512)

func _process(delta):
	if is_started:
		if velocity.length() > 0:
			$AnimatedSprite2D.play()
			if velocity.x > 0:
				$AnimatedSprite2D.animation = "walk_right"
			elif velocity.x < 0:
				$AnimatedSprite2D.animation = "walk_left"
			elif velocity.y < 0:
				$AnimatedSprite2D.animation = "walk_up"
			elif velocity.y > 0:
				$AnimatedSprite2D.animation = "walk_down"
				
			if $AnimatedSprite2D.animation == "walk_up":
				if $AnimatedSprite2D/PointLight2D.position.x > 0:
					$AnimatedSprite2D/PointLight2D.position.x *= -1
			elif $AnimatedSprite2D/PointLight2D.position.x < 0:
				$AnimatedSprite2D/PointLight2D.position.x *= -1
		else:
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.stop()
		
	
func _input(event):
	if event.is_action_pressed("left_click"):
		target = get_global_mouse_position()
		
func _physics_process(delta):
	if is_started:
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) > 10:
			move_and_slide()
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)


func _on_animated_sprite_2d_frame_changed():
	$AnimatedSprite2D/Footstep.play()
