extends Node2D
@onready var card_list: Node2D = $"../CardList"

const MAX_HAND_LENGTH = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_card() -> void:
	if (get_child_count() == MAX_HAND_LENGTH):
		return
	var new_card = load("res://scenes/Card.tscn")
	var cardVars = randi()
	if (cardVars % 2 == 0):
		new_card.set_word("Horse")
		new_card.set_multiplier(10)
	else:
		new_card.set_word("Banana")
		new_card.set_multiplier(-10)
	
	add_child(new_card)
	print("adding child")
