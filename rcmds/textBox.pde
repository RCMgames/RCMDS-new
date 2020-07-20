class TextBox {
  String text;
  float x;
  float y;
  color rgb;
  boolean align;
  TextBox (String[] configData, color _rgb, boolean _align) {
    x=width*float(configData[0]);
    y=height*float(configData[1]);
    rgb = _rgb;
    align=_align;
  }
  boolean run(String text) {
    pushStyle();
    fill(rgb);
    if (align) {
      textAlign(LEFT, TOP);
    } else {
      textAlign(CENTER, CENTER);
    }
    text(text, x, y);
    textAlign(CENTER, CENTER);
    popStyle();
    return true;
  }
}
