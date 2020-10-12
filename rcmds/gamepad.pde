//X Axis, Y Axis, Z Axis, X Rotation, Y Rotation
boolean gamepadAvail=false;
String gpadHat;
import org.gamecontrolplus.*;
import net.java.games.input.*;
ControlIO control;
ControlDevice gpad;
void setupGamepad(String device) {
  gamepadAvail=true;
  try {
    control = ControlIO.getInstance(this);
    gpad = control.getDevice(device);
    //for (ControlDevice _gpad : control.getDevices()) {
    //  if (_gpad.getTypeName()=="Gamepad") {
    //    gpad=_gpad;
    //    break;
    //  }
    //}
    //gpad=control.getDevice(gpad.getName());
    if (gpad == null) {
      println("gamepad disabled err:1");
      gamepadAvail=false;
      return;
    }
  }
  catch(Exception e) {
    println(e);
    println("gamepad disabled err:2");
    gamepadAvail=false;
    return;
  }
  //catch(NoClassDefFoundError f) {
  //  gamepadAvail=false;
  //  return;
  //}
  //catch(ExceptionInInitializerError g) {
  //  gamepadAvail=false;
  //  return;
  //}
}
float gamepadVal(String a, float v) {
  if (gamepadAvail && a != null) {
    try {
      if (a.length() > 1) {
        if (a.substring(2, 5).equals("Hat")) {
          if (a.substring(0, 1).equals("X")) {
            return gpad.getHat(gpadHat).getX();
          } else {
            return gpad.getHat(gpadHat).getY();
          }
        } else {
          return gpad.getSlider(a).getValue();
        }
      } else {
        return gpad.getSlider(int(a)).getValue();
      }
    }
    catch(NullPointerException n) {
      println(a);
      println("gamepad disabled err:3");
      gamepadAvail=false;
      return v;
    }
  } else {
    return v;
  }
}
boolean gamepadButton(String b, boolean v) {
  if (gamepadAvail && b != null) {
    try {
      return gpad.getButton(b).pressed();
    }
    catch(NullPointerException n) {
      println("gamepad disabled err:4");
      gamepadAvail=false;
      return v;
    }
  } else {
    return v;
  }
}
