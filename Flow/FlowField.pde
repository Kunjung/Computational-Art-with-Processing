class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
    
  }
  
  void init() {
     float xoff = 0;
     float yoff;
     for (int i = 0; i < cols; i++) {
       yoff = 0;
       for (int j = 0; j < rows; j++) {
         float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
         field[i][j] = PVector.fromAngle(theta);
         yoff += 0.1;
       }
       xoff += 0.1;
     }
  }
  
  void display() {
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
         pushMatrix();
         translate(i*resolution+resolution, j*resolution+resolution);
         rotate(field[i][j].heading());
         float len = field[i][j].mag()*resolution;
         line(0, 0, len, 0);
         line(len, 0, len - resolution/4, -resolution/4);
         line(len, 0, len - resolution/4, resolution/4);
         popMatrix();
      }
    }
  }
  
  PVector lookup(PVector location) {
    int x = (int)constrain(location.x/resolution, 0, cols-1);
    int y = (int)constrain(location.y/resolution, 0, rows-1);
    
    return field[x][y].copy();
    
  }
  
  //PVector giveDirection(float x, float y) {
  //  int xx = (int)x/resolution;
  //  int yy = (int)y/resolution;
  //  PVector dir = field[xx][yy].copy();
  //  dir.setMag(resolution);
  //  return dir;
  //}
  
  
  
}