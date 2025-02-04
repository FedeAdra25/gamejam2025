extends Area2D

func modularizacionParaQueFedeSeaFeliz(body) -> void:
	if(body.has_method("current")):
		body.current()

func _on_body_entered(body: Node2D) -> void:
	modularizacionParaQueFedeSeaFeliz(body)
func _on_body_exited(body: Node2D) -> void:
	modularizacionParaQueFedeSeaFeliz(body)
