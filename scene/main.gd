extends Node2D
# MAIN*********
var car_Scene: PackedScene = preload("res://scene/car.tscn")
var score: int
var car_colors

func _on_timer_timeout() -> void:
    print("Timer is on")

func _on_event_trigger_body_entered(body: Node2D) -> void:
    print(str(body) + "Body entered")
    call_deferred("change_scene")
    if score < Global.score:
        Global.score = score 

func change_scene():
    get_tree().change_scene_to_file("res://scene/title.tscn")

func _on_car_timer_timeout() -> void:
    var car = car_Scene.instantiate()  # Need to add node type so that car.position can be picked up by Godot
    var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
    car.position = pos_marker.position
    $Objects.add_child(car) # Spawn the object
    # Get a random children from the node and store as a var
 

func _on_score_timer_timeout() -> void:
    score += 1  
    $CanvasLayer/TimeLabel.text = str(score)

func title_screen():
    call_deferred("change_scene")
    
