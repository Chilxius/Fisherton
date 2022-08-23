class Flowerclouds
  {
    
    float x;
    float y;
    float speed;
  
    public Flowerclouds(float x, float y, float speed)
    {
      this.x= x;
      this.y= y;
      this.speed= speed;
    }  
  
    void drawFlowerclouds()
{
  //draw flowerclouds
  noStroke();
  fill(241,145,155,50);
  //circle(250,200,20);
  circle(x,y,20);
  circle(x,y+20,20);
  circle(x-10,y+10,20);
  circle(x+10,y+10,20);
  fill(255,229,124,50);
  circle(x,y+10,15);
  

}
    

    void moveFlowerclouds()
    {
      x+=speed; 
      if(x<-40)
      {
        x=width+40;
        //y could change
      }
      
  }
  
  }
  
