class Ghost implements Displayable, Moveable {
  PImage img;//image displayed
  Node currentNode;//Node the Ghost is on
  int x;//x cor
  int y;//y cor
  Ghost(Node newCurrent, int newX, int newY) {
    img = loadImage("ghost" + ((int)random(3) + 1) + ".png");//randomly choose ghost image
    currentNode = newCurrent;//initalize value
    x = newX;//initialize value
    y = newY;//initialize value
  }
  void display() {
    image(img, x, y, 50, 50);
  }
  void move() {
    if (frameCount % 10 == 0) {
      ArrayList<Character> dir = new ArrayList<Character>();
      if (currentNode.hasUp() && currentNode.up.canWalk()) {
        dir.add('u');
      }
      if (currentNode.hasDown() && currentNode.down.canWalk()) {
        dir.add('d');
      }
      if (currentNode.hasLeft() && currentNode.left.canWalk()) {
        dir.add('l');
      }
      if (currentNode.hasRight() && currentNode.right.canWalk()) {
        dir.add('r');
      }
      char chosen = dir.get((int)random(dir.size())); 
      currentNode.removeGhost();
      if (chosen == 'u') {
        y = y - 50;
        currentNode.up.addGhost();
        currentNode = currentNode.up;
      }
      if (chosen == 'd') {
        y = y + 50;
        currentNode.down.addGhost();
        currentNode = currentNode.down;
      }
      if (chosen == 'l') {
        x = x - 50;
        currentNode.left.addGhost();
        currentNode = currentNode.left;
      }
      if (chosen == 'r') {
        x = x + 50;
        currentNode.right.addGhost();
        currentNode = currentNode.right;
      }
    }
  }
}
