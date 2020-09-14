//keyboardkey,gamepadbutton,type,x,y,color,size
class UIButton {
  int keyboardKey;
  String gamepadButton;
  int type;
  int posX;
  int posY;
  color on;
  color off;
  int size;
  boolean pressed = false;
  boolean wasKeyPressed = false;
  int mouseID;
  UIButton (String[] configData) {
    if (!configData[0].equals("")) {
      if (configData[0].length()>1) {
        keyboardKey=int(configData[0]);
      } else {
        keyboardKey = int(configData[0].charAt(0));
      }
    } else {
      keyboardKey = 0;
    }
    if (!configData[1].equals("")) {
      gamepadButton = configData[1];
    } else {
      gamepadButton = null;
    }
    type = int(configData[2]);
    posX = int(float(configData[3])*width);
    posY = int(float(configData[4])*height);
    on = int(unhex("FF"+configData[5]));
    off = int(unhex("FF"+configData[6]));
    size = int(configData[7]);
    mouseID=mousescreen.registerZone(posX, posY, size, size);
  }
  boolean runVar() {
    if (mousescreen.readPressed(mouseID)) {
      if (keyboardKey!=0) {
        virtualKeyboardButton.add(keyboardKey);
      }
      if (gamepadButton!=null) {
        virtualGamepadButton.add(gamepadButton);
      }
    }

    return true;
  }
  boolean runUI() {

    if (type == 1) {
      pressed = keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton);
    } else {
      if ((keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton)) && !wasKeyPressed) {
        pressed = !pressed;
      }
      wasKeyPressed = keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false)||virtualKeyboardButton.contains(keyboardKey)||virtualGamepadButton.contains(gamepadButton);
    }

    if (pressed) {
      fill(on);
    } else {
      fill (off);
    }
    rect(posX, posY, size, size, size/4);

    return true;
  }
}
