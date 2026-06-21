extends Node2D

@export_file var faces: Array[String]
@export var breakpoints: Array[int]
@export var default_face: int

var current_face:int
var happiness:int=0

@onready var button: Button = $Button
@onready var face := $Face

func _ready():
	current_face=default_face
	face.texture=load(faces[current_face])

func change_happiness(amount: int):
	happiness=clamp(happiness+amount, breakpoints[0], breakpoints[len(breakpoints)-1])
	# Getting angrier
	if happiness<breakpoints[current_face]:
		change_face(-1)
	elif happiness>breakpoints[current_face+1]:
		change_face(1)
	print(happiness)

func change_face(dir: int):
	print("changing face")
	# Bounded such that there is always one happier and one angrier for the preview func
	current_face=clamp(current_face+dir, 1, len(faces)-2)
	face.texture=load(faces[current_face])

# No bounds checking lmao
func hover_happy():
	face.texture=load(faces[current_face+1])
	
func hover_angry():
	face.texture=load(faces[current_face-1])
	
func unhover():
	face.texture=load(faces[current_face])

func _on_hand_enter_hover_state(multiplier: int) -> void:
	if (multiplier > 0):
		face.texture=load(faces[current_face+1])
	elif (multiplier < 0):
		face.texture=load(faces[current_face-1])

func _on_hand_exit_hover_state(multiplier: int) -> void:
	face.texture=load(faces[current_face])

func _on_hand_selected(multiplier: int) -> void:
	change_happiness(multiplier)
