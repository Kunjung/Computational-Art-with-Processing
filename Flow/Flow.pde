FlowField flowfield;
ArrayList<Flyer> flyerSwarm;
boolean drawfield = true;

void setup() {
  size(700, 400);
  //fullScreen();
  flowfield = new FlowField(20);
  flyerSwarm = new ArrayList<Flyer>();
  stroke(0, 100);
}

void draw() {
  background(250);
  if (drawfield) {
    flowfield.display();
  }
  // Make the flyer swarm
  for (Flyer f : flyerSwarm) {
    f.steer(flowfield);
    f.update();
    f.display();
  }
}

void mousePressed() {
  flyerSwarm.add(new Flyer(mouseX, mouseY)); 
}

void mouseDragged() {
  
  flyerSwarm.add(new Flyer(mouseX, mouseY));
}

void keyPressed() {
  drawfield = !drawfield;
}