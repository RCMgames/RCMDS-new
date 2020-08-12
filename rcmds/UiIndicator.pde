//variable,min,max,x,y,color1,color2,size
class UIIndicator {
  int variable;
  float min;
  float max;
  float posX;
  float posY;
  color off;
  color on;
  int size;
  UIIndicator (String[] configData) {
    variable = int(configData[0]);
    min = float(configData[1]);
    max = float(configData[2]);
    posX = float(configData[3]);
    posY = float(configData[4]);
    off = int(unhex("FF"+configData[5]));
    on = int(unhex("FF"+configData[6]));
    size = int(configData[7]);
  }
  boolean runVar() {

    return true;
  }
  boolean runUI() {

    if (data[variable] >= min && data[variable] <= max) {
      fill(on);
    } else {
      fill (off);
    }
    circle(posX*width, posY*height, size);

    return true;
  }
}
