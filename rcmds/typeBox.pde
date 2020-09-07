boolean typeBoxActive=false;
boolean wasTypeBoxActive=false;
class TypeBox {
  float x;
  float y;
  float w;
  float h;
  String label;
  int touchID;
  int mouseID;
  boolean e;
  boolean le;
  String entry;
  color col;
  TypeBox(String[] configData, color _col) {
    x=width*float(configData[0]);
    y=height*float(configData[1]);
    w=width*float(configData[2]);
    h=height*float(configData[3]);
    label=configData[4];
    e=false;
    le=false;
    col=_col;
    mouseID=mousescreen.registerZone(x, y, w, h);
  }
  void doCommon(int numMode) {
    pushStyle();
    le=e;
    if ((
      keyboardCtrl.isPressed(int(TAB)) ||
      mousescreen.readPressed(mouseID))
      &&!typeBoxActive) {
      e=true;
      typeBoxActive=true;
    }
    if (keyPressTypeBox&&e) {
      if (key==ENTER||key==RETURN||keyCode==66) {
        e=false;
        typeBoxActive=false;
        keyPressTypeBox=false;
      }
      if (key==DELETE) {
        e=false;
        entry="";
        typeBoxActive=false;
        keyPressTypeBox=false;
      }
    }
    if (e&&!le) {//just activated
      entry="";
    }
    textSize(h*.75);
    if (e) {
      if (keyPressTypeBox&&textWidth(entry)<w-h*.75-textWidth(label)) {
        if (numMode==0&&(((key>=32&&key<=126)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key; //letters and numbers
        }
        if (numMode==1&&((key==45||(key>=48&&key<=57)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key;//numbers and negative
        }
        if (numMode==2&&((key==45||key==46||(key>=48&&key<=57)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key;//numbers, negative, and decimal
        }
      }
      if (keyPressTypeBox&&(key==BACKSPACE||keyCode==67)&&entry.length()>0) {        
        keyPressTypeBox=false;
        entry=entry.substring(0, entry.length()-1);
        if (entry.length()==0) {
          entry="";
        }
      }
    }
    fill(20);
    if (e)stroke(255);
    else stroke(col);
    rect(x, y, w, h);
    if (e)fill(255);
    else fill(col);
    text(label, x+2, y, w, h);
    if (e) {
      text(entry, x+textWidth(label)/2, y, w-textWidth(label), h);
    }
  }
  String run(String val) {
    doCommon(0);
    if (!e&&le) {//edit finished
      if (entry!="") {
        val=entry;
      }
    }
    if (!e) {
      text(val, x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    popStyle();
    return val;
  }
  int run(int val) {
    doCommon(1);
    if (!e&&le) {//edit finished
      if (int(entry)==int(entry)&&entry!="") {
        val=int(entry);
      }
    }
    if (!e) {
      text(str(val), x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    popStyle();
    return val;
  }
  float run(float val) {
    doCommon(2);
    if (!e&&le) {//edit finished
      if (float(entry)==float(entry)&&entry!="") {//NaN check
        val=float(entry);
      }
    }
    if (!e) {
      text(str(val), x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    popStyle();
    return val;
  }
}

void runTypeBox () {
  wasTypeBoxActive = typeBoxActive;
  imput=configTypeBox.run(imput);
  if (wasTypeBoxActive && !typeBoxActive) {
    objectSetup(imput);
    //if (fileExists(dataPath(imput+".txt"))) {
    //  try {
    //    objectSetup(imput);
    //    oldFile=imput;
    //    error = null;
    //  }
    //  catch (Throwable e) {
    //    if ( oldFile != null) {
    //      objectSetup(oldFile);
    //    }
    //    error = "Bad config file";
    //  }
    //} else {
    //  error = "File does not exist";
    //}
  }
  //textSize(height/20);
  if (error != null) {
    errors.run(error);
  }
}
