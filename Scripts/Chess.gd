extends Sprite2D

const BOARD_SIZE=8
const CELL_WIDTH=18

const TEXTURE_HOLDER = preload("res://Scenes/texture_holder.tscn")

const BISHOP_BLACK = preload("res://Assets/bishop black.png")
const KING_BLACK = preload("res://Assets/king black.png")
const KNIGHT_BLACK = preload("res://Assets/knight black.png")
const PAWN_BLACK = preload("res://Assets/pawn black.png")
const QUEEN_BLACK = preload("res://Assets/queen black.png")
const ROOK_BLACK = preload("res://Assets/rook black.png")
const BISHOP = preload("res://Assets/bishop.png")
const KING = preload("res://Assets/king.png")
const KNIGHT = preload("res://Assets/knight.png")
const PAWN = preload("res://Assets/pawn.png")
const QUEEN = preload("res://Assets/queen.png")
const ROOK = preload("res://Assets/rook.png")






const TURN_BLACK = preload("res://Assets/TURN_BLACK.png")
const TURN_WHITE = preload("res://Assets/TURN_WHITE.png")

@onready var pieces: Node2D = $Pieces
@onready var dots: Node2D = $Dots
@onready var turn: Sprite2D = $Turn



#Variables
# -6 = black king
# -5 = black queen
# -4 = black rook
# -3 = black bishop
# -2 = black knight
# -1 = black pawn
# 0 = empty
# 6 = white king
# 5 = white queen
# 4 = white rook
# 3 = white bishop
# 2 = white knight
# 1 = white pawn

var board : Array
var white : bool
var state : bool
var moves = []
var selected_piece : Vector2

func _ready():
	board.append([4,2,3,5,6,3,2,4])
	board.append([1,1,1,1,1,1,1,1])
	board.append([0,0,0,0,0,0,0,0])
	board.append([0,0,0,0,0,0,0,0])
	board.append([0,0,0,0,0,0,0,0])
	board.append([0,0,0,0,0,0,0,0])
	board.append([-1,-1,-1,-1,-1,-1,-1,-1])
	board.append([-4,-2,-3,-5,-6,-3,-2,-4])
	
	display_board()


func display_board():
	for i in BOARD_SIZE:
		for j in BOARD_SIZE:
			var holder=TEXTURE_HOLDER.instantiate()
			pieces.add_child(holder)
