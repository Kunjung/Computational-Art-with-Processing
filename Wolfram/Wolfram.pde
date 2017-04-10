
WolframCA wolfram;

void setup() {
  size(640, 360);
  background(255);
  int[] ruleset = {0, 0, 1, 1, 0, 1, 0, 1};
  wolfram = new WolframCA(ruleset);
  wolfram.begin();
  
  frameRate(10);
}

void draw() {
  wolfram.display();
  wolfram.generate();

  if (wolfram.isDone()) {
    background(255);
    wolfram.restart();
  }
}