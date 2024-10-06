extends Interactable

func _ready():
	super._ready()
	interaction_label = "Use Counter"
	print("Counter initialized")
	
	# Manual signal connections
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	print("Body entered counter area: ", body.name)
	if body.has_method("_on_interaction_started"):
		body._on_interaction_started(self)
	elif body.get_parent().has_method("_on_interaction_started"):
		body.get_parent()._on_interaction_started(self)

func _on_body_exited(body):
	print("Body exited counter area: ", body.name)
	if body.has_method("_on_interaction_ended"):
		body._on_interaction_ended(self)
	elif body.get_parent().has_method("_on_interaction_ended"):
		body.get_parent()._on_interaction_ended(self)

func interact():
	print("Using the counter")
	# Add your counter-specific interaction code here
