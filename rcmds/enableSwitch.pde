class EnableSwitch {
  float x;
  float y;
  float w;
  float h;
  float sliderPos;
  boolean locked=true;
  int pointerID;

  EnableSwitch(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    pointerID=mousescreen.registerZone(x, y, w, h);
    sliderPos=1;
  }
  boolean run(boolean enabled) {
    float swipePos=mousescreen.readPos(pointerID, new PVector(1, 0)).x;
    swipePos=constrain(swipePos, -1, 1);
    pushStyle();
    if (enabled) {
      boolean pressed=mousescreen.readPressed(pointerID);
      if (pressed&&!locked||keyboardCtrl.isPressed(ENTER)) {
        enabled=false;
        locked=true;
      }
      if (!pressed) {
        locked=false;
      }
      fill(155, 0, 0);
      rect(x, y, w, h, h/4);
      fill(255);
      textAlign(CENTER);
      textSize(h*.45);
      text("Tap to DISABLE ", x, y+h*.2, w, h);
      textAlign(LEFT);
    } else { //disabled
      if (locked&&swipePos<1&&swipePos>1-2*h/w) {
        locked=false;
      }
      if (swipePos==1) {
        locked=true;
      }
      noStroke();
      fill(0, 100, 0);
      rect(x, y, w, h, h/4);
      fill(255);
      textSize(h*.4);
      text(" slide to", x, y, w, h);
      textSize(h*.85);
      text("<-", x+w*.5, y, w, h);
      textSize(h*.4);
      text(" enable", x, y+h/2, w, h);
      if (locked) {
        fill(0, 255, 0);
        rect(x+w/2-h/2, y, h, h, h/4);
      } else {
        fill(155, 0, 0);
        rect(constrain(w/2*swipePos, -w/2+h/2, w/2-h/2)/2+w/4+x, y, w/2-constrain(w/2*swipePos, -w/2+h/2, w/2-h/2), h, h/4);
        rectMode(CENTER);
        fill(255, 255, 0);
        rect(x+constrain(w/2*swipePos, -w/2+h/2, w/2-h/2), y, h, h, h/4);
      }
      if ((swipePos<=-1+h/w&&!locked)||(keyboardCtrl.isPressed('[')&&keyboardCtrl.isPressed(']'))) {
        locked=true;
        enabled=true;
      }
    } 
    if (millis()-wifiReceivedMillis>wifiRetryPingTime*disableTimeMultiplier) {
      enabled=false;
    }
    popStyle();
    return enabled;
  }
}

boolean runEnableSwitch(boolean en) {
  return enableSwitch.run(en);
}
