class_name Interactable
extends Area2D

signal interaction_started(interactable)
signal interaction_ended(interactable)

@export var interaction_label: String = "Interact"

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.has_method("_on_interaction_started"):
		interaction_started.emit(self)

func _on_body_exited(body):
	if body.has_method("_on_interaction_ended"):
		interaction_ended.emit(self)

func interact():
	print("Interacting with ", interaction_label)
	# Override this method in child classes to define specific interactions
