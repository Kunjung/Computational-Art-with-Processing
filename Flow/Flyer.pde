class Flyer {
 PVector location;
 PVector acceleration;
 PVector velocity;
 float steerForce;
 float maxSpeed;
 float r;
 
 Flyer(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    steerForce = 2;
    maxSpeed = 15;
    r = 10;
 }
 
 void update() {
   velocity.add(acceleration);
   velocity.limit(maxSpeed);
   location.add(velocity);
   if (location.x < 0) {
     location.x = width;
   }
   if (location.x > width) {
     location.x = 0;
   }
   if (location.y < 0) {
     location.y = height;
   }
   if (location.y > height) {
     location.y = 0;
   }
   acceleration.mult(0);
 }
 
 void display() {
    float angle = velocity.heading() + PI/2;
    pushMatrix();
    fill(1150, 0, 150);
    translate(location.x, location.y);
    rotate(angle);
    beginShape();
    vertex(0, -r/2);
    vertex(-r/2, r);
    vertex(r/2, r);
    endShape(CLOSE);
    popMatrix();
 }
 
 void steer(FlowField flowfield) {
   
     PVector desired = flowfield.lookup(location);
     desired.setMag(maxSpeed);
     PVector steer = PVector.sub(desired, velocity);
     steer.limit(steerForce);
     applyForce(steer);
 }
 
 void applyForce(PVector steer) {
     acceleration.add(steer); 
 }
 
 
  
}