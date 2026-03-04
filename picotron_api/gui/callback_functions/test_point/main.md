# test_point

## Overview

A function used to test if a point is over a GUI object; modifying this allows for you to have non-rectangular GUI objects.

A non-rectangular element can be defined by supplying a test_point callback function that takes self,x,y as parameters and returns true when the element occupies that pixel inside the bounding rectangle.

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

Create some circular draggable elements
```lua
gui = create_gui()
for xx=100,300,100 do
    gui:attach{
        x = xx, y = 95, width = 80, height = 80,
        cursor = "grab",
        radius = 39, -- custom attribute
        draw = function(self, msg)
            circfill(self.width/2, self.height/2, self.radius, msg.has_pointer and 30 or 2)
        end,
        drag = function(self,msg)
            self:bring_to_front()
            self.x += msg.dx
            self.y += msg.dy
        end,
        test_point = function(self, x, y)
            local dx, dy = self.width/2-x, self.height/2-y
            return sqrt(dx*dx+dy*dy) < self.radius -- true when inside circle
        end
    }
end
function _draw() cls() gui:draw_all() end
function _update() gui:update_all() end
```