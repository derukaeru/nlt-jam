class_name Interactable
extends StaticBody3D

signal interacted

func interact():
	interacted.emit()
