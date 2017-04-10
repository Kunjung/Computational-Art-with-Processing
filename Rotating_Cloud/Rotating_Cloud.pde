int len = 200;

float[] cloudx = new float[len];
float[] cloudy = new float[len];
float[] cloudz = new float[len];

void setup() {
 size(displayWidth, displayHeight, P3D);
 noFill();
 stroke(205);
 strokeWeight(1);
 for (int i=0; i<len; i++) {
    cloudx[i] = random(-len, len); 
    cloudy[i] = random(-len, len);
    cloudz[i] = random(-len, len);
 }
}

void draw() {
  background(100);
  translate(width/2, height/2);
  rotateY(frameCount / 100.0);
  box(len*2);
  
  for (int i=0; i<len; i++) {
     strokeWeight(1);
     line(cloudx[i], cloudy[i], cloudz[i], 0, 0, 0);
     strokeWeight(10);
     point(cloudx[i], cloudy[i], cloudz[i]);
  }
  
}