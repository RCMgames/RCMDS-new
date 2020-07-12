ArrayList<Button> buttons;
ArrayList<Axis> axes;
ArrayList<UIButton> uibuttons;
ArrayList<UIJoystick> uijoysticks;
ArrayList<UISlider> uisliders;

void setupObjects() {
  
  if (fileExists(dataPath(file+".txt"))) {
    
    buttons=new ArrayList<Button>();
    axes=new ArrayList<Axis>();
    uibuttons=new ArrayList<UIButton>();
    uijoysticks=new ArrayList<UIJoystick>();
    uisliders=new ArrayList<UISlider>();

    config = loadStrings(file+".txt");
    
    wifiIP = config[1];
    wifiPort = int(config[2]);
    enabled=false;

    for (int i=0; i<8; i++) {
      if (i<5)nums[i]=0;
      toSend[i]=0;
    }

    int a = 0;

    for (int i=5; a<5 && i<config.length; i++) {
      if (split(config[i], ",").length == 1) {
        a++;
      } else {
        nums[a]++;
      }
    }

    a = 4;

    for (int i=0; i<nums[0]; i++) {
      a++;
      line = split(config[a], ',');
      buttons.add(new Button(line));
    }
    a++;
    for (int i=0; i<nums[1]; i++) {
      a++;
      line = split(config[a], ',');
      axes.add(new Axis(line));
    }
    a++;
    for (int i=0; i<nums[2]; i++) {
      a++;
      line = split(config[a], ',');
      uibuttons.add(new UIButton(line));
    }
    a++;
    for (int i=0; i<nums[3]; i++) {
      a++;
      line = split(config[a], ',');
      uijoysticks.add(new UIJoystick(line));
    }
    a++;
    for (int i=0; i<nums[4]; i++) {
      a++;
      line = split(config[a], ',');
      uisliders.add(new UISlider(line));
    }
  } else {
    println("File does not exist");
  }
}

void runObjects () {
  for(int i=0;i<nums[0];i++){
    buttons.get(i).run();
  }
  for(int i=0;i<nums[1];i++){
    axes.get(i).run();
  }
  for(int i=0;i<nums[2];i++){
    uibuttons.get(i).run();
  }
  for(int i=0;i<nums[3];i++){
    uijoysticks.get(i).run();
  }
  for(int i=0;i<nums[4];i++){
    uisliders.get(i).run();
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
