extends CharacterBody2D

var direction: Vector2 
var speed: int = 11111

func _physics_process(delta: float) -> void:
    direction = Input.get_vector("left", "right", "up", "down")
    # Got to use velocity and move_and_slide for collision involving scenes. Otherwise wont collide.
    velocity = direction * speed * delta
    animation()
    move_and_slide()
    
    if Input.is_action_just_pressed("space"):
        print("space")
 
func animation():
    if direction:  # If direction is not null do nothing as animation is already adjusted as loop always
        
        if direction.x > 0:
            $Player_sprite.flip_h = true
        elif direction.x < 0:
            $Player_sprite.flip_h = false
        # $Player_sprite.flip_h = direction.x > 0  ## We could instead use that as well but too abstract.
        if direction.x != 0 and direction.y == 0:
            $Player_sprite.animation = "left"
        if direction.y  > 0:
            $Player_sprite.animation = "down"
        if direction.y < 0:
            $Player_sprite.animation = "up"   
        if direction.y > 0 and direction.x != 0:
            $Player_sprite.animation = "down"   
    else:
        $Player_sprite.frame = 0      # If no direction then only play frame 0 which is idle pose
