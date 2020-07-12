//keyboardkey,gamepadbutton,x,y,color,size
class UIButton {
  int keyboardKey;
  String gamepadButton;
  float posX;
  float posY;
  color on;
  color off;
  int size;
  Boolean pressed;
  UIButton (String[] configData) {
    if (configData[0].length()!=0) {
      if (configData[0].length()>1) {
        keyboardKey=int(configData[0]);
      } else {
        keyboardKey = int(configData[0].charAt(0));
      }
    } else {
      keyboardKey = 0;
    }
    if (configData[1].length()>0) {
      gamepadButton = configData[1];
    } else {
      gamepadButton = null;
    }
    posX = float(configData[2]);
    posY = float(configData[3]);
    on = int(unhex("FF"+configData[4]));
    off = int(unhex("FF"+configData[5]));
    size = int(configData[6]);
  }
  boolean run() {
    pressed = keyboardCtrl.isPressed(keyboardKey);
    if (!pressed) {
      pressed = gamepadButton(gamepadButton, pressed);
    }

    if (pressed) {
      fill(on);
    } else {
      fill (off);
    }
    rect(posX*width, posY*height, size, size, size/4);

    return true;
  }
}
