extends Node2D

var pos  = Vector2.RIGHT
var speed: float = 5
var direction = Vector2(1, 1)   
var arr: Array = [5, 6, "a", 7, "AbC", ["a", 1, 3, "asd"]]
var dictionary: Dictionary = {false: ["a", 2, "asc"], "asd": 1, 15: "b", ["arr", 2, 156]: 3123213, 4: ["arr1", 2, 153]}
var current_scale
var edge:
    get: return current_scale / 2

var color_wheel: float = 0.0
var color: Color = Color.from_rgba8(fmod(color_wheel, 1.0), 1.0, 1.0)

func _ready() -> void:
    print(Vector2(2,5)*3)
    print(arr[0], " ", arr[2], " ", arr[5])
    print("ARRAY")
    for i in arr:
        print(i)
    print("Sel_dic: ", dictionary[false], dictionary["asd"], " ", dictionary[15], " ", dictionary[["arr", 2, 156]])
    print("Dictionary1")
    for i in dictionary.keys(): # Key based grep
        print(i)
    print("Dictionary2")
    for i in dictionary.values(): # Value based grep
        print(i)
    $Icon.position.x = 500
    $Icon.position.y = 300
                
func _process(delta: float) -> void:
        current_scale = $Icon.texture.get_size().x * $Icon.scale.x
        $Icon.position = $Icon.position + direction *speed 
        color = Color.from_hsv(fmod(color_wheel, 1.0), 1.0, 1.0)
        color_wheel = color_wheel + delta * 0.2
                   
        if $Icon.position.x + edge >=1152:
            direction.x *= -1
            $Icon.modulate = color
            color_wheel += 0.5    
        if $Icon.position.x - edge <= 0:
            direction.x *= -1
            $Icon.modulate = color
            color_wheel += 0.5
        if $Icon.position.y + edge >= 648:
            direction.y *= -1
            $Icon.modulate = color
            color_wheel += 0.5
        if $Icon.position.y - edge <= 0:
            direction.y *= -1
            $Icon.modulate = color
            color_wheel += 0.5
