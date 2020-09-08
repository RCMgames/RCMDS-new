## RCMDS readme
---
### Page Layout
Setup lines: `1-5`
1. robot name
2. ip
3. port
4. telemetry data (see below)
5. number of sent variables,number of received variables
6. free line

Object lines: `7-`
list groups of objects in order:
1. Buttons
2. Axes
3. UIButtons
4. UIIndicators
5. UIJoysticks
6. UISlider
 
leave a blank line between groups

---
### Variables and objects
#### Variables:
variables are numbered starting at 0, and counting up till your total number of input and output variables

imput variables are ones you send to the bot, output variables are ones you recieve

numerically, output variables come after imput ones

#### Objects:
- Imput Objects:
	- Buttons:
		- controls one output
		- acts like a boolean
	- Axes:
		- controls one output
		- acts like a float
- UI Objects:
	- UIButtons:
		- controlled by a keyboard key and/or a gamepad button
		- draws a button that can be pressed
	- UIIndicators:
		- controlled by a variable
		- activates when variable is within set range
		- draws a circle that changes color when activated
	- UIJoysticks:
		- controlled by two outputs, one for x and one for y
		- draws a square with a circle inside that moves in 2 dimensions
	- UISliders:
		- controlled by one output
		- draws a rectangle with another rectangle inside that moves in one dimension
---
### Object Variables
- Buttons: `variable,keyboardKey,gamepadButton,type,onHold,onPressed,onReleased,onOff`
	- variable: `int`
		- determines which variable is being modified
	- keyboardKey: `letter or number or ACSII value`
		- determines which key activates button (can be left blank)
	- gamepadButton: `(look up documentation)`
		- determines which gamepad button activates button (can be left blank)
	- type: `int`
		- determines the behavior of button
			1: standard button
			2: toggle button
	- onHold: `float` 
		- determines what number to set the specified output to while button is activated
	- onPressed: `float`
		- determines what number to set the specified output to the first frame button is pressed
	- onReleased: `float`
		- determines what number to set the specified output to the first frame button is released
	- onOff: `float`
		- determines what number to set the specified output to while button is not activated

- Axes: `variable,keyboardKey1,keyboardKey2,gamepadAxis,type,step,min,max,inverted`
	- variable: `int`
		- determines which output is being modified
	- keyboardKey1: `letter or number or ACSII value`
		- determines the negative key (can be left blank)
	- keyboardKey1: `letter or number or ACSII value`
		- determines the positive key (can be left blank)
	- gamepadAxis: `(look up documentation)`
		- determines which gamepad axis controls the axis (can be left blank)
	- type: `int`
		- determines the behavior of axis
			1: returns to 0
			2: stays on value
	- step: `float`
		- determines how fast type 2 axis can change value
	- min: `float`
		- determines the min value of axis
	- max: `float`
		- determines the max value of axis
	- inverted: `boolean`
		- determines whether gamepad axis is flipped or not

- UIButtons: `keyboardKey,gamepadButton,type,x,y,color1,color2,size`
	- keyboardKey: `letter or number or ACSII value`
		- determines which key activates button (can be left blank)
	- gamepadButton: `(look up documentation)`
		- determines which gamepad button activates button (can be left blank)
	- type: `int`
		- determines the behavior of button
			1: standard button
			2: toggle button
	- x: `float`
		- determines how far left/right button appears (0 is left, 1 is right)
	- y: `float`
		- determines how far up/down button appears (0 is up, 1 is down)
	- color1: `RGB hex value`
		- determines the color of button when activated
	- color2: `RGB hex value`
		- determines the color of button when not activated
	- size: `int`
		- determines size of button
		
- UIIndicator: `variable,min,max,x,y,color1,color2,size`
	- variable: `int`
		- determines what variable to indicate
	- min: `float`
		- sets minimum for indtcated range
	- max: `float`
		- sets maximum for indtcated range
	- x: `float`
		- determines how far left/right indicator appears (0 is left, 1 is right)
	- y: `float`
		- determines how far up/down indicator appears (0 is up, 1 is down)
	- color1: `RGB hex value`
		- determines the color of indicator when activated
	- color2: `RGB hex value`
		- determines the color of indicator when not activated
	- size: `int`
		- determines size of indicator

- UIJoysticks: `xVariable,yVariable,x,y,color,size`
	- xVariable: `int`
		- determines which output controls x axis of joystick
	- yVariable: `int`
		- determines which output controls y axis of joystick
	- x: `float` [0 to 1]
		- determines how far left/right axis appears (0 is left, 1 is right)
	- y: `float` [0 to 1]
		- determines how far up/down axis appears (0 is up, 1 is down)
	- color: `RGB hex value`
		- determines background color of joystick
	- size: `int`
		- determines size of joystick

- UISliders: `variable,min,max,x,y,color,orientation,size`
	- variable: `int`
		- determines which output controls slider
	- min: `float`
		- determines the min value of slider
	- max: `float`
		- determines the max value of slider
	- x: `float` [0 to 1]
		- determines how far left/right slider appears (0 is left, 1 is right)
	- y: `float`
		- determines how far up/down slider appears (0 is up, 1 is down)
	- color: `RGB hex value`
		- determines background color of slider
	- orientation: `int`
		- determines orientation of slider (will possibly add variable angles in future)
			1: vertical
			2: horizontal
	- size: `int`
		- determines size of slider
---
### Telemetry Data:
telemetry data can be changed on a per-robot basis
different lines are separated with a semicolon (;), while different elements within the same line are separated with a comma.
to display a string just type the string, to display a variable, type 'var:' then the variable name/number
variables that rcmds recognizes:
- ip: displays the robot's ip
- port: displays the robot's port
- ping: displays the robot's ping
- volt: displays the robot's battery voltage
- [any number]: displays that variable (var:0 displays variable 0)

to have a blank line you can put two semicolons next to each other

example telemetry line:

    ping: ,var:ping;ip: ,var:ip;port: ,var:port;Battery:; ,var:volt, volts;;0: ,var:0;1: ,var:1;2: ,var:2;3: ,var:3;4: ,var:4

###### window size and layout can be changed in the setup.txt file, ask weston or joshua if you want to edit that
