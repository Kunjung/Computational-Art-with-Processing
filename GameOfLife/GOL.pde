class GOL {
  int[][] cell;
  int[][] cellNew;

  GOL() {
    // initialize arrays
    cell = new int[width/cellSize][height/cellSize];
    cellNew = new int[width/cellSize][height/cellSize];

    // start the state by randomizing places
    int alive;
    for (int i=1; i<width/cellSize-1; i++) {
      for (int j=1; j<height/cellSize-1; j++) {
        float probability;
        probability = random(100);
        if (probability < 10.0)
          alive = 1;
        else
          alive = 0;
        if (alive == 1) cell[i][j] = 1;
        else cell[i][j] = 0;
      }
    }
  }

  void start() {
    render();
    generate();
  }

  void render() {
    // Draw board
    stroke(50);
    for (int i=0; i<width/cellSize; i++) {
      for (int j=0; j<height/cellSize; j++) {
        if (cell[i][j] == 1) 
          fill(alive);
        else
          fill(dead);
        //draw rectangle
        rect(i*cellSize, j*cellSize, cellSize, cellSize);
      }
    }
  }

  void randomize() {
    int alive;
    for (int i=1; i<width/cellSize-1; i++) {
      for (int j=1; j<height/cellSize-1; j++) {
        float probability;
        probability = random(100);
        if (probability < 20.0)
          alive = 1;
        else
          alive = 0;
        if (alive == 1) cell[i][j] = 1;
        else cell[i][j] = 0;
      }
    }
  }

  // generate new cell
  void generate() {
    //count number of neighbors
    int neighbors = 0;
    for (int i=1; i<width/cellSize-1; i++) {
      for (int j=1; j<height/cellSize-1; j++) {
        neighbors = 0;
        for (int xx=i-1; xx<=i+1; xx++) {
          for (int yy=j-1; yy<=j+1; yy++) {
            neighbors += cell[xx][yy];
          }
        }
        // subtract yourself to get true neighbors
        neighbors -= cell[i][j];

        //find if the cell is alive or dead
        cellNew[i][j] = ruleOfLife(i, j, neighbors);
      }
    }

    // Make the new cell the current cell
    reincarnate();
  }

  //  Helper function used in generate()
  int ruleOfLife(int i, int j, int n) {
    if (cell[i][j] == 1 && n > 3) return 0;    // overpopulated
    else if (cell[i][j] == 1 && n < 2) return 0; // lonely
    else if (cell[i][j] == 0 && n == 3) return 1; // birth
    else return cell[i][j];  // stasis
  }

  // Helper function used in generate()
  void reincarnate() {
    for (int i=0; i<width/cellSize; i++) {
      for (int j=0; j<height/cellSize; j++) {
        cell[i][j] = cellNew[i][j];
      }
    }
  }
}