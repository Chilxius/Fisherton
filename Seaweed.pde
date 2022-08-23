 class Seaweed
  {
    float x;
    float y;
    float speed;
  
    public Seaweed(float x, float y, float speed)
    {
      this.x= x;
      this.y= y;
      this.speed= speed;
    }  
  
    void drawSeaweed()
{
  //drawing seaweed
  fill(84,118,75);
  square(x,y,20);
  square(x+9,y-20,20);
  square(x,y-40,20);
  square(x+9,y-60,20);
  square(x+9,y+20,20);
  fill(73,172,45);
  rect(x+11,y-60,2,100);

}
    

    void moveSeaweed()
    {
      x+=speed; 
      if(x<-40)
      {
        x=width+40;
        //y could change
      }
  }
  
  }
  
