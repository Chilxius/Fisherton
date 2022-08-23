class Coral
{
  float x;
  float y;
  float speed;
  
  public Coral(float x, float y, float speed)
  {
    this.x= x;
    this.y= y;
    this.speed= speed;
  }  
  
  void drawCoral()
  {
  //draws coral
  noStroke();
  fill(248,131,121);
  //rect(200,400,4,70);
  rect(x,y,4,70);
  rect(x-20,y+30,40,4);
  rect(x-20,y+5,4,25);
  rect(x+16,y+5,4,25);
  rect(x-20,y+50,40,4);
  }

  void moveCoral()
  {
    x+=speed; 
    if(x<-40)
    {
      x=width+40;
      //y could change
    }
  }
  
}
