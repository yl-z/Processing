void setup()
{
size (1100,710);
background(255);
noStroke();
}

void draw() 
{
  float angle = 0.0;
  int full=3;
  
for (int run =0; run<=full; run+=1)
{  
  int max=5;
  
  //RED
  for ( int glow =0; glow<=max; glow+=1)
  {
  
    float glowing = map( glow, 1,max+1,200, 255);
    fill (glowing,glowing/5,glowing/2,glowing);
    
    for (float x=0; x<= width; x+=0.5)
    {
      float y= height/2+(sin(angle)*(height/2));
      ellipse (x,y,2,3);
      //angle += PI/80;
      
      angle += PI/( map ((glow),0,max,80,260));
    }
  
  }
  
  
  //BLUE
  for ( int glow =0; glow<=max; glow+=1)
  {
  
    float glowing = map( glow, 1,max,200, 255);
    fill (0,glowing,glowing,glowing);
  
    for (float x=0; x<= width; x+=0.5)
    {
      float y= height/2+(sin(angle)*(height/2));
      ellipse (x,y,2,2);
      //angle += PI/80;
      
      angle += PI/( map ((glow),0,max,80,260));
    }
  
  }
  
   //YELLOW
  for ( int glow =0; glow<=max; glow+=1)
  {
  
    float glowing = map( glow, 1,max,200, 255);
    fill (glowing,glowing,0,glowing);
  
    for (float x=0; x<= width; x+=0.5)
    {
      float y= height/2+(sin(angle)*(height/2));
      ellipse (x,y,1,1);
      //angle += PI/80;
      
      angle += PI/( map ((glow),0,max,80,260));
    }
  
  }
  
  //YELLOW
  for ( int glow =0; glow<=max; glow+=1)
  {
    
    float glowing = map( glow, 1,max,200, 255);
    fill (glowing,glowing,0,glowing);
    
    for (float x=0; x<= width; x+=0.5)
    {
      float y= height/2+(sin(angle)*(height/2));
      ellipse (x,y,1,1);
      //angle += PI/80;
      
      angle += PI/( map ((glow),0,max,80,260));
    }
  
  }
  
  
}
  
}