int n = 5;
float[] hlst = new float [n];
float[] vlst = new float [n];
float factorial=1;
float value = 255;
void setup () {
  size (800, 800);
  background(255);
  noLoop();
  //stroke(3);
  //strokeCap(SQUARE);
  vlst[0] = 0;
  for (int i = 0; i < n; i++){
    vlst[i] = (i+1) * width / (n + 1);
  }
  hlst[0] = 0;
  for (int i = 0; i < n; i++){
    hlst[i] = (i+1) * width / (n + 1);
  }
  for (int i = 0; i < n; i++){
    factorial = factorial * (n-i); //<>//
  }
  //hint(ENABLE_STROKE_PURE);
  //println (lst);
}


void draw () {
  determinant (hlst, vlst, 0, n-1);
  
}


void determinant (float[] hlst,float[] vlst, int left, int right) {
  
  if (left == right){ //<>//
    value -= 250/(factorial) - 5;
    for (int i = 0; i < n-1; i++){
      stroke(0, 0, 0, value);
      strokeWeight(1);
      line(hlst[i], vlst[i] , hlst[i+1], vlst[i+1]); //<>//
    }
 //<>//
  }
  else { //<>//
    for (int i = left; i < right+1; i++){
      float swap = vlst[left];
      vlst[left] = vlst[i];
      vlst[i] = swap;
      determinant (hlst, vlst, left + 1, right);
      swap = vlst[left];
      vlst[left] = vlst[i];
      vlst[i] = swap;
      println(vlst);
      
    }
  }
}