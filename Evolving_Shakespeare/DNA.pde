class DNA {
  char[] genes;
  float fitness;
  
  DNA() {
    genes = new char[target.length()];
    for (int i = 0; i < genes.length; i++) {
       genes[i] = (char) random(32, 128); 
    }
  }
  
  float getFitness() {
    return fitness;
  }
  
  void fitness() {
     int score = 0;
     for (int i = 0; i < genes.length; i++) {
        if (genes[i] == target.charAt(i)) {
          score++;
        }
     }
     fitness = float(score) / (float)target.length();
     //println(fitness);
    
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA();
    int mid = (int) random(0, genes.length);
    for (int i = 0; i < genes.length; i++) {
      if (i < mid) {
        child.genes[i] = genes[i];
      }
      else {
        child.genes[i] = partner.genes[i];
      }
    }
    
    return child;
  }
  
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
          genes[i] = (char) random(32, 128);
      }
    }
  }
  
  String getPhrase() {
    return new String(genes); 
  }
  
  
}