class Boss_Monster
{
  float x=1200;
  float y=250;
  float eyeX=865;
  boolean active = true;
  float spineLength = 400;
  
  void drawBoss_Monster()
  {
    if(active)
    {
      if(x>1100)
      {
        x--;
      }
      else //draw spines
      {
        if(spineLength < 500)
          spineLength+=5;
        for(int i = 0; i < 160; i++)
        {
          translate(x,y);
          rotate(PI/40);
          stroke(255,100,100);
          strokeWeight(4);
          line(spineLength,0,0,0);
          translate(-x,-y);
        }
      }
      if(eyeX>765)
      {
        eyeX--;
      }
      fill(255,100,100);
      circle(x,y,800);
      fill(0);
      circle(eyeX,150,50);
      circle(eyeX,340,50);
    }
  }
}
