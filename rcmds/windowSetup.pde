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

      config = loadStrings(file+".txt");

      line = split(config[0], ',');
      surface.setSize(int(line[0]), int(line[1]));
      surface.setResizable(false);
      surface.setTitle("Driver Station");

      background(10);
      textAlign(LEFT, TOP);
      rectMode(CENTER);
      textSize(height/20);

      mousescreen=new Mousescreen();
      keyboardCtrl=new KeyboardCtrl();
      line = split(config[1], ',');
      enableSwitch=new EnableSwitch(line);

      line = split(config[2], ',');
      configTypeBox=new TypeBox(line, color(0, 200, 0));

      line = split(config[3], ',');
      robotName=new TextBox(line, color(255), true);

      line = split(config[4], ',');
      errors=new TextBox(line, color(255, 0, 0), true);

      line = split(config[5], ',');
      batVolts=new TextBox(line, color(255), false);

      line = split(config[6], ',');
      batGraph=new BatteryGraph(line);

      line = split(config[7], ',');
      dispTelem=new DisplayTelemetry(line);

      line = split(config[8], ',');
      rectHeight = float(line[0]);

      line = split(config[9], ',');
      setupGamepad(line[0]);
    }
    catch (Throwable e) {
      setup = "bad setup file";
      e.printStackTrace();
    }
  } else {
    setup = "missing setup file";
  }
}
