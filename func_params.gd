extends Node2D

var global_var = "global_var"

enum LogLevel { FATAL=1, ERROR=2, WARN=3, INFO=4, DEBUG=5}
var CURRENT_LEVEL = LogLevel.INFO
var grep: Dictionary = {1: "FATAL", 2: "ERROR", 3: "WARN", 4: "INFO", 5: "DEBUG"}

var result: float
var func_array =  arrara  # Store function as variable
var robot_path = [Vector2(1, 0), Vector2(1, 1), Vector2(1, 2), Vector2(2, 2), Vector2(3, 2), Vector2(4, 2), Vector2(5, 2)]

var pos2: Vector2

func _ready() -> void:
    test_func("asdsad") # We only entered mandatory one as the others are already declared
    # If not entered a value; 
    # a param becomes mandatory to 
    # enter when the func is being called
    # as seen above
    
    
    print (global_var)
    print("DEBUG: ", LogLevel.DEBUG)
    print("INFO: ", LogLevel.INFO)
    print("WARN: ", LogLevel.WARN)
    print("ERROR: ", LogLevel.ERROR)
    print("FATAL: ", LogLevel.FATAL)
    CURRENT_LEVEL = 6
    game_log("This is debug: ", LogLevel.DEBUG) 
    game_log("This is info: ", LogLevel.INFO) 
    game_log("This is warn: ", LogLevel.WARN) 
    game_log("This is error: ", LogLevel.ERROR) 
    game_log("This is fatal: ", LogLevel.FATAL) 
    if return_func() == 110:
        print(grep.values()[0])
    print(calc(5.4, 88.553, "plus"))
    print(calc(5.4, 88.553, "minus"))
    print(calc(5.4, 88.553, "divide"))
    print(calc(5.4, 88.553, "multiply"))
    $Icon.position = Vector2(155, 165)
    # .length calculattes shortest distance between two points. Euclidian length.
    var distance = Vector2(15, 16).length()
    for i:int in range (0, 3):
        print("Euclidian.length: ", distance)
        distance += 1
    # while loop
    var i = 0
    var x = 5
    while i < x:
        x -= 1
        print("YEYEEYEYE")      
    var num_array = [0,1,2,3,4]
    for b in num_array:
        print(num_array)
    func_array.call(Vector2(3,1))

func arrara(v1: Vector2, v2: Vector2= Vector2(1,1)):
    print(v1, v2)
    
func test_func(param1: String, param2: int = 123, param3: String = "bbbbbb"):
    global_var = "gl_var_overwritten"
    var local_var = "local_var"
    print(local_var)
    print(global_var)
    print("String")
    print(param1,  " ", param2, " ", param3)
    
func return_func(A1 = "asdaasdas", A2 = "2", A3 = "2", A4 = "2", A5 = "2") -> int:
    print(A1)  
    return 110 
    
func game_log(msg: String, level: int):
    print("CURRENT_LEVEL = ", CURRENT_LEVEL, " ", "LEVEL = ", level)
    if level <= CURRENT_LEVEL and !level > 6:
        print(msg)
      
func calc(num1: float, num2: float, operator: String) -> float:
    
    if operator == "plus":
        result = num1+num2           
    elif operator == "minus":
        result = num1-num2 
    elif operator == "divide":
        result = num1/num2   
    elif operator == "multiply":
        result = num1*num2
    return result 

func _process(delta: float) -> void:
    # t must be frame-rate independent. we can use 0-1 values but experience then will differ for every system.
    pos2 = lerp(pos2, get_local_mouse_position(), 15 * delta)
    $Icon.position = pos2
