import processing.serial.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import javax.swing.KeyStroke;

Serial myPort;
int stop = 2;
boolean oPort = true; //o(pened) port
int check = 1;
int hLights = 5; 
boolean space = false;
//h(ealth)Lights determines which/how many lights are active
//depending on the players health
/////////////////////////////////////////////////////////


Fisherton fish = new Fisherton(100,100,.5);

Boss_Monster boss = new Boss_Monster();

HUD gameHUD = new HUD();

ArrayList<Coral> corals = new ArrayList<Coral>();
ArrayList<Seaweed> seaweeds = new ArrayList<Seaweed>();
ArrayList<Pufferfish>  pufferfish  = new ArrayList<Pufferfish>();
ArrayList<Flowerclouds> flowerclouds = new ArrayList<Flowerclouds>();
ArrayList<Shot> spines = new ArrayList<Shot>();
void setup()
{
  size(800,500);
  for( int i = 0; i < 5; i++)
  {
    corals.add( new Coral(random(width),random(340,400),random(-2,-1)));
    seaweeds.add( new Seaweed(random(width),random(370,390),random(-2,-1)));
    flowerclouds.add( new Flowerclouds(random(width),random(0,200),random(-2,-1)));
  }
    
  boss.active = false;
  
  try //try to open the serial port
  {
    String COM7 = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
    myPort = new Serial(this, "COM7", 9600);
    myPort.bufferUntil('\n');
  }
  // if serial port fails to open,
  catch (RuntimeException e)
  {
    //set the variable to check if the port is opened to false
    oPort = false;
  }
}

void draw()
{
  background(137,207,240);
  drawBackground();
  moveBackground(1);

  fish.drawFish();
  fish.moveFish(); 
  
  drawPufferfish();
  gameHUD.drawHUD();
  
  if(gameHUD.bossMeter>=776 && !boss.active)
  {
    //boss.active=true;
    boss = new Boss_Monster();
  }
  if(boss.active==true)
  {
    boss.drawBoss_Monster();
  }
  if(boss.active==true && gameHUD.bossMeter<1)
  { 
    boss.active=false;
  }

  checkCollisions();
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
    fish.dPressed=true;
    
  if(key == 'a')
    fish.aPressed=true;
    
  if(key == 'w')
    fish.wPressed=true;
    
  if(key == 's')
    fish.sPressed=true;
    
  if(key == ' ')
     spines.add(new Shot(fish.x,fish.y,true,true));

}

void keyReleased()
{
  if( key == 'd' || key == 'D')
    fish.dPressed=false;
    
  if( key == 'a')
    fish.aPressed=false;
    
  if( key == 'w')
    fish.wPressed=false;
    
  if( key == 's')
    fish.sPressed=false;
}

public void startController()
{
  //if the serial port is opened
  if (oPort == true)
  {
    //inform the user and use the code stored here
    if (check == 1)
    {
      println("Controller attached");
      check = 0;
    }
    if ( stop == 1)
    {
      println(hLights);
      myPort.write(""+hLights);
      stop = 0;
    }
    /*  if (space == true)
     {
     stop = 1;
     hLights = 2;
     }
     if (space == false)
     stop = 0;
     
     if (mousePressed == true)
     {
     stop = 1;
     hLights = 0;
     }
     if (mousePressed == false)
     {
     stop = 1;
     hLights = 5;
     }*/
  }

  //if the port is NOT opened
  else
    //tell the user there is no controller to be used, and just 
    //use the game's code without ever looking at this tab
    if (check == 1)
    {
      println("No controller attached.");
      check = 0;
    }
}

void mousePressed()
{
    pufferfish.add( new Pufferfish(width+50, random(height),random(.3,.6)));
}

void drawBackground()
{
  
  //ground
  noStroke();
  fill(201,182,120);
  rect(0,425,800,75);
  ellipse(50,423,200,50);
  ellipse(250,423,250,80);
  ellipse(400,423,200,50);
  ellipse(620,423,250,80);
  ellipse(750,423,200,50);
  
 // c.drawCoral();
 
  for( Seaweed k: seaweeds)
    k.drawSeaweed();
    
  for( Coral k: corals)
    k.drawCoral();
    
  for(Flowerclouds k: flowerclouds)
    k.drawFlowerclouds();
      
}

void drawPufferfish() //draws and moves pufferfish and their shots
{
  for( Pufferfish k: pufferfish)
  {
    k.drawPufferfish();
    k.movePufferfish();
  }
     
  for(Shot s: spines)
  {
    s.moveShot();
    s.drawShot();
  }
  
  for(int i = 0; i < pufferfish.size(); i++)
    if(!pufferfish.get(i).active)
    {
      pufferfish.remove(i);
      i--;
    }  
  for(int i = 0; i < spines.size(); i++)
    if(!spines.get(i).active)
    {
      spines.remove(i);
      i--;
    }
}

void moveBackground(float speed)
{
 //c.moveCoral();
  for( Coral k: corals)
    k.moveCoral();
    
    for( Seaweed k: seaweeds)
    k.moveSeaweed();
    
    
    for( Flowerclouds k: flowerclouds)
    k.moveFlowerclouds();
}

/*************************
it calculates the slope by taking the x and Y position of the fish, as a float as well as the shots x and y position

it figures slope by using the slope formula.

          rise      Y2 -  Y1    tY - eY
  slope = ----  =  ---------  = --------
           run      X2 -  X1     tX - eX
  after finding rise and run and then correcting it to ensure that it hits the target it makes the shots speed.X and speed.Y equal the rise and run
 
*************************/

void calculateSlope(Shot s, float fX, float fY)
{
  float rise = fY - s.y;
  float run = fX - s.x;
 
  if(abs(rise) < abs(run))
  {
    rise = rise/run;
    run = 1;
  }
  else
  {
    run = run/rise;
    rise = 1;
  }
 
  //direction
  if( s.x < fX )
  {
    if( s.y > fY )
    {
      rise =  -abs(rise);
      run = abs(run);
    }
    else
    {
      rise = abs(rise);
      run = abs(run);
    }
  }
  else if(s.x > fX)
  {
    if(s.y > fY)
    {
       rise = -abs(rise);
       run = -abs(run);
    }
    else
    {
      rise = abs(rise);
      run = -abs(run);
    }
  }
 
  s.xSpeed = run*2;
  s.ySpeed = rise*2;
}

/////////////////////////////////////////
void checkCollisions()
{
  for( int i = 0; i < spines.size(); i++ )
  {
    //spines hit fisherton
    if( !spines.get(i).pShot && dist( spines.get(i).x, spines.get(i).y, fish.x, fish.y ) < 40 )
    {
      spines.remove(i);
      gameHUD.health--;
    }
    
    //bubbles hit pufferfish or boss
    else if( spines.get(i).pShot )
    {
      //boss
      if( spines.get(i).pShot && boss.active && spines.get(i).x > 750 && ( ( spines.get(i).y < 170 && spines.get(i).y > 130 ) || ( spines.get(i).y < 360 && spines.get(i).y > 320 ) ) ) 
      {
        boss = new Boss_Monster();
        gameHUD.bossMeter = 10;
      }
      
      //pufferfish
      for( int j = 0; j < pufferfish.size(); j++ )
      {
        if( dist( spines.get(i).x, spines.get(i).y, pufferfish.get(j).x, pufferfish.get(j).y ) < 40*pufferfish.get(j).scale )
        {
          pufferfish.get(j).active=false;
          spines.get(i).active=false;
          break;
        }
      }
    }
    
    //bubbles hit boss

    
  }
}
 
 
  
 
  
  
