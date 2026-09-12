# Math basics
This will be a little overview over gamedev math and when and how to use it.
Let's get started:

## Distances

One would often like to know the distance between two points in 2D space. Common examples are collision checks between bullets and actors, checking whether the player is close to a checkpoint on a map and using the distance to display the progress towards a goal. 

There are two common ways to get the distance between two points. The first one is less exact but faster, the 2nd one is slower but exact. You'll find yourself mainly using the first one as it is often precise enough. It is called the manhattan distance. 

You'll need two points to compare, both with an x and a y coordinate. 

The manhattan distance is the sum of the absolute value of the difference in y and the absolute value of the difference in x.
```
function manhattan_distance(x1,y1,x2,y2)
	return abs(x1-x2)+abs(y1-y2)
end
```

This function is fine to use for most cases in the Picotron. If you need a more precise distance you'd use the euclidean distance.
```
function euclidean_distance(x1,y1,x2,y2)
	return sqrt( (x1-x2)^2 + (y1-y2)^2 )
end
```
The problem with the euclidean distance that it tends to overflow because of the Picotron's limited number size. You can circumvent this by only using it for distances you know will be small. 

## Percentages and progress bars

A common usecase is displaying the remaining time of a round or the progress of XP collected towards the next level-up. Luckily this is rather straightforward to do. You take your current value and divide it by the max value to get a value between 1 and 0. The result can also be greater than 1 if your value exceeds the max value, so consider clamping it by using "mid(0, value/max_value, 1)". 
```
local value=33
local max_value=100
local progress=value/max_value
```
Your value can be anything you'd like, for example the player health, the remaining time of a timer or the loading progress.

Your max_value in these examples would be your max health, the total length of that timer or the amount of elements to be loaded in.

To display it you can plug the progress value in a drawing function like rect(). Don't forget to also draw a reference frame so that progress relates to something. In this example we draw a rect with the maximum size over our partial rect.

```
rectfill(0,0,100*progress,10,8)
rect(0,0,100,10,7)
```
This results in a neat little health bar.

## Linear interpolation

A mighty fancy term for something rather simple. Here is a common usecase. You want the camera to smoothly move to the next camera position instead of jumping straight to it. Lots of top down games do this!

To achieve this we don't directly set our camera value to the goal position, we instead add a fraction of the difference to the current position. The fraction dictates how fast we reach the goal value.
```
local lerp_value=.25 --determines the speed of linear interpolation
local diff_x=(goal_camera_pos.x-player.camera.pos.x)
local diff_y=(goal_camera_pos.y-player.camera.pos.y)
player.camera.pos.x+=diff_x*lerp_value
player.camera.pos.y+=diff_y*lerp_value
```
This can also be used to smoothly empty or fill up a health bar like the one earlier by instead of directly setting the value interpolating towards it. It is REALLY useful and makes games feel polished. 
There are all kinds of interpolations, have a look at the Animation Curves cheat sheet on the BBS!

## sin(),cos() and atan2()

Arguably the most helpful set of functions, mainly when it comes to circles and directions(vectors).

Picotron does not measure in degrees but rather in radians. 0 is east(right), 0.5 is west(left) going counterclockwise. This might be upside down for people familiar with math, but in Picotron a higher y position is down, not up.

Let's say you want to create a vampire survivors clone and need the enemies to move towards the player. To achieve this you can put both the enemies position and the player position in atan2 to get the radians. atan2 takes two arguments, the x vector and the y vector. 

We subtract the x position of enemy from the players x position to get the x vector and do the same for the y vector.
```
local angle=atan2(player.x-enemy.x,player.y-enemy.y)
```
Next we'll put the resulting angle in cos for the x direction and sin for the y direction (yes, very counterintuitive. Also not strictly necessary to do this way, but we'll try to stick to the Picotron's logic). Let's start by drawing a line indicating this vector(direction) from the enemy to the player. 
```
local x_vector=cos(angle)
local y_vector=sin(angle)
```
This vector will always have a maximum length of 1, so to get a longer line we multiply that result by something (in this case 5) to amplify it. If our enemy were to move this would be the speed.
```
local x_vector=cos(angle)*5
local y_vector=sin(angle)*5
```

Lastly let's draw this by drawing a line from the enemies center to the calculated offset.
```
line(enemy.pos.x+6,enemy.pos.y+6,enemy.pos.x+6+x_vector,enemy.pos.y+6+y_vector,7)
```
This will result in a line pointing from the enemy to the player.


Instead of drawing a line we could use the vector we calculated to let the enemy move towards our player. We just add the vectors to the x and y position of our enemy and voila! we got an enemy following the player. Play around with our "speed" value to achieve the desired velocity.

And that is how we can use atan2, sin and cos to make an enemy follow the player. The same logic applies to bullets, too. Give spawned bullets an angle on creation and just continue to add the vector to it's position. If you want guided bullets you can also update the angle each frame. 

The main things to remember:

- The angle value increases with counterclockwise movement

- subtract the actors position from the target position to get the angle to the target

- cos(angle) for y vector, sin(angle) for x vector

- multiply the vector to amplify it, not the angle.

## Conclusion

These are the basics! I hope this was helpful to some. Have a great day and keep hand-writing code!
