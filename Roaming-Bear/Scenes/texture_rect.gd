
# Yeah so this node is the circle with the steps in the concept art (remember?)
# What I want is for this circle to act as a mask
# Within this mask will be a box texture that rises in proportion to the amount of steps that the player has done
# The box texture stays within the bounds of the circle texture, and will simulate "fluid" "filling up" the circle

func BoxRise():
	#So when the amount of detected steps rises, increase the x value for the box
