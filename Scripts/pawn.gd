extends CharacterBody2D



# Grid size (adjust this to match the size of your squares)
var grid_size = 64
var board_origin = Vector2(0, 0)  # The top-left corner of your chessboard

var is_dragging = false
var offset = Vector2()

# Function to snap the piece to the grid
func snap_to_grid(_target_position: Vector2) -> Vector2:
	var grid_x = int((position.x - board_origin.x) / grid_size) * grid_size + board_origin.x
	var grid_y = int((position.y - board_origin.y) / grid_size) * grid_size + board_origin.y
	return Vector2(grid_x, grid_y)

# Handling mouse input for dragging and dropping the piece
func _input(event):
	var mouse_pos = get_global_mouse_position()

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:  # Mouse pressed down
				# Check if the mouse is over the piece using its Sprite or CollisionShape2D
				if is_mouse_over(mouse_pos):
					is_dragging = true
					offset = position - mouse_pos  # Calculate the offset between piece and mouse position
			else:  # Mouse released (drop piece)
				if is_dragging:
					position = snap_to_grid(mouse_pos)  # Snap the piece to the grid
					is_dragging = false

# Update piece position when dragging (hover effect)
func _process(_delta):
	if is_dragging:
		# Update the position of the piece while dragging
		var mouse_pos = get_global_mouse_position()
		position = mouse_pos + offset  # Follow the mouse position with an offset to make it hover

# Check if the mouse is over the piece (based on its Sprite or CollisionShape2D)
func is_mouse_over(mouse_pos: Vector2) -> bool:
	# If the piece has a Sprite as a child, you can use it to check the mouse position
	var sprite = $Pawn  # Assuming the piece has a Sprite node
	if sprite:
		return sprite.get_rect().has_point(sprite.to_local(mouse_pos))
	# Or, if it has a CollisionShape2D, check using that instead
	var collision_shape = $CollisionShape2D  # Assuming the piece has a CollisionShape2D node
	if collision_shape:
		return collision_shape.shape.get_rect().has_point(collision_shape.to_local(mouse_pos))
	return false
