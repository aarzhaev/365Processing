// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class CA {
  int[] cells; 
  int[] ruleset; 
  int w = 5; 
  int generation = 0;
  PVector loc;
  PVector vel;

  CA(int[] r) {
    ruleset = r;
    cells = new int[width]; 
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0; 
    }
    cells[cells.length/2] = 1; 
    loc = new PVector(0,0);
    vel = new PVector(random(-1,1), random(-1,1));
  }

  void generate() {
    int[] nextgen = new int[cells.length]; 
    for (int i = 1; i < cells.length-1; i++) { 
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right); 
    }
    cells = nextgen; 
    generation++; 
  }

  int rules (int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2); 
    return ruleset[index]; 
  }

  void display() {
    loc.add(vel);
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);
      noStroke();
      float numPoints = 300;
      float angle = TWO_PI/numPoints;
      float x = sin(angle*i) * generation;
      float y = cos(angle*i) * generation;
      ellipse(x+loc.x, y+loc.y, w, w);
    }
  }
  
  boolean finished() {
    if (generation > 325) {
      return true;
    } else {
      return false;
    }
  }
}

