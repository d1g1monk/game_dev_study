extends Node2D
var a 
var b 
var c: 
    get: return ((a**2) + (b**2)) ** 0.5 

func _ready():
    print(2.0/3.0)	
    a = 10.5
    b = 20.8
    printf()
func printf():
    print("Result is : %s" %c)
    a = 220.5
    print(c)
    b = 1555.5
    print(c)
    
