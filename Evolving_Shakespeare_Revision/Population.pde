class Population {
  DNA[] population;
  ArrayList<DNA> matingPool;
  float mutationRate;
  int populationSize;
  int generation;

  int positionOfFittest;
  float fitnessWorldRecord;

  Population() {
    mutationRate = 0.008;
    populationSize = 600;
    generation = 0;

    positionOfFittest = 0;
    fitnessWorldRecord = 0.0;

    matingPool = new ArrayList<DNA>();
  }
  
  // Step 1 : Initialize population
  void initializePopulation() {
    population = new DNA[populationSize];
    for (int i = 0; i < population.length; i++) {
      population[i] = new DNA();
    }
  }
  
  // Step 2 : Calculate fitness for each population member
  void calculateFitnessForAll() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness(); 
      // Condition to stop evolution
      if (population[i].fitness == 1.0) noLoop();
    }
  }
  
  // Step 3 : Find fittest among the population
  void findFittest() {
    positionOfFittest = 0;
    fitnessWorldRecord = 0.0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > fitnessWorldRecord) {
        fitnessWorldRecord = population[i].fitness;
        positionOfFittest = i;
      }
    }
  }

  // Step 4 : Draw the genes of the Fittest in the screen
  void drawGenesOfFittest() {
    textSize(width/target.length() * 1.7);
    textAlign(CENTER);
    String thing = population[positionOfFittest].takeString();
    text(thing, width/2, height/2);

    // print in the console for testing
    println(thing + " Fitness: " + population[positionOfFittest].fitness + " Gen: " + generation);
  }

  // Step 5 : create mating pool using the Monte Carlo thing
  void createMatingPool() {
    matingPool = new ArrayList<DNA>();
    for (int i = 0; i < population.length; i++) {
      float num = population[i].fitness * 100.0;
      int n = int(num);
      //text(n, width/4, 0); noLoop();
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }
  
  // Step 6 : select two DNAs from the mating pool and perform crossover
  void selectTwoAndCrossOver() {
    generation++;
    for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));

      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);

      DNA child = partnerA.crossover(partnerB);
      // Step 7 : Mutate child
      child.mutate(mutationRate);

      population[i] = child;                    // Replace the old generation with new one
    }
  }
}