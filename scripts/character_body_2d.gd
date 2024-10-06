extends CharacterBody2D

@export var speed = 300

var current_interactable: Interactable = null
@onready var interaction_prompt = $InteractionPrompt

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  # Hide the mouse cursor
	if not interaction_prompt:
		push_error("InteractionPrompt node is missing from the Player scene!")

func _physics_process(delta):
	# Get input direction
	var input_vector = Input.get_vector("left", "right", "up", "down")
	
	# Set the velocity
	velocity = input_vector * speed
	
	# Move the character
	move_and_slide()

func _unhandled_input(event):
	if event.is_action_pressed("interact") and current_interactable:
		current_interactable.interact()

func _on_interaction_started(interactable: Interactable):
	print("Interaction started with: ", interactable.name)
	current_interactable = interactable
	if interaction_prompt:
		interaction_prompt.show_prompt(interactable.interaction_label)

func _on_interaction_ended(interactable: Interactable):
	print("Interaction ended with: ", interactable.name)
	if current_interactable == interactable:
		current_interactable = null
		if interaction_prompt:
			interaction_prompt.hide_prompt()
