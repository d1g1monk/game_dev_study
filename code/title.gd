extends Control

func _ready():
    mouse_filter = Control.MOUSE_FILTER_STOP  # or MOUSE_FILTER_STOP



        
        
#func _process(_delta: float) -> void:
#    if (
#        Input.is_action_just_pressed("mouse1") or 
#        Input.is_action_just_pressed("space")
#        ):
#        get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_label_3_button_up() -> void:
    print("Restarting")
    get_tree().change_scene_to_file("res://scene/main.tscn")       
