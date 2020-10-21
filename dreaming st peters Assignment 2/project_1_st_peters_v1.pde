
float prevx1 = width/2;    
float prevy1 = height/2;

float x1;
float y1;


float prevx2 = width/2;    
float prevy2 = height/2;

float x2;
float y2;

float theta;

int numofsteps = 16;//must be even


float [] stepsuin = new float [numofsteps];
float [] stepsuout = new float [numofsteps];


void setup(){
  size(1000,1000);
  background(255);
  stroke(1,20);
  strokeWeight (1);
  noFill();
  prevx1 = width/2;
  prevy1 = height/2;
  noLoop();
}


void draw(){
       
 for (int i= 0; i<2500; i++) {
  
     theta = 1*random (PI);
    
      x1= ((height-100)/3)* cos(theta)+ width/2;
      y1= ((height-100)/3)* sin(theta)+ 2*height/3;
     
       theta = 1*random (PI);
   
      prevx1= ((height-100)/6)* cos(theta)+ width/2;
      prevy1= ((height-100)/6)* sin(theta)+ 2*height/3;
  
      line (prevx1,prevy1, x1,y1);
      
  
      theta = -1*random (PI);
    
      x2= ((height-100)/3)* cos(theta) + width/2;
      y2= ((height-100)/3)* sin(theta)+ height/3;
     
       theta = -1*random (PI);
   
      prevx2= ((height-100)/6)* cos(theta)+ width/2;
      prevy2= ((height-100)/6)* sin(theta)+height/3;
    
    
      line (prevx2,prevy2, x2,y2);
    
 }
 
 // spiral steps below
 fill (2,20);
 noStroke();
 
 theta = 0;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuin [i] = (height-100)/6* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuin [i+1] = (height-100)/6* sin(theta)+height/3-3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 theta = 0;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuout [i] = (height-100)/3* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuout [i+1] = (height-100)/3* sin(theta)+height/3-3*height/48;
   theta +=HALF_PI/numofsteps;
 }
 
 for (int i = 0; i<numofsteps; i+=2){
   rectMode(CORNERS);
   rect (stepsuin[i],stepsuin[i+1], stepsuout[i], stepsuout[i+1]);
  
 }
 
 theta = PI;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuin [i] = (height-100)/6* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuin [i+1] = (height-100)/6* sin(theta)+2*height/3+3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 theta = PI;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuout [i] = (height-100)/3* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuout [i+1] = (height-100)/3* sin(theta)+2*height/3+3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 
 for (int i = 0; i<numofsteps; i+=2){
   rectMode(CORNERS);
   rect (stepsuin[i],stepsuin[i+1], stepsuout[i], stepsuout[i+1]);
  
 }
 
 
 // spiral steps above
 fill (2,100);
 noStroke();
 
 theta = 0;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuin [i] = -(height-100)/6* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuin [i+1] = (height-100)/6* sin(theta)+height/3-3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 theta = 0;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuout [i] = -(height-100)/3* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuout [i+1] = (height-100)/3* sin(theta)+height/3-3*height/48;
   theta +=HALF_PI/numofsteps;
 }
 
 for (int i = 0; i<numofsteps; i+=2){
   rectMode(CORNERS);
   rect (stepsuin[i],stepsuin[i+1], stepsuout[i], stepsuout[i+1]);
  
 }
 
 theta = PI;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuin [i] = -(height-100)/6* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuin [i+1] = (height-100)/6* sin(theta)+2*height/3+3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 theta = PI;
 for (int i = 0; i<numofsteps; i+=2){
   stepsuout [i] = -(height-100)/3* cos(theta)+width/2;
   theta += HALF_PI/numofsteps;
   stepsuout [i+1] = (height-100)/3* sin(theta)+2*height/3+3*height/48;
   theta += HALF_PI/numofsteps;
 }
 
 
 for (int i = 0; i<numofsteps; i+=2){
   rectMode(CORNERS);
   rect (stepsuin[i],stepsuin[i+1], stepsuout[i], stepsuout[i+1]);
  
 }
 
 
 
//The portico outlines
strokeWeight (10);
stroke (0);
line ( 0,300+height/24,150, 310+height/24);
line ( 0,600+height/24,150, 590+height/24);
 
 
line ( width,300+height/24,width-150, 310+height/24);
line ( width,600+height/24,width-150, 590+height/24);
 
 
//general flow of traffic
noFill();
strokeWeight (1);
stroke (1,20);
for (int i = 0; i<500; i++){
line ( 0,random (300, 600) + height/24, width, random (300, 600)+ height/24);
}


//people
fill (100, 20);
stroke (1,20);
strokeWeight (1);
for (int i = 0; i<500; i++){
ellipse ( random (0, width),random (0, height), 6,6);
}
}


void keyReleased (){
  if (key =='s'||key == 'S' ) {
    saveFrame("####.png");
  }
}