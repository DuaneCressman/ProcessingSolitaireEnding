//A card the will bounce along the screen
public class Card extends Updateable
{
  //If the card can make it to the end of the screen, it will fall through the floor instead of bouncing along the bottom.
  public boolean FALL_THROUGH_FLOOR = true;
  
  float MAX_STARTING_FALLING_SPEED = -10;
  float MIN_BOUNCE_FRICTION = 2.5;
  float MAX_BOUNCE_FRICTION = 5.5;
  float MIN_X_SPEED = 2.5;
  float MAX_X_SPEED = 7.5;
  float MIN_COLOUR = 25;
  float MAX_COLOUR = 255;

  float GRAVITY = 0.5;
  
  int xSize = 50;
  int ySize = 50;
  
  //How fast the card is falling
  //positive values means card is going down, negitive values mean the card is going up
  float fallingSpeed;
  
  //how much momentum in the y axis the card looses each bounce
  float bounceFriction;
  
  //position of the card
  int xPos;
  int yPos;
  
  //how fast the card moves in the x axis
  float xSpeed; 
  
  //colour of the card
  color colour;
  
  //if the card has completed its last bounce and should fall through the floor.
  boolean fallThroughFloor;
  
  //constructor
  public Card(int x, int y, boolean right){
    
    //place the center of the card at the mouse point
    xPos = x - xSize / 2;
    yPos = y - ySize / 2;
    
    //randomize values //<>//
    fallingSpeed = MAX_STARTING_FALLING_SPEED +  random(-MAX_STARTING_FALLING_SPEED);
    bounceFriction = MIN_BOUNCE_FRICTION + random(MAX_BOUNCE_FRICTION - MIN_BOUNCE_FRICTION);
    xSpeed = MIN_X_SPEED + random(MAX_X_SPEED - MIN_X_SPEED);
    colour = color(MIN_COLOUR + random(MAX_COLOUR - MIN_COLOUR), MIN_COLOUR + random(MAX_COLOUR - MIN_COLOUR), MIN_COLOUR + random(MAX_COLOUR - MIN_COLOUR));
    
    //flip the direction the card will travel passed on the parameters
    if(!right)
    {
      xSpeed *= -1;
    }
  }
  
  //called once per frame
  public void Update(){ 
    
    //draw the card
    fill(colour);
    rect(xPos, yPos, xSize, ySize);
    
    //move the card
    xPos += xSpeed;
    yPos += fallingSpeed;
    
    //adjust how fast the card is falling
    fallingSpeed += GRAVITY;
    
    //if the card is at the bottom of the screen
    if(!fallThroughFloor && yPos >= SCREEN_SIZE_Y - ySize)
    {
      //make sure the card doesn't go under the bottom of the screen
      yPos = SCREEN_SIZE_Y - ySize;
     
      //slow down and flip the falling speed
      fallingSpeed -= bounceFriction;
      fallingSpeed *= -1;      
      
      //if falling speed is so low that it wont be able to do another full bounce //<>//
      if(fallingSpeed * -1 < bounceFriction)
      {
        if(FALL_THROUGH_FLOOR)
        {
          //allow the card to fall through the floor on the next bounce
          fallThroughFloor = true;
        }
      }
    }
    
    //destory the card if it is out of bounds
    if(xPos > SCREEN_SIZE_X || xPos < 0 - xSize || yPos > SCREEN_SIZE_Y)
    {
      Destroy();
    }
  }
}
  
