//variable,keyboardkey,gamepadbutton,onHold,onPressed,onReleased,onOff
class Button {
  int variable;
  int keyboardKey;
  String gamepadButton;
  float onHold;
  float onPressed;
  float onReleased;
  float onOff;
  boolean pressed;
  boolean wasPressed = false;
  Button (String[] configData) {
    variable = int(configData[0]);
    if (configData[1].length()!=0) {
      if (configData[1].length()>1) {
        keyboardKey=int(configData[1]);
      } else {
        keyboardKey = int(configData[1].charAt(0));
      }
    } else {
      keyboardKey = 0;
    }
    if (configData[2].length()>0) {
      gamepadButton = configData[2];
    } else {
      gamepadButton = null;
    }
    onHold = float(configData[3]);
    onPressed = float(configData[4]);
    onReleased = float(configData[5]);
    onOff = float(configData[6]);
  }
  boolean run() {

    pressed = keyboardCtrl.isPressed(keyboardKey);
    if (!pressed) {
      pressed = gamepadButton(gamepadButton, pressed);
    }

    if (pressed && wasPressed && !Float.isNaN(onHold)) {
      toSend[variable] = onHold;
    }

    if (pressed && !wasPressed && !Float.isNaN(onPressed)) {
      toSend[variable] = onPressed;
    }

    if (!pressed && wasPressed && !Float.isNaN(onReleased)) {
      toSend[variable] = onReleased;
    }

    if (!pressed && !wasPressed && !Float.isNaN(onOff)) {
      toSend[variable] = onOff;
    }
    wasPressed = pressed;

    return true;
  }
}
