class DNA {
  float fitness;
  char[] genes;

  DNA() {
    genes = new char[target.length()];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32, 128);
    }
  }

  void fitness() {
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        score++;
      }
      fitness = (float) score / (float) genes.length;
    }
  }

  DNA crossover(DNA partner) {
    int mid = (int) random(0, genes.length);
    DNA child = new DNA();
    for (int i = 0; i < genes.length; i++) {
      if (i < mid) child.genes[i] = genes[i];
      else         child.genes[i] = partner.genes[i];
    }
    return child;
  }

  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate)
        genes[i] = (char) random(32, 128);
    }
  }






  String takeString() {
    return new String(genes);
  }
}