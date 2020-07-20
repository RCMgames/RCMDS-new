//variable,keyboardkey,gamepadbutton,type,onHold,onPressed,onReleased,onOff
class Button {
  int variable;
  int keyboardKey;
  String gamepadButton;
  int type;
  float onHold;
  float onPressed;
  float onReleased;
  float onOff;
  boolean pressed = false;
  boolean wasPressed = false;
  boolean wasKeyPressed = false;
  Button (String[] configData) {
    variable = int(configData[0]);
    if (!configData[1].equals("")) {
      if (configData[1].length()>1) {
        keyboardKey=int(configData[1]);
      } else {
        keyboardKey = int(configData[1].charAt(0));
      }
    } else {
      keyboardKey = 0;
    }
    if (!configData[2].equals("")) {
      gamepadButton = configData[2];
    } else {
      gamepadButton = null;
    }
    type = int(configData[3]);
    onHold = float(configData[4]);
    onPressed = float(configData[5]);
    onReleased = float(configData[6]);
    onOff = float(configData[7]);
  }
  boolean run() {

    if (type == 1) {
      pressed = keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton);
    } else {
      if ((keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton)) && !wasKeyPressed) {
        pressed = !pressed;
      }
      wasKeyPressed = keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton);
    }

    if (pressed && wasPressed && !Float.isNaN(onHold)) {
      data[variable] = onHold;
    }

    if (pressed && !wasPressed && !Float.isNaN(onPressed)) {
      data[variable] = onPressed;
    }

    if (!pressed && wasPressed && !Float.isNaN(onReleased)) {
      data[variable] = onReleased;
    }

    if (!pressed && !wasPressed && !Float.isNaN(onOff)) {
      data[variable] = onOff;
    }
    wasPressed = pressed;

    return true;
  }
}
