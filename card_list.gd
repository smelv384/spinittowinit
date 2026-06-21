extends Node2D
@onready var card: Node2D = $Card


const HAND_SIZE = 5
const GENERATION_COUNT = 3

var cards = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_card_set() -> void:
	for i in range(0, GENERATION_COUNT):
		generate_card()

func generate_card() -> void:
	if (cards.size() >= HAND_SIZE):
		return
	var card_scene = load("res://scenes/Card.tscn")
	var new_card = card_scene.instantiate()
	var cardVars = randi()
	
	# Insantiate variables
	if (cardVars % 2 == 0):
		#new_card.set_word("Horse")
		print("Horse")
		new_card.set_multiplier(10)
	else:
		#new_card.set_word("Banana")
		print("Banana")
		new_card.set_multiplier(-10)
	
	if cards.size() == 0:
		new_card.position.x = 0
	else:
		new_card.position.x = cards[cards.size() - 1].position.x - 250
	cards.append(new_card)
	add_child(new_card)
