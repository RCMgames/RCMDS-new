class DisplayTelemetry {
  float x;
  float y;
  float w;
  float h;
  int ts;
  int offset = 3;

  DisplayTelemetry (String[] configData) {
    x = width*float(configData[0]);
    y = height*float(configData[1]);
    w = width*float(configData[2]);
    h = height*float(configData[3]);
    ts = int(configData[4]);
  }
  boolean run(String[] msg) {
    pushStyle();
    textAlign(LEFT, BOTTOM);
    textSize(ts);
    stroke(255);
    strokeWeight(1);
    fill(10);
    rect(x, y, w, h-1, 10);
    fill(255);
    for (int i=0; i<msg.length; i++) {
      String [] telemData = split(msg[i], ",");
      String text = "";

      for (int j=0; j<telemData.length; j++) {
        if (telemData[j].length() >= 4) {
          if (telemData[j].substring(0, 4).equals( "var:")) {
            if (telemData[j].substring(4, telemData[j].length()).equals("ip")) {
              text = text + wifiIP;
            } else if (telemData[j].substring(4, telemData[j].length()).equals("port")) {
              text = text + str(wifiPort);
            } else if (telemData[j].substring(4, telemData[j].length()).equals("ping")) {
              text = text + str(wifiPing);
            } else if (telemData[j].substring(4, telemData[j].length()).equals("volt")) {
              text = text + nf(data[numCtrl], 0, 4);
            } else {
              text = text + nf(data[int(telemData[j].substring(4, telemData[j].length()))], 1, 4);
            }
          } else {
            text = text + telemData[j];
          }
        } else {
          text = text + telemData[j];
        }
      }

      text(text, x-w/2+5, y-h/2+ts+5+i*ts+i*offset);
    }
    popStyle();
    return true;
  }
}
