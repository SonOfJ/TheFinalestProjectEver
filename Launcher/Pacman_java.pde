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
      currentNode.up().addPacman();
      currentNode.removePacman();
      currentNode = currentNode.up();
    }
    if(direction.equals("DOWN")){
      currentNode.down().addPacman();
      currentNode.removePacman();
      currentNode = currentNode.down();
    }
    if(direction.equals("LEFT")){
      currentNode.left().addPacman();
      currentNode.removePacman();
      currentNode = currentNode.left();
    }
    if(direction.equals("RIGHT")){
      currentNode.right().addPacman();
      currentNode.removePacman();
      currentNode = currentNode.right();
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
  void setDir(String dir) {
    direction = dir;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void setX(int newX) {
    x = newX;
  }
  void setY(int newY) {
    y = newY;
  }
  Node getNode() {
    return currentNode;
  }
}
