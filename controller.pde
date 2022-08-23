import processing.serial.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import javax.swing.KeyStroke;
Serial myPort;
String KeyString = "";
void setup()
{
  System.out.println("Hi");
  size(700, 500);
  myPort = new Serial(this, "COM3", 9600); //change this to your COM port
  myPort.bufferUntil('\n');
}
void draw() {//Not really necessary
  background(0, 0, 0);
  fill(255, 0, 0);
  text("Press any key", 100, 175);
}   

void serialEvent(Serial myPort)throws Exception {
  KeyString = myPort.readStringUntil('\n');
  KeyString = KeyString.substring(0, KeyString.indexOf(':'));//The string is split. the whole string leaving the colon is taken
  System.out.println(KeyString);//prints the serial string for debugging purpose
  Robot Arduino = new Robot();
  switch(KeyString) {

    //button pressed code

  case "aButton" :
    Arduino.keyPress(KeyEvent.VK_SPACE);//presses up key.
    Arduino.keyRelease(KeyEvent.VK_SPACE);// button mapped to space to shoot
    break;
  case "bButton" :
    Arduino.keyPress(KeyEvent.VK_RIGHT);   
    Arduino.keyRelease(KeyEvent.VK_RIGHT);
    break;
  case "cButton" :
    Arduino.keyPress(KeyEvent.VK_DOWN); 
    Arduino.keyRelease(KeyEvent.VK_DOWN);
    break;
  case "dButton" :
    Arduino.keyPress(KeyEvent.VK_LEFT);
    Arduino.keyRelease(KeyEvent.VK_LEFT);
    break;
  case "Select" :
    Arduino.keyPress(KeyEvent.VK_ESCAPE);
    Arduino.keyRelease(KeyEvent.VK_ESCAPE);
    break;
  case "Start" :
    Arduino.keyPress(KeyEvent.VK_SPACE);
    Arduino.keyRelease(KeyEvent.VK_SPACE);
    break;
    //these directions make inputs on NUMPAD, not the arrow keys
    //literally no clue why


    //joystick code
  case "joyRight" :
    Arduino.keyPress(KeyEvent.VK_D);
    break;
  case "joyLeft" :
    Arduino.keyPress(KeyEvent.VK_A);   
    break;
  case "joyUp" :
    Arduino.keyPress(KeyEvent.VK_W);     
    break;
  case "joyDown" :
    Arduino.keyPress(KeyEvent.VK_S);
    break;

  case"upR" :
    Arduino.keyRelease(KeyEvent.VK_A);
    Arduino.keyRelease(KeyEvent.VK_S);
    Arduino.keyPress(KeyEvent.VK_W);
    Arduino.keyPress(KeyEvent.VK_D);
    break;

  case"upL" :
    Arduino.keyRelease(KeyEvent.VK_S);
    Arduino.keyRelease(KeyEvent.VK_D);
    Arduino.keyPress(KeyEvent.VK_W);
    Arduino.keyPress(KeyEvent.VK_A);    
    break;

  case"downR" :    
    Arduino.keyRelease(KeyEvent.VK_W);
    Arduino.keyRelease(KeyEvent.VK_A);
    Arduino.keyPress(KeyEvent.VK_S);
    Arduino.keyPress(KeyEvent.VK_D);
    break;

  case"downL" :
    Arduino.keyRelease(KeyEvent.VK_W);
    Arduino.keyRelease(KeyEvent.VK_D);
    Arduino.keyPress(KeyEvent.VK_S);
    Arduino.keyPress(KeyEvent.VK_A);
    break;


  case "joyM" :
    Arduino.keyRelease(KeyEvent.VK_S);
    Arduino.keyRelease(KeyEvent.VK_W);
    Arduino.keyRelease(KeyEvent.VK_A);
    Arduino.keyRelease(KeyEvent.VK_D);
    break;
  }
}
