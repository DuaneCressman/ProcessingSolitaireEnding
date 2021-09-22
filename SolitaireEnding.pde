

//called before the first frame
void settings() {
    fullScreen();
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
