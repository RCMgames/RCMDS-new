KeyboardCtrl keyboardCtrl; 
import java.util.HashSet; 
boolean keyPressTypeBox=false;
class KeyboardCtrl {
  HashSet<Integer> keys;
  HashSet<Integer> justReleasedKeys;
  HashSet<Integer> justPressedKeys;
  KeyboardCtrl() {
    keys=new HashSet<Integer>();
    justReleasedKeys=new HashSet<Integer>();
    justPressedKeys=new HashSet<Integer>();
  }
  boolean isPressed(int k) {
    int temp = 0;
    if (k>96) {
      temp = k-32;
    }
    return keys.contains(k) || keys.contains(temp);
  }
  boolean justPressed(int k) {
    int temp = 0;
    if (k>96) {
      temp = k-32;
    }
    boolean ret= justPressedKeys.contains(k) || justPressedKeys.contains(temp);
    return ret;
  }
  boolean justReleased(int k) {
    int temp = 0;
    if (k>96) {
      temp = k-32;
    }
    boolean ret= justReleasedKeys.contains(k) || justReleasedKeys.contains(temp);
    return ret;
  }
  void keypress() {
    if (key==CODED) {
      keys.add(int(keyCode));
    } else {
      keys.add(int(key));
    }
    if (key==CODED) {
      justPressedKeys.add(int(keyCode));
    } else {
      justPressedKeys.add(int(key));
    }
  }
  void keyrelease() {
    if (key==CODED) {
      keys.remove(int(keyCode));
    } else {
      keys.remove(int(key));
    }
    if (key==CODED) {
      justReleasedKeys.add(int(keyCode));
    } else {
      justReleasedKeys.add(int(key));
    }
  }
  void clearKeys() {
    justReleasedKeys.clear();
    justPressedKeys.clear();
  }
}
void keyPressed() {
  if (!typeBoxActive)  
    keyboardCtrl.keypress(); 
  else  
  keyPressTypeBox=true;
}
void keyReleased() { 
  if (!typeBoxActive || key==TAB)  
    keyboardCtrl.keyrelease();
} 
