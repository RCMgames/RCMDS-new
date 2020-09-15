//variable,keyboardkey1,keyboardkey2,gamepadaxis,type,step,min,max,inverted
class Axis {
  int variable;
  int keyboardKey1;
  int keyboardKey2;
  String gamepadAxis;
  int type;
  float step;
  float min;
  float max;
  boolean invert;
  Axis (String[] configData) {
    variable = int(configData[0]);
    if (!configData[1].equals("")) {
      if (configData[1].length()>1) {
        keyboardKey1=int(configData[1]);
      } else {
        keyboardKey1 = int(configData[1].charAt(0));
      }
    } else {
      keyboardKey1 = 0;
    }
    if (!configData[2].equals("")) {
      if (configData[2].length()>1) {
        keyboardKey2=int(configData[2]);
      } else {
        keyboardKey2 = int(configData[2].charAt(0));
      }
    } else {
      keyboardKey2 = 0;
    }
    //if (!configData[3].equals("")) {
      gamepadAxis = configData[3];
    //} else {
    //  gamepadAxis = "";
    //}
    type = int(configData[4]);
    step = float(configData[5]);
    min = float(configData[6]);
    max = float(configData[7]);
    invert = boolean(configData[8]);
  }
  boolean run() {

    //spring
    if (type == 1) {
      data[variable] = (min+max)/2;

      if (keyboardCtrl.isPressed(keyboardKey1)||virtualKeyboardButton.contains(keyboardKey1)) {
        data[variable] = min;
      }

      if (keyboardCtrl.isPressed(keyboardKey2)||virtualKeyboardButton.contains(keyboardKey2)) {
        data[variable] = max;
      }

      if ((((!keyboardCtrl.isPressed(keyboardKey1)&&!virtualKeyboardButton.contains(keyboardKey1))||keyboardKey1==0)&&((!keyboardCtrl.isPressed(keyboardKey2)&&!virtualKeyboardButton.contains(keyboardKey2))||keyboardKey2==0))&&!gamepadAxis.equals("")) {
        if (invert) {
          data[variable] = map(gamepadVal(gamepadAxis, data[variable]), 1, -1, min, max);
        } else {
          data[variable] = map(gamepadVal(gamepadAxis, data[variable]), -1, 1, min, max);
        }
      }
    }

    //sticky
    if (type == 2) {      
      if (keyboardCtrl.isPressed(keyboardKey1)||virtualKeyboardButton.contains(keyboardKey1)) {
        data[variable] -= step;
      }

      if (keyboardCtrl.isPressed(keyboardKey2)||virtualKeyboardButton.contains(keyboardKey2)) {
        data[variable] += step;
      }

      if (abs(gamepadVal(gamepadAxis, 0)) > 0.15) {
        if (invert) {
          data[variable] -= 2*step*gamepadVal(gamepadAxis, 0);
        } else {
          data[variable] += 2*step*gamepadVal(gamepadAxis, 0);
        }
      }

      data[variable]=constrain(data[variable], min, max);
    }

    //more?

    return true;
  }
}
