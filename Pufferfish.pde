 class Pufferfish
  {
    float x;
    float y;
    float scale;
    float speed;
    float rotation;
    int shotsLeft;
    boolean active;
    //Shot s;
    
    public Pufferfish(float x, float y, float scale)
      {
        this.x= x;
        this.y= y;
        this.scale=scale;
        this.speed= -2;  
        rotation = 0;
        shotsLeft = 2;
        active=true;
      }  
      
   void drawPufferfish()
    {
      //draw small spikes
      fill(200,100,100);
      square( x-20*scale, y-20*scale, 40*scale);
    
      //drawing big spikes
      fill(255,229,124);
      triangle( x, y-40*scale, x-15*scale, y+15*scale, x+15*scale, y);
      triangle( x-40*scale, y, x, y-15*scale, x, y+15*scale);
      triangle( x-15*scale, y, x+15*scale, y, x, y+40*scale);
      triangle( x-15*scale, y-20*scale, x+40*scale, y, x, y+15*scale);
    
      //draw body
      fill(255,186,0);
      ellipse( x, y, 50*scale, 50*scale);
    
      //draw eyes
      fill(0);
      ellipse( x-7*scale, y-5*scale, 10*scale, 15*scale);
      ellipse( x+7*scale, y-5*scale, 10*scale, 15*scale);
      fill(255);
    
      //MR RITCHIE: I fixed the eyes.
    
      //left pupil
      rotation = atan2( fish.y-(y-8*scale), fish.x-(x-5*scale) );
      translate(x-8*scale, y-5*scale);
      rotate( rotation );
      circle( 3, 0, 5*scale);
      rotate( -rotation );
      translate( -(x-8*scale), -(y-5*scale) );
    
      //right pupil
      rotation = atan2( fish.y-(y-5*scale), fish.x-(x+6*scale) );
      translate(x+6*scale, y-5*scale);
      rotate( rotation );
      circle( 3, 0,5*scale);
      rotate( -rotation );
      translate( -(x+6*scale), -(y-5*scale) );
    
    
      //draw nose
      fill(255, 0, 0);
      circle( x, y+6*scale, 15*scale);
    }
    
    void movePufferfish()
    {
      x+=speed;
      
      if( x <= (width/4)*(shotsLeft+1) && shotsLeft>0)
        Shoot();
        
      if(x<-40)
      {
        active=false;
        //y could change
      }
    }
    
    void Shoot()
    {
      shotsLeft--;
      Shot s = new Shot(x,y,false,true);
      
      calculateSlope(s,fish.x,fish.y);
      spines.add(s);
    }
  }
