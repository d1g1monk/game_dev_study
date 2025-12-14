extends CharacterBody2D

@export var mass: float = 1000.0
@export var force: float = 1.0

var direction = Vector2.LEFT
var speed = 15555
var colors = [
    preload("res://graphics/cars/red.png"),
    preload("res://graphics/cars/green.png"),
    preload("res://graphics/cars/yellow.png"),
]

func _ready() -> void:
    $Sprite2D.texture = colors.pick_random()
    if position.x >= 1152:
        direction.x = -1
    if position.x <= 0:
        direction.x = 1
        
func _process(delta: float) -> void:
    
    velocity = direction * speed * delta
    move_and_slide()
    for i in range(get_slide_collision_count()):
        var c = get_slide_collision(i)
        var other = c.get_collider()
        if "mass" in other and mass > other.mass:
            var factor = 1.0 - (other.mass/mass)
            other.velocity -= c.get_normal() * force * factor 
            
# Will detect the exit of sprites end from the screen
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    # This will then delete the sprite that left the screen 
    queue_free()


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
    if body.name == "Player":
        print("fuck...") # Replace with function body.
        # Call main's method to handle death
        #get_tree().root.get_node("Main").player_died()
