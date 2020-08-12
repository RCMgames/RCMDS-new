KeyboardCtrl keyboardCtrl; 
import java.util.HashSet; 
boolean keyPressTypeBox=false;
class KeyboardCtrl {
  HashSet<Integer> keys;
  HashSet<Integer> oldKeys;
  KeyboardCtrl() {
    keys=new HashSet<Integer>();
    oldKeys=new HashSet<Integer>();
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
    boolean ret= (keys.contains(k)&&!oldKeys.contains(k))||(keys.contains(temp)&&!oldKeys.contains(temp));
    return ret;
  }
  void keypress() {
    if (key==CODED) {
      keys.add(int(keyCode));
    } else {
      keys.add(int(key));
    }
  }
  void keyrelease() {
    if (key==CODED) {
      keys.remove(int(keyCode));
    } else {
      keys.remove(int(key));
    }
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
