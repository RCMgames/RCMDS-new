//variable,x,y,color,orientation,size
class UISlider {
  int variable;
  float min;
  float max;
  float posX;
  float posY;
  color rgb;
  int rotation;
  int size;
  float position;
  int mouseID;
  UISlider (String[] configData) {
    variable = int(configData[0]);
    min = float(configData[1]);
    max = float(configData[2]);
    posX = float(configData[3]);
    posY = float(configData[4]);
    rgb = int(unhex("FF"+configData[5]));
    rotation = int(configData[6]);
    size = int(configData[7]);
    if (rotation==2) {
      mouseID=mousescreen.registerZone(int(posX*width), int(posY*height), size*5.25, size);
    } else {//horiz
      mouseID=mousescreen.registerZone(int(posX*width), int(posY*height), size, size*5.25);
    }
  }
  boolean run() {
    fill(rgb);
    //vertical
    if (rotation == 1) {
      data[variable]=map(mousescreen.readPos(mouseID, new PVector(0, map(data[variable], min, max, -1, 1))).y, -1, 1, min, max);
      rect(int(posX*width), int(posY*height), size, int(5.25*size), size/4);
      fill(255);
      stroke(10);
      position = constrain(norm(data[variable], min, max), 0, 1);
      rect(int(posX*width), int(posY*height-2.5*size*(2*position-1)), size+1, int(size/5));
      noStroke();
    }

    //horizontal
    if (rotation == 2) {
      data[variable]=map(mousescreen.readPos(mouseID, new PVector(map(data[variable], min, max, -1, 1), 0)).x, -1, 1, min, max);
      rect(int(posX*width), int(posY*height), int(5.25*size), size, size/4);
      fill(255);
      stroke(10);
      position = constrain(norm(data[variable], min, max), 0, 1);
      rect(int(posX*width+2.5*size*(2*position-1)), int(posY*height), int(size/5), size+1);
      noStroke();
    }
    return true;
  }
}
