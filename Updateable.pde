//This class is used with the Updater class to give any child classes their own draw method.
public abstract class Updateable{

  public void Update(){};
  
  public Updateable()
  {  
    Updater.Add(this); //<>//
  }

  public void Destroy()
  {
    Updater.Remove(this);
  }
}
