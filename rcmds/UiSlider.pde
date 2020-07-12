//variable,x,y,color,orientation,size
class UISlider {
  int variable;
  float posX;
  float posY;
  color rgb;
  int rotation;
  int size;
  UISlider (String[] configData) {
    variable = int(configData[0]);
    posX = float(configData[1]);
    posY = float(configData[2]);
    rgb = int(unhex("FF"+configData[3]));
    rotation = int(configData[4]);
    size = int(configData[5]);
  }
  boolean run() {

    //vertical
    if (rotation == 1) {
      fill(rgb);
      rect(posX*width, posY*height, size, 5.25*size, size/4);
      fill(255);
      stroke(1);
      rect(posX*width, posY*height-toSend[variable]*2.5*size, size, size/5, size/20);
      noStroke();
    }

    //horizontal
    if (rotation == 2) {
      fill(rgb);
      rect(posX*width, posY*height, 5.25*size, size, size/4);
      fill(255);
      stroke(1);
      rect(posX*width+toSend[variable]*2.5*size, posY*height, size/5, size, size/20);
      noStroke();
    }

    return true;
  }
}
