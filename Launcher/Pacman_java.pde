class Pacman implements Displayable, Moveable {
  PImage img;
  Node currentNode;
  int lives;
  int x;
  int y;
  String direction;
  Pacman(Node newCurrent, int newX, int newY) {
    currentNode = newCurrent;
    lives = 3;
    direction = "RIGHT";
    x = newX;
    y = newY;
  }
  void display() {
    image(img, x, y, 50, 50); 
  }
  void move() {
    if(direction.equals("UP")){
      if(currentNode.hasUp()){
        currentNode.removePacman();
        currentNode = currentNode.up();
        //currentNode.addPacman();
      }
    }
    if(direction.equals("DOWN")){
      if(currentNode.hasDown()){
        currentNode.removePacman();
        currentNode = currentNode.down();
        //currentNode.addPacman();
      }
    }
    if(direction.equals("LEFT")){
      if(currentNode.hasLeft()){
        currentNode.removePacman();
        currentNode = currentNode.left();
        //currentNode.addPacman();
      }
    }
    if(direction.equals("RIGHT")){
      if(currentNode.hasRight()){
        currentNode.removePacman();
        currentNode = currentNode.right();
        //currentNode.addPacman();
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
