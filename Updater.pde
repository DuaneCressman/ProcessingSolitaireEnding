import java.util.LinkedList;

//This class is used with the Updatable class to give any child classes of Updateable their own draw method.
public static class Updater{
  
  //all the objects
  private static LinkedList<Updateable> objects;

  //if this static class has been initialized
  private static boolean initialized;

  //inititalize the list ob obects
  private static void Initaialize(){
    initialized = true;

    objects = new LinkedList<Updateable>();
  }
  
  //make sure this static class has been initialized
  private static void CheckInitialized(){
    if(!initialized){
      Initaialize();
    }
  }

  //add a new object to the list
  public static void Add(Updateable updateable)
  {
    CheckInitialized();

    objects.add(updateable);
  }

  //remove an object from the list.
  public static void Remove(Updateable updateable)
  {
    CheckInitialized();

    objects.remove(updateable);
  }

  //This method shall be called from the main draw method.
  //This method will call the update method on each of the Updateable objects
  public static void Draw()
  {
    CheckInitialized();

    for(int i = 0; i < objects.size(); i++)
    {
      objects.get(i).Update();
    }
  }
  
  //reset the list of objects
  public static void Reset()
  {
    for(int i = objects.size() - 1; i >= 0; i--)
    {
      objects.get(i).Destroy();
    }
  }
}
