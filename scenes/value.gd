extends Node2D

var word
var multiplier
@onready var label: Label = $"../Visuals/Label"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_word(new_word: String) -> void:
	word = new_word
	label.text = new_word
	
func set_multiplier(new_multiplier: int) -> void:
	multiplier = new_multiplier
