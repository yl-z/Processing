float prevx1 = width/2;    
float prevy1 = height/2;

float x1;
float y1;

float theta;


void setup(){
  size(800,800);
  background(255);
  stroke(1,20);
  prevx1 = width/2;
  prevy1 = height/2;
  frameRate(100);
}


void draw(){
 
  //first inner ring
    theta = random (TWO_PI*7);
    
    if (theta < TWO_PI) {
      x1= 25* cos(theta)+ width/2;
      y1= 25* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    //next second ring
    else if ( theta < 2*TWO_PI){
      x1= 150* cos(theta)+ width/2;
      y1= 300* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    
    else if (theta <3*TWO_PI) {
      x1= 300* cos(theta)+ width/2;
      y1= 150* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    
    else if (theta <4*TWO_PI) {
      x1= 300* cos(theta)+ width/2;
      y1= 400* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    
    else if (theta <5*TWO_PI) {
      x1= 400* cos(theta)+ width/2;
      y1= 300* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    
    else if ( theta < 6*TWO_PI){
      x1= 300* cos(theta)+ width/2;
      y1= 300* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
    
    else if ( theta < 7*TWO_PI){
      x1= 400* cos(theta)+ width/2;
      y1= 400* sin(theta)+ height/2;
     
      line (prevx1,prevy1, x1,y1);
   
      prevx1=x1;
      prevy1=y1;
    }
  

}


void keyReleased (){
  if (key =='s'||key == 'S' ) saveFrame("##.png");
}