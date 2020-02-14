  /*****************************************************************************************************************************************************************/
  
  import processing.core.PFont;  //calling font
  import java.io.*;
  import java.util.Random;
  
 /*****************************************************************************************************************************************************************/
  
  //these variable for reading text file and save date
  
  PrintWriter output;
  BufferedReader read;
  String[] profile;
  
  PImage bg;
  PFont font;
  
  Random r = new Random();



/*****************************************************************************************************************************************************************/  
 
  public void settings(){
    
    
         
    size(1600, 900);
    
    side_margin = width/2 - 60;
    
    height_margin = height/2;
  }  //close settings()
  
/*****************************************************************************************************************************************************************/
  
  public void setup(){
        
    frameRate(30);
    
    colorMode(HSB, 100);
    
    //read = createReader("bin/characterdata/saveddata.txt");
    
    //output = createWriter("bin/characterdata/saveddata.txt");
    
    try{
      output = createWriter("bin/characterdata/saveddata.txt");
    }catch(Exception e){
      System.out.println("SAVE FAILED");
    }
    
    try{
      profile = loadStrings("bin/characterdata/saveddata.txt");
    }catch(Exception e){
      text("LOAD FAILED", 100, 200);
    }
    
    
  }  //close setup()
  
/*****************************************************************************************************************************************************************/
  
  public void draw(){
    structureline();
    switch(room)
    {
      case 99:
        option();
        break;
    
      case 0:     
                  menu();
              
                  if(saved){
                    text("No character detected, please start new game.", 220, 150);
                  }
      
        break;  //case 1 for main menu draw
    
      
      case 1:
      
      
      jobchoicestyle();
      
      break;
      
      case 2:
      
      background(bg);
      structureline();
      move();
      isBoundary();
      fill(17, 64, 98, 75);
      //rect(0,0,500, 900);
      rect(p.charX, p.charY, 40, 45);
      break;
    
    }  //close switch for room
 
    
  }  //close draw()

  
/*****************************************************************************************************************************************************************/
  
  
  
  public void structureline()
  {
    int x,y;
    
    y=0;
    
    for (x=0;x<1600;x+=40)
    {
      line(x,y,x,y+900);
    }
    
    x=0;
    
    for (y =0;y<900;y+=45)
    {
      line (x,y,x+1600,y);
    }
    fill(255,100,100);
  }  // close structureline() for showing pixel 
