//xvariable,yvariable,x,y,color,size
class UIJoystick {
  int variable1;
  int variable2;
  float posX;
  float posY;
  color rgb;
  int size;
  int mouseID;
  UIJoystick (String[] configData) {
    variable1 = int(configData[0]);
    variable2 = int(configData[1]);
    posX = float(configData[2]);
    posY = float(configData[3]);
    rgb = int(unhex("FF"+configData[4]));
    size = int(configData[5]);
    mouseID=mousescreen.registerZone(posX*width, posY*height, size, size);
  }
  boolean runVar() {
    PVector dataVar=mousescreen.readPos(mouseID, new PVector(data[variable1], data[variable2]));
    data[variable1]=dataVar.x;
    data[variable2]=dataVar.y;

    return true;
  }
  boolean runUI() {
    fill(rgb);
    rect(posX*width, posY*height, 1.25*size, 1.25*size, size/8);
    fill(255);
    circle(posX*width+data[variable1]*size/2, posY*height-data[variable2]*size/2, size/4);

    return true;
  }
}
