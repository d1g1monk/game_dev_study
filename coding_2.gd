extends Node2D
var x1_direction: int = 1
var y1_direction: int = 1
var speed: int = 3
#Sprite size for edge calculation
var sprite1_edge: float
#Sprite2
var sprite2_edge: float
var current_size: float
var grow_rate: float = 1.01
var is_growing = true

func _ready() -> void:
    
    position.x = 00	# This directly calls the parent node. No need for $Coding2.
    sprite1_edge = $Sprite2D.texture.get_size().x / 2
    sprite2_edge = $Sprite2D2.texture.get_size().x / 2
    print("Sprite_EDGE: %s" %sprite1_edge)
    print($Sprite2D.global_position)
    print($Sprite2D.rotation)
    print($Sprite2D.frame_coords )
    $Sprite2D.position.x = 550
    $Sprite2D.position.y = 300
    $Sprite2D2.position.x = 576
    $Sprite2D2.position.y = 324
    $Sprite2D.rotate(-20)
    print($Sprite2D.position)
    print($Sprite2D.rotation)
    $Sprite2D.rotation = -20
    print($Sprite2D.rotation)
    #Logic
    if 3==4 and 2>1 and 1<4 :
        print("cuck")
    elif 1==2:
        print(222)
    else:
        print(3333)
    print("real window: ", get_window().size)
    print("viewport: ", get_viewport().size)
    print("parent:", $Sprite2D.get_parent())
    print("self:", self)
    print("self:", self)
    print("parent:", get_parent())
    print($Sprite2D.texture.get_size())
    
        
func _process(delta: float) -> void:
     
    $Sprite2D.position.x = $Sprite2D.position.x + (speed * x1_direction)
    $Sprite2D.position.y = $Sprite2D.position.y + (speed * y1_direction)
    $Sprite2D.rotate(2)
    #Bounce
    if $Sprite2D.position.x + sprite1_edge >= 1152:
        x1_direction = -1
    if $Sprite2D.position.x - sprite1_edge<= 0:
        x1_direction = 1
    if $Sprite2D.position.y + sprite1_edge >= 648:
        y1_direction = -1
    if $Sprite2D.position.y - sprite1_edge <= 0:
        y1_direction = 1
    #2D2
    current_size = $Sprite2D2.texture.get_size().x * $Sprite2D2.scale.x
    print(current_size)
    if is_growing:
        $Sprite2D2.scale.x = $Sprite2D2.scale.x * grow_rate
        $Sprite2D2.scale.y = $Sprite2D2.scale.y * grow_rate
    else:
        $Sprite2D2.scale.x = $Sprite2D2.scale.x / grow_rate
        $Sprite2D2.scale.y = $Sprite2D2.scale.y / grow_rate
    if current_size >= 648:
        is_growing = false
    elif current_size <= 128:
        is_growing = true
    
        
        
    
           
        
        
    
        
        
                        
        
