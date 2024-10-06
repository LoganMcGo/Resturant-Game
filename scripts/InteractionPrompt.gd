extends Control

@onready var label = $Label

func _ready():
	hide()

func show_prompt(text: String):
	label.text = text
	show()

func hide_prompt():
	hide()
