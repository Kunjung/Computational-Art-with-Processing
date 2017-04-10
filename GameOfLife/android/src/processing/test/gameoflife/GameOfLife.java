package processing.test.gameoflife;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GameOfLife extends PApplet {


GOL game;
int cellSize = 5;
int alive = color(0, 200, 0);
int dead = color(0);
boolean pause = false;
int lastRecordedTime = 0;
int interval = 100;  // milliseconds 1/10th a second

public void setup() {
  //size(640, 360);
  
  
  game = new GOL();
  background(0);
  game.start();
}

public void draw() {
  background(0);
  game.render();
  if (millis() - lastRecordedTime > interval) {    // magic to make changes in 1/10th of a second only
    lastRecordedTime = millis();
    if (!pause) {
      game.generate();
    }
  }
}


public void mousePressed() {
  game.randomize();
}

public void keyPressed() {
  if (key == 'r' || key == 'R') {
    game.randomize();
  }
  if (key == ' ') {
    pause = !pause;
  }
}
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
        if (probability < 10.0f)
          alive = 1;
        else
          alive = 0;
        if (alive == 1) cell[i][j] = 1;
        else cell[i][j] = 0;
      }
    }
  }

  public void start() {
    render();
    generate();
  }

  public void render() {
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

  public void randomize() {
    int alive;
    for (int i=1; i<width/cellSize-1; i++) {
      for (int j=1; j<height/cellSize-1; j++) {
        float probability;
        probability = random(100);
        if (probability < 20.0f)
          alive = 1;
        else
          alive = 0;
        if (alive == 1) cell[i][j] = 1;
        else cell[i][j] = 0;
      }
    }
  }

  // generate new cell
  public void generate() {
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
  public int ruleOfLife(int i, int j, int n) {
    if (cell[i][j] == 1 && n > 3) return 0;    // overpopulated
    else if (cell[i][j] == 1 && n < 2) return 0; // lonely
    else if (cell[i][j] == 0 && n == 3) return 1; // birth
    else return cell[i][j];  // stasis
  }

  // Helper function used in generate()
  public void reincarnate() {
    for (int i=0; i<width/cellSize; i++) {
      for (int j=0; j<height/cellSize; j++) {
        cell[i][j] = cellNew[i][j];
      }
    }
  }
}
  public void settings() {  fullScreen();  noSmooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GameOfLife" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
