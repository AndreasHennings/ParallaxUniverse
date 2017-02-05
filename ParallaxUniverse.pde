PImage bg;
PGraphics stars;

//factors for noise resolution
float f=0.005;
float f2=0.0001;

int s =2; //size of universe 

int xPos=0;
int yPos=0;
int counter=0;

void setup()
{
  fullScreen();
  bg=new PImage(width*s, height*s);
  stars= createGraphics(width*s, height*s);
  initImg();
  initStars();
  imageMode(CENTER);
}

void draw()
{
  background(0);
  
  image(stars,width/2+xPos/8,height/2+yPos/8);
  image(bg,width/2+xPos/6,height/2+yPos/6);
  image(stars,width/2+xPos/4,height/2+yPos/4);
  image(stars,width/2+xPos/2,height/2+yPos/2);
   
}

void mouseMoved()
{
  xPos+=(pmouseX-mouseX)*3;
  yPos+=(pmouseY-mouseY)*3;
}

void initImg()
{
  float f=0.005;
  float f2=0.0140;

  bg.loadPixels();
  for (int y = 0 ; y < bg.height ; y++)
  {
    for (int x = 0 ; x < bg.width ; x++)
    {
   
      float n0=map(noise(x*f,y*f),0,1,0,255);
      float n1=map(noise(1+ x*f, 1+ y*f),0,1,0,255);
      float n2=map(noise(2+ x*f, 2+ y*f),0,1,0,255);
      float n3=map(noise(2+ x*f2, 2+ y*f2),0,1,0,255);
      
      bg.pixels[y*bg.width+x]= color(n0,n1,n2,n3); 
    }
  }
  bg.updatePixels();
  
}

void initStars()
{
  stars.beginDraw();
  stars.background(0,0);
  stars.noStroke();
   
  for (int i=0; i< 1000; i++)
  {
    float x=random(stars.width);
    float y=random(stars.height);
    
    for (float r=random(500); r>0; r-=5)
    {
      stars.fill(255,255,255,255/(r*r*0.1));
      stars.ellipse (x, y, r,r);
    }     
  } 
  stars.endDraw();
}