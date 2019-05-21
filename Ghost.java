public class Ghost{
  Node currentNode;
  String imageString;

  public Ghost(Node newCurrent, String imgString){
    currentNode = newCurrent;
    imageString = imgString;
  }

  public void setup(){
    img = loadImage(imageString);//load image
  }

  public void draw(){
    image(img, width/2, height/2, img.width/8, img.height/8);//displays image at point (0, height/2) at 1/8 of its size
    //will need to resize and reposition later
  }

  public void display(){

  }

  public void move(String direction){
    if(direction.equals("up")){
      if(currentNode.hasUp()){
        currentNode = currentNode.up();
      }
    }
    if(direction.equals("down")){
      if(currentNode.hasDown()){
        currentNode = currentNode.down();
      }
    }
    if(direction.equals("left")){
      if(currentNode.hasLeft()){
        currentNode = currentNode.left();
      }
    }
    if(direction.equals("right")){
      if(currentNode.hasRight()){
        currentNode = currentNode.right();
      }
    }
  }


}
