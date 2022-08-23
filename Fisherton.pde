 class Fisherton
  {
    float x;
    float y;
    float scale;
    float speedx;
    float speedy;
    boolean dPressed;
    boolean aPressed;
    boolean wPressed;
    boolean sPressed;
    
     public Fisherton(float x, float y, float scale)
      {
        this.x= x;
        this.y= y;
        this.scale= scale;
        this.speedx= 10;
        this.speedy=0;
      }  
  
    void drawFish()
    {
      //drawing fishy fisherton
      noStroke();
      fill(255,0,0);
      triangle(x-50*scale,y,x-100*scale,y-50*scale,x-100*scale,y+50*scale);
      fill(90,150,60);
      ellipse(x,y,150*scale,90*scale);
      fill(255,0,0);
      curve(x-125*scale,y+50*scale, x-55*scale,y-35*scale, x+55*scale,y-35*scale, x+125*scale,y+50*scale);
      fill(0);
      square(x+50*scale,y-15*scale, 15*scale);
    }
    

    void moveFish()
    {
      pushFish();
      x+=speedx;
      y+=speedy;
      speedx/=1.1;
      speedy/=1.1;
      
      if( x< 30)
      {
        x=30;
      }
      
      if(x> 600)
      {
      x=600;
      }
      
       if( y< 0|| y> 500)
      {
        y=0;
      }
    } 
    
    void pushFish()
    {
      if(dPressed)
        speedx+=1;
        
      if(aPressed)
        speedx-=1;
      
      if(wPressed)
        speedy-=1;
        
      if(sPressed)
        speedy+=1;
    }
    //health
    //amo

  }
