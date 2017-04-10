

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  //frameRate(30);
}

void draw() {
  drawCircle(width/2, height/2, 200);
}

void drawCircle(float x, float y, int d) {
  noFill();
  stroke(0, 200, 0);
  ellipse(x, y, d, d);
  
  if (d > 3) {
    drawCircle(x+d/2, y, d/2);
    drawCircle(x-d/2, y, d/2);
    //drawCircle(x, y-d/2, d/2);
    drawCircle(x, y+d/2, d/2);
    
  }
  
  
}