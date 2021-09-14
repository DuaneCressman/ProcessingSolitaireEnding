  

public int SCREEN_SIZE_X = 1500;
public int SCREEN_SIZE_Y = 750;

//called before the first frame
void settings() {
  size(SCREEN_SIZE_X, SCREEN_SIZE_Y);
}

//called once every frame
void draw(){
  if(mousePressed)
  {
    if (mouseButton == LEFT){
      new Card(mouseX, mouseY, false);
    }
    else if(mouseButton == RIGHT){
      new Card(mouseX, mouseY, true);
    }
  }
  
   Updater.Draw();
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == DOWN){
      
      //clear all the cards
      Updater.Reset();
      
      //clear the back ground
      background(200, 200, 200);
    }
  }
}
