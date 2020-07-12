String[] config;
String[] line;
String file = "example";
int[] nums = {0, 0, 0, 0, 0};
float[] toSend = {0, 0, 0, 0, 0, 0, 0, 0};
float batVolt=0.0;
boolean enabled=false;
float test = 0;
TypeBox configTypeBox;
EnableSwitch enableSwitch;

Button First;

void setup() {
  size(576, 324);
  background(10);
  textAlign(LEFT, TOP);
  rectMode(CENTER);
  textSize(height/20);

  mousescreen=new Mousescreen();
  keyboardCtrl=new KeyboardCtrl();
  udp = new UDP(this);
  udp.listen(true);
  configTypeBox=new TypeBox(width/8.2, height/30, width/4.1, height/15, "file: ", color(0, 255, 0));
  enableSwitch=new EnableSwitch(width*13/16, height/10, width/4, height/9);

  setupObjects();
  
  setupGamepad(config[3]);
}

void draw() {
  background(10);
  fill(20);
  noStroke();
  rect(width/2, height/10, width, height/5);
  enabled=runEnableSwitch(enabled);
  runObjects();
  runTypeBox();
  //runBatGraph();
  sendWifiData(true);

  fill(255);
  text("Name: "+config[0], 2, height*2/15);

  String[] msg={"ping:", " "+str(wifiPing), "battery:", " "+str(batVolt), "ip:", " "+wifiIP, "port:", " "+str(wifiPort), "variables:"," 0: "+str(toSend[0]), " 1: "+str(toSend[1]), " 2: "+str(toSend[2]), " 3: "+str(toSend[3]), " 4: "+str(toSend[4]), " 5: "+str(toSend[5]), " 6: "+str(toSend[6]), " 7: "+str(toSend[7])};
  dispTelem(msg, width/2, height*3/5, width/4, height*4/5, 12, 3);

  //temporary code, will be switched out later
  
  //pushStyle();
  //textAlign(CENTER, CENTER);
  //fill(0, 255, 0);
  //stroke(0);
  //rect(width/2, height/10, width/4, height/10);
  //noStroke();
  //fill(0);
  //text(batVolt, width/2, height/10);
  //popStyle();
}
void WifiDataToRecv() {
  batVolt=recvFl();
  ////////////////////////////////////add data to read here
}
