ArrayList<Button> buttons;
ArrayList<Axis> axes;
ArrayList<UIButton> uibuttons;
ArrayList<UIIndicator> uiindicators;
ArrayList<UIJoystick> uijoysticks;
ArrayList<UISlider> uisliders;

String name;
String[] msg = new String[0];
int[] nums = new int[6];

void objectSetup(String file, boolean print) {
  auto = false;
  if (print) {
    output.println("\n" + "File: "+file+".txt");
    output.flush();
  }
  int a=0;
  if (fileExists(dataPath(file+".txt"))) {
    buttons=new ArrayList<Button>();
    axes=new ArrayList<Axis>();
    uibuttons=new ArrayList<UIButton>();
    uiindicators=new ArrayList<UIIndicator>();
    uijoysticks=new ArrayList<UIJoystick>();
    uisliders=new ArrayList<UISlider>();
    try {

      String[] config;
      String[] line;

      config = loadStrings(file+".txt");

      name = config[a];
      a++;

      wifiIP = split(config[a], ":")[0];
      wifiPort = int(split(config[a], ":")[1]);
      enabled=false;
      a++;

      msg=split(config[a], ";");
      a++;

      numCtrl = int(split(config[a], ',')[0]);
      numRecv = int(split(config[a], ',')[1]);
      arrayToSend=new byte[4*numCtrl+8];
      arrayRecvd=new int [4*numRecv+8];
      data = new float [numCtrl+numRecv];
      nums = new int[6];
      a++;
      
      if(config[a].length() == 1){
        autoKey=int(config[a].charAt(0));
      }
      
      a++;

      for (; !config[a].equals(""); a++) {
        line = split(config[a], ',');
        buttons.add(new Button(line));
        nums[0]++;
      }
      a++;
      for (; !config[a].equals(""); a++) {
        line = split(config[a], ',');
        axes.add(new Axis(line));
        nums[1]++;
      }
      a++;
      for (; !config[a].equals(""); a++) {
        line = split(config[a], ',');
        uibuttons.add(new UIButton(line));
        nums[2]++;
      }
      a++;
      for (; !config[a].equals(""); a++) {
        line = split(config[a], ',');
        uiindicators.add(new UIIndicator(line));
        nums[3]++;
      }
      a++;
      for (; !config[a].equals(""); a++) {
        line = split(config[a], ',');
        uijoysticks.add(new UIJoystick(line));//
        nums[4]++;
      }
      a++;
      for (; a<config.length && !config[a].equals(""); a++) {
        line = split(config[a], ',');
        uisliders.add(new UISlider(line));//
        nums[5]++;
      }
      error = null;
        if (print) {
          output.println("File Successful");
          output.flush();
        }
        oldFile=file;
    }
    catch (Throwable e) {
      if ( oldFile != null) {
        objectSetup(oldFile, false);
      }
      error = "Bad config file";
      output.println(error);
      output.println("error: " + e);
      output.println("line: " + str(a+1));
      output.flush();
      e.printStackTrace();
    }
  } else {
    error = "File not found";
    output.println("File not found");
    output.flush();
  }
}

void runObjects () {
  for (int i=0; i<nums[2]; i++) {
    uibuttons.get(i).runVar();
  }
  for (int i=0; i<nums[1]; i++) {
    axes.get(i).run();
  }
  for (int i=0; i<nums[0]; i++) {
    buttons.get(i).run();
  }
  for (int i=0; i<nums[3]; i++) {
    uiindicators.get(i).runVar();
  }
  for (int i=0; i<nums[4]; i++) {
    uijoysticks.get(i).runVar();
  }
  for (int i=0; i<nums[5]; i++) {
    uisliders.get(i).runVar();
  }
  for (int i=0; i<nums[2]; i++) {
    uibuttons.get(i).runUI();
  }
  for (int i=0; i<nums[3]; i++) {
    uiindicators.get(i).runUI();
  }
  for (int i=0; i<nums[4]; i++) {
    uijoysticks.get(i).runUI();
  }
  for (int i=0; i<nums[5]; i++) {
    uisliders.get(i).runUI();
  }
}

boolean fileExists(String path) {
  File file=new File(path);
  boolean exists = file.exists();
  if (exists) {
    return true;
  } else {
    return false;
  }
}
