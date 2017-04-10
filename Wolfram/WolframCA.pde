class WolframCA {
  int[] cells;
  int scale;
  int generation;
  int[] ruleset;

  WolframCA(int[] r) {
    ruleset = r;
    generation = 0;
    scale = 20;
    cells = new int[width/scale];

    begin();
  }

  void begin() {
    //clear cells to 0 and set the middle to 1
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
  }

  void display() {
    //noStroke();
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 0) 
        fill(255);
      else
        fill(20);
      //draw circles
      //ellipse(scale*i, scale*generation, scale, scale);
     //draw rectangles
     rect(scale*i, scale*generation, scale, scale);
  
  }
  }

  void generate() {
    int[] nextGen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextGen[i] = giveMeRule(left, me, right); // find next generation one by one
    }
    cells = nextGen;  // set the cell to nextGen
    generation++;  // increment generation
  }

  int giveMeRule(int l, int m, int r) {
    if (l == 0 && m == 0 && r == 0) return ruleset[0];
    if (l == 0 && m == 0 && r == 1) return ruleset[1];
    if (l == 0 && m == 1 && r == 0) return ruleset[2];
    if (l == 0 && m == 1 && r == 1) return ruleset[3];
    if (l == 1 && m == 0 && r == 0) return ruleset[4];
    if (l == 1 && m == 0 && r == 1) return ruleset[5];
    if (l == 1 && m == 1 && r == 0) return ruleset[6];
    if (l == 1 && m == 1 && r == 1) return ruleset[7];
    return 0;
  }

  boolean isDone() {
    if (generation > height/scale)
      return true;
    else
      return false;
  }

  void restart() {
    begin();
    randomizeRule();
  }
  
  void randomizeRule() {
    for (int i = 0; i < ruleset.length; i++) {
      ruleset[i] = int(random(2));
    }
    //int randomIndex = int(random(9));
    //cells[randomIndex] = 1;
  }
}