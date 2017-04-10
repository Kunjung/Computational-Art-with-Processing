
float angle;
float len = 300;

void setup() {
  fullScreen();
  //size(900, 600);
}

void draw() {
  background(0);
  stroke(0, 200, 0);
  strokeWeight(1);
  angle = mouseX / (float) width * 90;
  angle = radians(angle);
  translate(width/2, height);
  line(0, 0, 0, -len);
  translate(0, -len);
  branch(len);
}

void branch(float h) {
  
  h *= 0.66;
  if (h > 2) {
    pushMatrix();  // save state 
    rotate(angle);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();  //reset
    
    pushMatrix();  //save state
    rotate(-angle);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}