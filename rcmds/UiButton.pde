//keyboardkey,gamepadbutton,type,x,y,color,size
class UIButton {
  int keyboardKey;
  String gamepadButton = null;
  String gamepadAxis = null;
  int type;
  int posX;
  int posY;
  color on;
  color off;
  int size;
  boolean pressed = false;
  boolean wasKeyPressed = false;
  boolean activate = false;
  boolean axisInvert = false;
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
    if (!configData[1].equals(null)&&!configData[1].equals("")&&!configData[1].equals("null")) {
      if (configData[1].substring(0, 6).equals("Button")) {
        gamepadButton = configData[1];
      } else {
        if (configData[1].substring(0, 1).equals("-") || configData[1].substring(0, 1).equals("!") || configData[1].substring(0, 1).equals("+")) {
          gamepadAxis = configData[1].substring(1, configData[1].length());
          if (!configData[1].substring(0, 1).equals("+")) {
            axisInvert = true;
          }
        } else {
          gamepadAxis = configData[1];
        }
      }
    }
    type = int(configData[2]);
    posX = int(float(configData[3])*width);
    posY = int(float(configData[4])*height);
    on = int(unhex("FF"+configData[5]));
    off = int(unhex("FF"+configData[6]));
    size = int(scaleFactor*int(configData[7]));
    mouseID=mousescreen.registerZone(posX, posY, size, size);
  }
  boolean runVar() {
    if (mousescreen.readPressed(mouseID) || gamepadButton(gamepadButton, false) || keyboardCtrl.isPressed(keyboardKey)) {
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

    pressed = keyboardCtrl.isPressed(keyboardKey) || gamepadButton(gamepadButton, false) || virtualKeyboardButton.contains(keyboardKey) || virtualGamepadButton.contains(gamepadButton);
    
    if (gamepadAxis != null) {
      if (axisInvert) {
        if (gamepadVal(gamepadAxis, 0) < -0.5) {
          pressed = true;
        }
      } else {
        if (gamepadVal(gamepadAxis, 0) > 0.5) {
          pressed = true;
        }
      }
    }
    
    //momentary
    if (type == 1) {
      activate = pressed;
    }
    //toggle
    if (type == 2) {
      if(pressed && !wasKeyPressed) {
        activate = !activate;
      }
    }

    if (activate) {
      fill(on);
    } else {
      fill (off);
    }
    
    rect(posX, posY, size, size, size/4);
    
    wasKeyPressed = pressed;

    return true;
  }
}
