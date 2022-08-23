class HUD
{
  int health=5,maxHealth=5;
  float maxHPtop=100;
  float maxHPbottom=140;
  float healthFillR=30;
  float healthFillG=100;
  float bossMeter=10;
  float up=500;
  boolean gameOver=false;
    
  public HUD()
  {
    this.maxHPtop=100;
    this.maxHPbottom=140;
    this.healthFillR=30;
    this.healthFillG=100;
    this.bossMeter=10;
    this.up=500;
  }  
     
  void drawHUD()
  {
       //left health bar
  textSize(27);
  //noStroke();
  fill(250);
  quad(5, 5, 100, 5, 150, 30, 5, 30);
  fill(healthFillR,healthFillG,12);
  quad(8, 8 ,maxHPtop,8 ,maxHPbottom,28,8 ,28);fill(0);//line(81,8,113,28);line(61,8,86,28);line(42,8,59,28);line(24,8,32,28);
     //x1,y1,x2      ,y2,x3         ,y3,x4,y4
     //text(health+"/"+maxHealth,30,25);
  if(health>=4)
  {
    line(81,8,113,28);
  }
  if(health>=3)
  {
    line(61,8,86,28);
  }
    if(health>=2)
  {
    line(42,8,59,28);
  }
    if(health>=1)
  {
    line(24,8,32,28);
  }
  //right score bar
  fill(250);
  quad(600, 5, 795, 5, 795, 30, 650, 30);
   //bottom progress bar
   fill(250);text("Boss progress meter",10,455);
   rect(10,460,780,30);
   fill(205,45,35);
   rect(12,462,bossMeter,26);
   if(bossMeter<776)
   {
    bossMeter+=.2;
   }
   /*if(bossMeter==776)
   {
     fill(205,45,35,50);
     rect(0,up,800,500);
     up-=3;
   }
   */
   if(up<=0)
   {
    up=0;
   }
  //game over screen
  if(gameOver==true)
  {
    fill(205,205,205,50);
    rect(0,0,width,height);
    fill(40,40,40);
    rect(width/2-155,height/2-35,310,100);
    textAlign(CENTER);fill(255);
    text("Game Over",width/2,height/2);
    text("Press \"Space\" To Restart",width/2,height/2+40);
    textAlign(LEFT);

  }
}
}
