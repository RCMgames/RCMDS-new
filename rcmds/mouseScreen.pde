Mousescreen mousescreen;
boolean mousePress=false;
class Mousescreen {
  ArrayList<MouseZone> zones;
  Mousescreen() {
    zones=new ArrayList<MouseZone>();
  }
  int registerZone(float x, float y, float w, float h) {
    int id=zones.size();
    zones.add(new MouseZone(id, x, y, w, h));
    return id;
  }
  void deregisterZone(int id) {
    zones.remove(id);
  }
  boolean readPressed(int id) {
    MouseZone zone=zones.get(id);
    if (abs(mouseX-zone.x)<zone.w/2&&abs(mouseY-zone.y)<zone.h/2&&mousePress) {
      mousePress=false;
      zone.touched=true;
    }
    if (!mousePressed) {
      zone.touched=false;
    }
    zones.set(id, zone);
    return zone.touched;
  }

  PVector readPos(int id, PVector v) {
    MouseZone zone=zones.get(id);
    if (abs(mouseX-zone.x)<zone.w/2&&abs(mouseY-zone.y)<zone.h/2&&mousePress) {
      mousePress=false;
      zone.touched=true;
    }
    if (!mousePressed) {
      zone.touched=false;
    }
    if (zone.touched) {
      v.set(constrain((mouseX-zone.x)/zone.w*2, -1, 1), constrain(((-mouseY+zone.y)/zone.h*2), -1, 1));
    }
    zones.set(id, zone);
    return v;
  }
}

class MouseZone {
  boolean touched;
  int id;
  float x;
  float y;
  float w;
  float h;
  MouseZone(int _id, float _x, float _y, float _w, float _h) {
    touched=false;
    id=_id;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
}

void mousePressed() {
  mousePress=true;
}
