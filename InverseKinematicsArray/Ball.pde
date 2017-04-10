class Ball {
  PVector pos;
  PVector vel;
  PVector acc;

  Ball(float x, float y) {
    pos = new PVector(x, y);
    float d = 7;
    vel = new PVector(d, 0);
    float g = 0.9;
    acc = new PVector(0, g);
  }  

  void update() {
    vel.add(acc);
    pos.add(vel);
    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }


    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
    if (pos.y > height) {
      pos.y = height;
    }
  }

  void show() {
    noStroke();
    fill(0, 200, 0);
    ellipse(pos.x, pos.y, 58, 58);
  }
}