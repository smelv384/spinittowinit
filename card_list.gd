extends Node2D
@onready var card: Node2D = $Card
@onready var hand: Node2D = $".."
@onready var label: Label = $Visuals/Label


const HAND_SIZE = 5
const GENERATION_COUNT = 3
const POSITION_OFFSET = -250.0
const LERP_SMOOTHING = 0.1

var cards = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	reposition_cards()
	
func generate_card_set() -> void:
	for i in range(0, GENERATION_COUNT):
		generate_card()

func generate_card() -> void:
	if (cards.size() >= HAND_SIZE):
		return
	var card_scene = load("res://scenes/Card.tscn")
	var new_card = card_scene.instantiate()
	new_card.add_child(label)
	var cardVars = randi()
	
	# Insantiate variables
	if (cardVars % 2 == 0):
		new_card.set_word("Horse")
		print("Horse")
		new_card.set_multiplier(10)
	else:
		new_card.set_word("Banana")
		print("Banana")
		new_card.set_multiplier(-10)
	
	new_card.enter_hover_state.connect(hand._on_card_enter_hover_state)
	new_card.exit_hover_state.connect(hand._on_card_exit_hover_state)
	new_card.selected.connect(hand._on_card_selected)
	
	if cards.size() == 0:
		new_card.position.x = 0
	else:
		new_card.position.x = (cards.size()) * -250
	cards.append(new_card)
	add_child(new_card)
	
	
# Credit: reddit user Nkzar:
# https://www.reddit.com/r/godot/comments/1244fad/how_can_i_check_for_freed_instances_in_an_array/
func reposition_cards() -> void:
	var clean_cards := []
	for card in cards:
		if is_instance_valid(card):
			clean_cards.append(card)
	cards = clean_cards
	for i in range(0, clean_cards.size()):
		cards[i].position.x = lerp(cards[i].position.x, POSITION_OFFSET * i, LERP_SMOOTHING)
	
