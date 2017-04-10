float abra = 0.00;
int len = 20;

void setup() {
  //size(600, 360);
  fullScreen();
  noFill();
  smooth();
  
}

void draw() {
  background(255);

  type1();
  type2();

  abra += 0.03;
}

void type1() {
  stroke(0, 200, 0);
  for (int i=0; i<len; i++) {
    bezier(width/2, height, 
      width/2, noise(abra, i, 1)*height, 
      noise(abra, i, 2)*width, noise(abra, i, 3)*height, 
      noise(abra, i, 4)*width, noise(abra, i, 5)*height);
  }
  
}

void type2() {
  stroke(200, 0, 0);
  for (int i=0; i<len; i++) {
    bezier(width/2, height, 
      width/2, noise(abra, 1)*height, 
      noise(abra, 2)*width, noise(abra, 3)*height, 
      noise(abra, 4)*width, noise(abra, 5)*height);
      abra += 0.005;
  }
  
}