-Page Layout-
Setup lines: 1-5
1: robot name
2: ip
3: port
4: telemetry data
5: free line

Object lines: 6-
	list groups of objects in order:
		1:Buttons
		2:Axes
		3:UIButtons
		4:UIIndicators
		5:UIJoysticks
		6:UISliders
	leave a blank line between groups

-Variables-
Imput Variables: (0-7)
	variables that you send to the bot
		-variables 1,2,3,4 are always forwards,strafe,turn,intake
Output Variables: (8-15)
	variables that you recieve from the bot
		-variable 8 is always battery voltage

-Object Descriptions-
Imput Objects:
	Buttons:
		-controls one output
		-acts like a boolean
	Axes:
		-controls one output
		-acts like a float
UI Objects:
	UIButtons:
		-controlled by a keyboard key and/or a gamepad button
		-draws a button that can be pressed
	UIIndicators:
		-controlled by a variable
		-activates when variable is within set range
		-draws a circle that changes color when activated
	UIJoysticks:
		-controlled by two outputs, one for x and one for y
		-draws a square with a circle inside that moves in 2 dimensions
	UISliders:
		-controlled by one output
		-draws a rectangle with another rectangle inside that moves in one dimension

-Object Variables-
Buttons: variable,keyboardKey,gamepadButton,type,onHold,onPressed,onReleased,onOff
	variable: int [0 to 7]
		determines which variable is being modified
	keyboardKey: letter or number
		determines which key activates button
	gamepadButton: (look up documentation)
		determines which gamepad button activates button
	type: int [1 or 2]
		determines the behavior of button
			1: standard button
			2: toggle button
	onHold: float [-1 to 1]
		determines what number to set the specified output to while button is activated
	onPressed: float [-1 to 1]
		determines what number to set the specified output to the first frame button is pressed
	onReleased: float [-1 to 1]
		determines what number to set the specified output to the first frame button is released
	onOff: float [-1 to 1]
		determines what number to set the specified output to while button is not activated

Axes: variable,keyboardKey1,keyboardKey2,gamepadAxis,type,step,min,max,inverted
	variable: int [0 to 7]
		determines which output is being modified
	keyboardKey1: letter or number
		determines the negative key
	keyboardKey1: letter or number
		determines the positive key
	gamepadAxis: (look up documentation)
		determines which gamepad axis controls the axis
	type: int [1 or 2] (or more if we add more modes)
		determines the behavior of axis
			1: returns to 0
			2: stays on value
	step: float
		determines how fast type 2 axis can change value
	min: float [-1 to 1]
		determines the min value of axis
	max: float [-1 to 1]
		determines the max value of axis
	inverted: boolean
		determines whether gamepad axis is flipped or not

UIButtons: keyboardKey,gamepadButton,type,x,y,color1,color2,size
	keyboardKey: letter or number
		determines which key activates button
	gamepadButton: (look up documentation)
		determines which gamepad button activates button
	type: int [1 or 2]
		determines the behavior of button
			1: standard button
			2: toggle button
	x: float [0 to 1]
		determines how far left/right button appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down button appears (0 is up, 1 is down)
	color1: RGB hex value
		determines the color of button when activated
	color2: RGB hex value
		determines the color of button when not activated
	size: int
		determines size of button
		
UIIndicator: variable,min,max,x,y,color1,color2,size
	variable: int [0 to 15]
		determines what variable to indicate
	min:
		sets minimum for indtcated range
	max:
		sets maximum for indtcated range
	x: float [0 to 1]
		determines how far left/right button appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down button appears (0 is up, 1 is down)
	color1: RGB hex value
		determines the color of button when activated
	color2: RGB hex value
		determines the color of button when not activated
	size: int
		determines size of button

UIJoysticks: xVariable,yVariable,x,y,color,size
	xVariable: int [0 to 15]
		determines which output controls x axis of joystick
	yVariable: int [0 to 15]
		determines which output controls y axis of joystick
	x: float [0 to 1]
		determines how far left/right axis appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down axis appears (0 is up, 1 is down)
	color: ARGB hex value (alpha red green blue)
		determines background color of joystick
	size: int
		determines size of joystick

UISliders: variable,min,max,x,y,color,orientation,size
	variable: int [0 to 15]
		determines which output controls slider
	min: float [-1 to 1]
		determines the min value of slider
	max: float [-1 to 1]
		determines the max value of slider
	x: float [0 to 1]
		determines how far left/right slider appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down slider appears (0 is up, 1 is down)
	color: ARGB hex value (alpha red green blue)
		determines background color of slider
	orientation: int [1 or 2] (will possibly add variable angles in future)
		determines orientation of slider
			1: vertical
			2: horizontal
	size: int
		determines size of slider

window size and layout can be changed in the setup.txt file
ask weston or joshua if you want to edit that