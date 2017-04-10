
GOL game;
int cellSize = 5;
color alive = color(0, 200, 0);
color dead = color(0);
boolean pause = false;
int lastRecordedTime = 0;
int interval = 100;  // milliseconds 1/10th a second

void setup() {
  //size(640, 360);
  fullScreen();
  noSmooth();
  game = new GOL();
  background(0);
  game.start();
}

void draw() {
  background(0);
  game.render();
  if (millis() - lastRecordedTime > interval) {    // magic to make changes in 1/10th of a second only
    lastRecordedTime = millis();
    if (!pause) {
      game.generate();
    }
  }
}


void mousePressed() {
  game.randomize();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    game.randomize();
  }
  if (key == ' ') {
    pause = !pause;
  }
}