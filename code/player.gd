extends CharacterBody2D

@export var mass: float = 80.0
@export var force: float = 1.0

var direction: Vector2 
var speed: int = 11111
var hit: bool = false
@export var was_colliding_last_frame:bool = false
# Physics
var weight: int = 80

func _physics_process(delta: float) -> void:
    direction = Input.get_vector("left", "right", "up", "down")
    # Got to use velocity and move_and_slide for collision involving scenes. Otherwise wont collide.
    velocity = direction * speed * delta
    animation()
    move_and_slide()
    
     # Performant collision print
    var is_colliding_this_frame = get_slide_collision_count() > 0
    # 2. Logic: Check for the transition (Was NOT colliding, but IS NOW colliding)
    if is_colliding_this_frame and not was_colliding_last_frame:
        print("Player is hit (Initial Contact)")
    if not is_colliding_this_frame and was_colliding_last_frame:
        print("Collision ended")
    # This code only runs on the first frame of contact.
    was_colliding_last_frame = is_colliding_this_frame     

    
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
