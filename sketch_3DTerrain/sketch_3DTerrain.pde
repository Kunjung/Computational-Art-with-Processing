int w = 2000;
int h = 1700;
int scl = 20;
int rows;
int cols;

int jumpiness = 100;

float flying = 0.0;
float[][] terrain;

void setup() {
  size(displayWidth, displayHeight, P3D);
  rows = width/scl;
  cols = height/scl;
  
  terrain = new float[rows][cols];
  
}

void draw() {
  //calculating new terrain just flying ny
  flying -= 0.3;
  
  float xoff = flying;
  for (int x = 0; x < rows; x++) {
    float yoff = 0.0;    
    for (int y = 0; y < cols; y++) {
      
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -jumpiness, jumpiness);
      yoff += 0.1;
    }
    xoff += 0.1;
  }
  
  
  
  
  
  
  
  // drawing terrain
  background(0);
  stroke(255);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);

  translate(-width/2+width/2, -height/2);

  for (int x = 0; x < rows; x++) {
    beginShape(TRIANGLE_STRIP);
    for (int y = 0; y < cols-1; y++) {

      vertex(y*scl, x*scl, terrain[x][y]);
      vertex(y*scl, (x+1)*scl, terrain[x][y+1]);
      
     // vertex(y*scl, x*scl, random(-jumpiness, jumpiness));
     // vertex(y*scl, (x+1)*scl, random(-jumpiness, jumpiness));
    }
    endShape();
  }
}