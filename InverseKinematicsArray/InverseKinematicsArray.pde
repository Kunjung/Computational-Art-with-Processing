ArrayList<Tentacle> tentacles = new ArrayList<Tentacle>();
Ball ball;
float num = 7;
float size = 80;
void setup() {
  fullScreen();
  ball = new Ball(width/2, 0);
  float da = TWO_PI/num;
  for (float i = 0; i < TWO_PI; i += da) {
    float x = width/2 + size*cos(i);
    float y = height/2 + size*sin(i);
    Tentacle tentacle = new Tentacle(x, y);
    tentacles.add(tentacle);
  }
  
}

void draw() {
  background(50);
  ball.update();
  ball.show();
  
  for (Tentacle t: tentacles) {
     t.update();
     t.show();
  }
}