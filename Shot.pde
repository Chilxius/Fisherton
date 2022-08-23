class Shot
  {
    float x, y;
    float xSpeed;
    float ySpeed;
    boolean pShot, active;
 
 
    public Shot(float x, float y, boolean pShot, boolean active)
    {
      this.x= x;
      this.y= y;
      this.xSpeed= 2;
      this.ySpeed= 0;
      this.pShot= pShot;
      this.active = active;
    }  
 

  void drawShot()
  {
    if(pShot)
    {
      fill(173,216,230);
      circle(x,y,20);
    }
    else //draw spine
    {
      float rotation = atan2( ySpeed, xSpeed );
      translate(x,y);
      rotate( rotation );
      fill(210,190,50);
      triangle(0,-5,0,5,12,0);
      rotate( -rotation);
      translate(-x,-y);
    }
  }
 
  void drawPiranha()
  {
    float rotation = atan2( ySpeed, xSpeed );
    translate(x,y);
    rotate( rotation );
   
    fill(255); //Teeth
    noStroke();
    rect(3,2,5,5);
    rect(6,-5,3,3);
   
    stroke(0);
    fill(150,190,40);  //Fin
    triangle(0,0,-25,-10,-25,10);
   
    fill(170,210,50); //Body
    arc(0,0,35,18,QUARTER_PI,QUARTER_PI*7,PIE);
   
    noStroke();
    fill(255,0,0); //Eye
    circle(2,-5,5);
   
    rotate( -rotation);
    translate(-x,-y);
  }
    void drawSpine()
    {
     
    }
   

    void moveShot()
    {
      x+=xSpeed;
      y+=ySpeed;
      if(x<-20 || x > width+20)
        active=false;
    }
 
  }
