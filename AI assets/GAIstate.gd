extends KinematicBody
var gravity = -9.8
var velocity = Vector3()

enum {
	ROAM	#use raycast to detect walls to allow soul to traverse the maze.
			#Treats player as a wall and tries to pathwind away from it
	RESPAWN		#if the soul is idle too long have it respawn in case of out of bounds errors
}

var state = ROAM

const SPEED = 5		#use similar physics to player. Slower speed so the AI can be caught
const ACCELERATION = 4
const DE_ACCELERATION = 5

onready var raycast = $RayCast
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _process(delta):	#checks state to run algorithm 
	velocity.y += gravity * delta
	var desired_velocity = SPEED
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	if velocity != Vector3():
		velocity = move_and_slide(velocity, Vector3.UP, true)
	#match state:
	#	ROAM:	#put ROAM algorithm here
	#		if RayCast.is_colliding():
				#have AI turn right and check again
	#		else
				#have AI move forward
			
	#	RESPAWN:	#put respawn algorithm here
