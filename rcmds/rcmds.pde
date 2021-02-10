//v1.4.0

HashSet<Integer> virtualKeyboardButton;
HashSet<String> virtualGamepadButton;
String[] Window;
String imput = "example";
String oldFile;
String error = null;
boolean enabled = false;
String setup = "";
boolean ctrlPressed = false;
int numCtrl=16; //how many variables for controlling the robot are sent
int numRecv=8;  //how many variables are recieved, including battery
float[] data = new float[numCtrl+numRecv];
float scaleFactor;

void setup() {
  surface.setSize(576,324);
  virtualKeyboardButton=new HashSet<Integer>();
  virtualGamepadButton=new HashSet<String>();
  windowSetup("setup");
  if (setup.equals("")) {
    udp = new UDP(this);
    udp.listen(true);
    objectSetup(imput);
  }
}

void draw() {
  if (setup.equals("")) {
    background(10);
    fill(20);
    noStroke();
    rect(width/2, height*rectHeight/2, width, height*rectHeight);
    enabled=runEnableSwitch(enabled);
    runObjects();
    runTypeBox();
    batVolts.run(nf(data[numCtrl], 0, 2)+" V");
    batGraph.run(data[numCtrl]);
    sendWifiData(true);
    robotName.run("Name: "+name);
    dispTelem.run(msg);

    if (keyboardCtrl.justPressed(15)) {
      launch(dataPath(oldFile+".txt"));
    }

    if (keyboardCtrl.justPressed(16)) {
      launch(dataPath("setup.txt"));
    }

    if (keyboardCtrl.justPressed(18)) {
      windowSetup("setup");
      objectSetup(oldFile);
    }

    if (!focused) {
      enabled = false;
    }
    keyboardCtrl.oldKeys=(HashSet)keyboardCtrl.keys.clone();
    virtualKeyboardButton.clear();
    virtualGamepadButton.clear();
  } else {
    surface.setSize(300, 50);
    textSize(30);
    background(10);
    textAlign(CENTER, CENTER);
    fill(200, 0, 0);
    text(setup, width/2, height/2);
  }
}
