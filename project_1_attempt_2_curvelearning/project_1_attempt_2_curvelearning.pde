int num;
int x=1;
int stepsize=30;

void setup() {
  size(800, 800);
  background(255);
  smooth();
  frameRate (1);
  noFill();
  stroke(0);
  
  
}


void draw (){
  
  num = (int) random (0,5);
  
  int[] coords = new int[10];
  
  for (int i = 0; i< coords.length; i+=2) {
    coords [i] = (int) random (x, x+stepsize);
    coords [i+1] = (int) random (1, width);
  }
  
  
  
  beginShape();
  curveVertex (40,40);
  for (int i = 0; i < coords.length; i += 2) {
  curveVertex(coords[i], coords[i+1]); // the first control point
  }
  curveVertex(50, 150); // is also the last control point
  endShape();

  x+=stepsize;
  
}