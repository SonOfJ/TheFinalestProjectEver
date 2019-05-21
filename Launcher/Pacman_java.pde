public class Pacman{
  Node currentNode;
  int lives;

  public Pacman(Node newCurrent){
    currentNode = newCurrent;
    lives = 3;
  }


  public void setup(){
    img = loadImage("pacman.png");//load image into

  }

  public void draw(){
    image(img, 0, height/2, img.width/8, img.height/8);//displays image at point (0, height/2) at 1/8 of its size
    //will need to resize and reposition later
  }

  public void display(){

  }

  public void move(String direction){
    if(direction.equals("up")){
      if(currentNode.hasUp()){
        currentNode.removePacman();
        currentNode = currentNode.up();
        currentNode.addPacman();
      }
    }
    if(direction.equals("down")){
      if(currentNode.hasDown()){
        currentNode.removePacman();
        currentNode = currentNode.down();
        currentNode.addPacman();
      }
    }
    if(direction.equals("left")){
      if(currentNode.hasLeft()){
        currentNode.removePacman();
        currentNode = currentNode.left();
        currentNode.addPacman();
      }
    }
    if(direction.equals("right")){
      if(currentNode.hasRight()){
        currentNode.removePacman();
        currentNode = currentNode.right();
        currentNode.addPacman();
      }
    }
  }

  public void eat(){
    if(currentNode.hasDot()){//if there is a Dot at the node
      currentNode.removeDot();//remove the Dot
    }
  }
  void damage() {
    lives = lives - 1;
  }
  int lives() {
    return lives;
  }
}
