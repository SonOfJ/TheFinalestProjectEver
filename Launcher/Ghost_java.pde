class Ghost implements Displayable, Moveable {
  PImage img;
  Node currentNode;
  int x;
  int y;
  boolean there;
  Ghost(Node newCurrent, int newX, int newY) {
    currentNode = newCurrent;
    x = newX;
    y = newY;
    there = true;
  }
  void display() {
    if (there) {
      image(img, x, y, 50, 50);
    }
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
        currentNode.up.addGhost(x, y);
        currentNode = currentNode.up;
      }
      if (chosen == 'd') {
        y = y + 50;
        currentNode.down.addGhost(x, y);
        currentNode = currentNode.down;
      }
      if (chosen == 'l') {
        x = x - 50;
        currentNode.left.addGhost(x, y);
        currentNode = currentNode.left;
      }
      if (chosen == 'r') {
        x = x + 50;
        currentNode.right.addGhost(x, y);
        currentNode = currentNode.right;
      }
    }
  }
}
