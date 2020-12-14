int rem = 1000; //size of array
float [] x = new float[rem];
float [] y = new float[rem];

float xcentre;
float ycentre;

float theta;
float radius;

boolean initiated=false;

void setup(){
  size(1000,800);
  background(0);
  stroke(255,20);
  strokeWeight (2);
  frameRate(100);
}

void mousePressed(){
  initiated=false;
  xcentre= mouseX;
  ycentre= mouseY;
}
  
void mouseReleased(){
  initiated=true; 
  radius = sqrt((mouseX-xcentre)*(mouseX-xcentre)+ (mouseY-ycentre)*(mouseY-ycentre));
}
    
void draw(){
   
   if (initiated==true){
        background(0);
        theta = random (TWO_PI);
        for ( int i = (rem-1); i>0; i--){
          x[i] = x[i-1];
          y[i] = y[i-1];
        }
          
        x[0]= radius* cos(theta)+ xcentre;
        y[0]= radius* sin(theta)+ ycentre;
       
        for (int i = (rem-1); i>0; i--) {
        line (x[i],y[i], x[i-1],y[i-1]);
        }
   }
}

void keyReleased(){
  initiated=false;
     if (key=='s'||key=='S') {
       saveFrame("##.png");
     }
     
}