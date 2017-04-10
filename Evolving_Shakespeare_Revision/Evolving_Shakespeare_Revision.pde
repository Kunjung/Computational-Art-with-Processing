String target = "The Chosen One is ";

Population population;

void setup() {
  size(displayWidth, 400);
  int number = randomNumber(1, 48);
  target += Integer.toString(number);
  population = new Population();

  population.initializePopulation();
}

void draw() {
  background(0);
  fill(255);
  population.calculateFitnessForAll();
  population.findFittest();

  population.drawGenesOfFittest();

  population.createMatingPool();

  population.selectTwoAndCrossOver();
}


int randomNumber(int x, int y) {
  int number = floor(random(x, y));
  while (number == 18) {
    number = floor(random(x, y));
  }
  return number;
}