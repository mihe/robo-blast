extends Node3D

const FLYING_PIECES := 3
const THROW_STRENGTH := 500

@onready var _pieces_idx := [0, 1, 2, 3, 4, 5]

func _ready() -> void:
	$Piece1.hide()
	$Piece2.hide()
	$Piece3.hide()
	$Piece4.hide()
	$Piece5.hide()
	$Piece6.hide()

	_pieces_idx.shuffle()

	for i in range(FLYING_PIECES):
		var piece_idx: int = _pieces_idx[i]
		var piece: RigidBody3D = get_child(piece_idx)
		piece.collision_layer = 0b10
		piece.collision_mask = 0b10
		piece.freeze = false
		piece.visible = true

		var rand_vector := (Vector3.ONE * 0.5) - Vector3(randf(), randf(), randf())

		piece.apply_force(rand_vector * THROW_STRENGTH, rand_vector)
