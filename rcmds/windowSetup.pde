/*
576,324
 enable switch:
 .8125,.1,.25,.11111
 text box:
 .125,.03333,.25,.06666
 robot name:
 0,.13333
 error messages:
 0,.06666
 voltage:
 .5,.04
 battery graph:
 .5,.13333,.2,.06666
 telemetry box:
 .5,.6,.25,.8
 greyed out top area
 .2
 */

TypeBox configTypeBox;
EnableSwitch enableSwitch;
TextBox errors;
TextBox robotName;
TextBox batVolts;
BatteryGraph batGraph;
DisplayTelemetry dispTelem;

float rectHeight;

void windowSetup(String file) {
  if (fileExists(dataPath(file+".txt"))) {
    try {
      String[] config;
      String[] line;
      int a = 0;

      config = loadStrings(file+".txt");

      line = split(config[a], ',');
      surface.setSize(int(line[0]), int(line[1]));
      surface.setResizable(false);
      surface.setTitle("Driver Station");
      a++;

      background(10);
      textAlign(LEFT, TOP);
      rectMode(CENTER);
      textSize(height/20);

      mousescreen=new Mousescreen();
      keyboardCtrl=new KeyboardCtrl();
      line = split(config[a], ',');
      enableSwitch=new EnableSwitch(line);
      a++;

      line = split(config[a], ',');
      configTypeBox=new TypeBox(line, color(0, 200, 0));
      a++;

      line = split(config[a], ',');
      robotName=new TextBox(line, color(255), true);
      a++;

      line = split(config[a], ',');
      errors=new TextBox(line, color(255, 0, 0), true);
      a++;

      line = split(config[a], ',');
      batVolts=new TextBox(line, color(255), false);
      a++;

      line = split(config[a], ',');
      batGraph=new BatteryGraph(line);
      a++;

      line = split(config[a], ',');
      dispTelem=new DisplayTelemetry(line);
      a++;

      line = split(config[a], ',');
      rectHeight = float(line[0]);
      a++;

      line = split(config[a], ',');
      setupGamepad(line[0]);
      a++;
      
      line = split(config[a], ',');
      gpadHat = line[0];
    }
    catch (Throwable e) {
      setup = "bad setup file";
      e.printStackTrace();
    }
  } else {
    setup = "missing setup file";
  }
}
