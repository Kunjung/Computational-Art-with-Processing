class Tentacle {
  Segment[] segments = new Segment[3]; 
  PVector base;
  float len = 100;

  Tentacle(float x, float y) {
    base = new PVector(x, y);
    int sw = 12;
    segments[0] = new Segment(width/2, height/2, len, 0, sw);  

    for (int i = 1; i < segments.length; i++) {
      sw = 12 - i * 3;
      segments[i] = new Segment(segments[i-1], len, 0, sw);
    }
  }

  void update() {
    int total = segments.length;
    Segment end = segments[total-1];
    float targetX = ball.pos.x;
    float targetY = ball.pos.y;
    end.follow(targetX, targetY);
    for (int i = total-2; i >=0; i--) {
      segments[i].follow(segments[i+1]);  
    }
    
    Segment start = segments[0];
    start.setBase(base);
    for (int i = 1; i < total; i++) {
       segments[i].attachToParent(segments[i-1]); 
    }
    
    
  }

  void show() {
    for (Segment s : segments) {
      s.show();
    }
  }
  
}