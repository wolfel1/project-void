extends Node2D

signal trapdoor_entered

@export var trapdoor_scene : PackedScene
@export var trapdoor_positions: Array[Marker2D] = []
var trapdoor: Area2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	trapdoor = trapdoor_scene.instantiate()
		
	var marker: Marker2D = trapdoor_positions[randf_range(0, trapdoor_positions.size() - 1)]
	trapdoor.position = marker.position
	trapdoor.body_entered.connect(_on_trapdoor_entered)
		
	add_child(trapdoor)
	
func _on_trapdoor_entered(body):
	trapdoor_entered.emit()
