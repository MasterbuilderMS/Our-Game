extends Area2D

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		print("move right")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		print("move left")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		print("move down")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		print("move up")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
