String target = "To Be or Not to Be";
float mutationRate;
int totalPopulation = 150;

DNA[] population;
ArrayList<DNA> matingPool;
int generation = 0;

float bestFit = 0.0;
int pos = 0;

void setup() {
  size(displayWidth, 360);

  mutationRate = 0.01;                  // mutation is set to 1%

  // Step 1: Initialize population
  population = new DNA[totalPopulation];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }
  background(0);
  fill(0);
  
}

void draw() {
  background(250);
  
  // Step 2: Selection
  calculateFitnessForAll();
  
  // Draw the text with fitness. Done here on top because down child's fitness is not calculated
  findBest();
  drawText();

  // Make Mating Pool from the population. The DNA of the high fitness are more likely to be selected
  makeMatingPool();
  
  // Step 3: Reproduction
  reproduction();
  
} // END OF DRAW()


/* Helper Functions */
void calculateFitnessForAll() {
  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
    if (population[i].fitness == 1.0) noLoop(); // When target is acquired, stop evolving
  }
}

void findBest() {
  for (int i = 0; i < population.length; i++) {
    if (bestFit < population[i].fitness) {
        bestFit = population[i].fitness;
        pos = i;
    }
  }
}

void drawText() {
 String genesOfFittest = population[pos].getPhrase();
  // Print to see at console how far you've gone in fitness, position and generation number
  println(genesOfFittest, " Fitness: "+ bestFit, " Position: "+ pos, " Generation: " + generation);
  
  // Draw the Text in window
  float blue = map(population[pos].fitness, 0, 1, 255, 0);
  float red = map(population[pos].fitness, 0, 1, 0, 255);
  fill(red, 0, blue);
  textSize(width/(float)target.length()*1.7);
  textAlign(CENTER);
  text(genesOfFittest, width/2, height/2); 
}

void makeMatingPool() {
 
  // Using the Monte Carlo method (like filling a bag with a lot of balls
  //  of the same type and then choosing randomly
  matingPool = new ArrayList<DNA>();
  
  for (int i = 0; i < population.length; i++) {
    
    int n = int(population[i].fitness * 100);
    for (int j = 0; j < n; j++) {
      matingPool.add(population[i]);
    }
  } 
}

void reproduction() {
 generation++;
  for (int i = 0; i < population.length; i++) {
    int a = int(random(matingPool.size()));
    //println("PartnerA: " + a);
    int b = int(random(matingPool.size()));
    //println("PartnerB: " + b);
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    DNA child = partnerA.crossover(partnerB);
    
    child.mutate(mutationRate);
    
    population[i] = child;    // overwrite first generation
  }  
}