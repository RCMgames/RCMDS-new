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
    if (configData[1].length()!=0) {
      if (configData[1].length()>1) {
        keyboardKey1=int(configData[1]);
      } else {
        keyboardKey1 = int(configData[1].charAt(0));
      }
    } else {
      keyboardKey1 = 0;
    }
    if (configData[2].length()!=0) {
      if (configData[2].length()>1) {
        keyboardKey2=int(configData[2]);
      } else {
        keyboardKey2 = int(configData[2].charAt(0));
      }
    } else {
      keyboardKey2 = 0;
    }
    if (configData[3].length()>0) {
      gamepadAxis = configData[3];
    } else {
      gamepadAxis = null;
    }
    type = int(configData[4]);
    step = float(configData[5]);
    min = float(configData[6]);
    max = float(configData[7]);
    invert = boolean(configData[8]);
  }
  boolean run() {

    //spring
    if (type == 1) {
      toSend[variable] = 0;

      if (keyboardCtrl.isPressed(keyboardKey1)) {
          toSend[variable] = min;
      }

      if (keyboardCtrl.isPressed(keyboardKey2)) {
          toSend[variable] = max;
      }

      if (toSend[variable] == 0) {
        if (invert) {
          toSend[variable] = (max-min)/2*-gamepadVal(gamepadAxis, toSend[variable])+(max+min)/2;
        } else {
          toSend[variable] = (max-min)/2*gamepadVal(gamepadAxis, toSend[variable])+(max+min)/2;
        }
      }
    }

    //sticky
    if (type == 2) {      
      if (keyboardCtrl.isPressed(int(keyboardKey1))) {
          toSend[variable] -= step;
      }

      if (keyboardCtrl.isPressed(int(keyboardKey2))) {
          toSend[variable] += step;
      }

      if (abs(gamepadVal(gamepadAxis, 0)) > 0.15) {
        if (invert) {
          toSend[variable] -= 2*step*gamepadVal(gamepadAxis, 0);
        } else {
          toSend[variable] += 2*step*gamepadVal(gamepadAxis, 0);
        }
      }

      if (toSend[variable]>max) {
        toSend[variable]=max;
      }
      if (toSend[variable]<min) {
        toSend[variable]=min;
      }
    }

    //more?

    return true;
  }
}
