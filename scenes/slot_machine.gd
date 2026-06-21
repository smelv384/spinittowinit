extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

const INTERMEDIATE_PRESSED_LABEL = "intermediate"
const LEVER_PRESSED_LABEL = "lever_pressed"
const DEFAULT_ANIMATION_LABEL = "plain"
const DIFF_FOR_INTERMEDIATE = 10
const DIFF_FOR_PUSHED = 10

var clicked = false
var pressed = false
var initialMousePosition

signal generate_cards

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clicked:
		var curr_mouse_position = get_global_mouse_position()
		if curr_mouse_position.y - initialMousePosition.y > (DIFF_FOR_INTERMEDIATE + DIFF_FOR_PUSHED):
			animated_sprite_2d.play(LEVER_PRESSED_LABEL)
			pressed = true
		elif curr_mouse_position.y - initialMousePosition.y > DIFF_FOR_INTERMEDIATE:
			animated_sprite_2d.play(INTERMEDIATE_PRESSED_LABEL)
		
	else:
		animated_sprite_2d.play(DEFAULT_ANIMATION_LABEL)

func _on_button_button_down() -> void:
	initialMousePosition = get_global_mouse_position()
	clicked = true

func _on_button_button_up() -> void:
	clicked = false
	timer.start()

# When slot machine is done running, generate new cards (emit signal to do so)
func _on_timer_timeout() -> void:
	generate_cards.emit()
	print("Generating cards from slot machine")
