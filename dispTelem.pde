void dispTelem(String[] msg, int x, int y, int w, int h, int ts, int offset) {
  pushStyle();
  textAlign(LEFT, BOTTOM);
  textSize(ts);
  stroke(255);
  strokeWeight(1);
  fill(10);
  rect(x, y, w, h-1, 10);
  fill(255);
  for (int i=0; i<msg.length; i++) {
    text(msg[i], x-w/2+5, y-h/2+ts+5+i*ts+i*offset);
  }
  popStyle();
}
