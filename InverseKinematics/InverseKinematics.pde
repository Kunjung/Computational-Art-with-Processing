Segment end;
Segment start;
PVector base;

void setup() {
  size(600, 400);
  Segment current = new Segment(100, 200, 100, 0, 12);
  start = current;
  
  for(int i = 0; i < 4; i++) {
    int sw = 12 - i * 3;
    Segment next = new Segment(current, 50, radians(0), sw);
    current.child = next;
    current = next;
  }
  end = current;
  
  base = new PVector(width/2, height);
  stroke(255);
  strokeWeight(5);
}

void draw() {
  background(20);
  
  end.follow(mouseX, mouseY);
  //end.show();
  
  // Step 1 - Start from the target position
  Segment next = end.parent;
  while (next != null) {
    next.follow();
    next = next.parent;
  }
  
  // Step 2 - Move to the base position
  start.setBase(base);
  next = start.child;
  
  while (next != null) {
    next.attachToParent();
    next = next.child;
  }
  
  // Step 3 - Display all the segments
  next = end;
  while (next != null) {
     next.show();
     next = next.parent;
  }
  
}