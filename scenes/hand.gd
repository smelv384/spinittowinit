extends Node2D

@onready var card_list: Node2D = $CardList

signal selected
signal enter_hover_state
signal exit_hover_state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_slot_machine_generate_cards() -> void:
	card_list.generate_card_set()


func _on_card_selected(multiplier: int) -> void:
	selected.emit(multiplier)

func _on_card_exit_hover_state(multiplier: int) -> void:
	exit_hover_state.emit(multiplier)


func _on_card_enter_hover_state(multiplier: int) -> void:
	enter_hover_state.emit(multiplier)
