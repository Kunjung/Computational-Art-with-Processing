class Segment {
  PVector a;
  PVector b = new PVector(0, 0);
  float len;
  float angle;
  Segment parent = null;
  Segment child = null;
  int sw = 1;

  Segment(float x, float y, float len_, float angle_, int sw_) {
    a = new PVector(x, y);
    len = len_;
    angle = angle_;
    sw = sw_;
    calculateB();
  }

  Segment(Segment parent_, float len_, float angle_, int sw_) {
    parent = parent_;
    a = parent.b.copy();
    len = len_;
    angle = angle_;
    sw = sw_;
    calculateB();
  }
  
  
  
  void follow() {
     PVector target = child.a.copy();
     follow(target.x, target.y);
  }

  void follow(float targetX, float targetY) {
    PVector target = new PVector(targetX, targetY);
    PVector dir = PVector.sub(target, a);
    angle = dir.heading();
    
    dir.setMag(len);
    dir.mult(-1);
    a = PVector.add(target, dir);
    
    calculateB();
  }
  
  void attachToParent() {
    PVector base = parent.b.copy();
    setBase(base);
  }
  
  void setBase(PVector base) {
     a.set(base);
     calculateB();
  }

  void calculateB() {
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    b.set(a.x + dx, a.y + dy);
  }

  void show() {
    strokeWeight(sw);
    line(a.x, a.y, b.x, b.y);
  }
}