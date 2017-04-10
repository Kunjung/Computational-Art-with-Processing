class Segment {
  PVector a;
  PVector b = new PVector(0, 0);
  float len;
  float angle;
  int sw = 1;

  Segment(float x, float y, float len_, float angle_, int sw_) {
    a = new PVector(x, y);
    len = len_;
    angle = angle_;
    sw = sw_;
    calculateB();
  }

  Segment(Segment parent, float len_, float angle_, int sw_) {
    a = parent.b.get();
    len = len_;
    angle = angle_;
    sw = sw_;
    calculateB();
  }
  
  
  
  void follow(Segment child) {
     PVector target = child.a.get();
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
  
  void attachToParent(Segment parent) {
    PVector base = parent.b.get();
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
    stroke(255, 100);
    strokeWeight(sw);
    line(a.x, a.y, b.x, b.y);
    fill(150, 0, 120, 100);
    ellipse(a.x, a.y, sw * 2, sw * 2);
  }
}