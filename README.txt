-Page Layout-
Setup lines: 1-5
1: robot name
2: ip
3: port
4: name of gamepad/joystick

Object lines: 5-
	list groups of objects in order:
		1:Buttons
		2:Axes
		3:UIButtons
		4:UIJoysticks
		5:UISliders
	leave a blank line between groups

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
	UIJoysticks:
		-controlled by two outputs, one for x and one for y
		-draws a square with a circle inside that moves in 2 dimensions
	UISliders:
		-controlled by one output
		-draws a rectangle with another rectangle inside that moves in one dimension

-Object Variables-
Buttons: variable,keyboardkey,gamepadbutton,onHold,onPressed,onReleased,onOff
	variable: int [0 to 7]
		determines which variable is being modified
	keyboardKey: letter or number
		determines which key activates button
	gamepadButton: (look up documentation)
		determines which gamepad button activates button
	onHold: float [-1 to 1]
		determines what number to set the specified output to while button is activated
	onPressed: float [-1 to 1]
		determines what number to set the specified output to the first frame button is pressed
	onReleased: float [-1 to 1]
		determines what number to set the specified output to the first frame button is released
	onOff: float [-1 to 1]
		determines what number to set the specified output to while button is not activated

Axes: variable,keyboardkey1,keyboardkey2,gamepadAxis,type,step,min,max,inverted
	variable: int [0 to 7]
		determines which output is being modified
	keyboardKey1: letter or number
		determines the negative key
	keyboardKey1: letter or number
		determines the positive key
	gamepadAxis: (look up documentation)
		determines which gamepad axis controls the axis
	type: int 1 or 2 (or more if we add more modes)
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

UIButtons: keyboardkey,gamepadbutton,x,y,color1,color2,size
	keyboardkey: letter or number
		determines which key activates button
	gamepadbutton: (look up documentation)
		determines which gamepad button activates button
	x: float [0 to 1]
		determines how far left/right button appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down button appears (0 is up, 1 is down)
	color1: ARGB hex value (alpha red green blue)
		determines the color of button when activated
	color2: ARGB hex value (alpha red green blue)
		determines the color of button when not activated
	size: int
		determines size of button

UIJoysticks: xvariable,yvariable,x,y,color,size
	xvariable: int [0 to 7]
		determines which output controls x axis of joystick
	yvariable: int [0 to 7]
		determines which output controls y axis of joystick
	x: float [0 to 1]
		determines how far left/right axis appears (0 is left, 1 is right)
	y: float [0 to 1]
		determines how far up/down axis appears (0 is up, 1 is down)
	color: ARGB hex value (alpha red green blue)
		determines background color of joystick
	size: int
		determines size of joystick

UISliders: variable,x,y,color,orientation,size
	variable: int [0 to 7]
		determines which output controls slider
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