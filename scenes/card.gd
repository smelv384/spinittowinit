extends Node2D

const SELECTED_POSITION_Y = -10.0
const NON_SELECTED_POSITION_Y = 0.0
const LERP_SMOOTHING = 1.0

var word = "Horse"
var multiplier = 10
var hoverState = false
@onready var label: Label = $Visuals/Label
@onready var visuals: Node2D = $Visuals

signal selected
signal enter_hover_state
signal exit_hover_state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(label)
	label.text = word


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = word
	if hoverState:
		visuals.position.y = move_toward(visuals.position.y, SELECTED_POSITION_Y, LERP_SMOOTHING)
	else:
		visuals.position.y = move_toward(visuals.position.y, NON_SELECTED_POSITION_Y, LERP_SMOOTHING)

func set_word(new_word: String) -> void:
	word = new_word
	
func set_multiplier(new_multiplier: int) -> void:
	multiplier = new_multiplier

func _on_button_mouse_entered() -> void:
	hoverState = true
	enter_hover_state.emit(multiplier)

func _on_button_mouse_exited() -> void:
	hoverState = false
	exit_hover_state.emit(multiplier)

func _on_button_pressed() -> void:
	selected.emit(multiplier)
	queue_free()
