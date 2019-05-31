class Ghost implements Displayable, Moveable {
  PImage img;
  Node currentNode; //Node the Ghost is on.
  int x;
  int y;
  Ghost(Node newCurrent, int newX, int newY) {
    img = loadImage("ghost" + ((int)random(3) + 1) + ".png"); //Randomly choose ghost image.
    currentNode = newCurrent;
    x = newX;
    y = newY;
  }
  void display() {
    image(img, x, y, 50, 50);
  }
  void move() {
    if (frameCount % 10 == 0) { //Limits movement speed of ghosts.
      ArrayList<Character> dir = new ArrayList<Character>(); //This ArrayList will contain all the possible directions the ghost can move in.
      if (currentNode.hasUp() && currentNode.up.path) {
        dir.add('w');
      }
      if (currentNode.hasDown() && currentNode.down.path) {
        dir.add('s');
      }
      if (currentNode.hasLeft() && currentNode.left.path) {
        dir.add('a');
      }
      if (currentNode.hasRight() && currentNode.right.path) {
        dir.add('d');
      }
      char chosen = dir.get((int)random(dir.size())); //Randomly choose a direction out of the ArrayList of possible directions.
      currentNode.removeGhost(); //The current node should no longer have a ghost.
      if (chosen == 'w') {
        y = y - 50; //Move upwards.
        currentNode.up.addGhost(); //The node on top should have a ghost.
        currentNode = currentNode.up; //Get new node.
      }
      if (chosen == 's') {
        y = y + 50; //Move downwards.
        currentNode.down.addGhost(); //The node on bottom should have a ghost.
        currentNode = currentNode.down; //Get new node.
      }
      if (chosen == 'a') {
        x = x - 50; //Move to the left.
        currentNode.left.addGhost(); //The node on the left should have a ghost.
        currentNode = currentNode.left; //Get new node.
      }
      if (chosen == 'd') {
        x = x + 50; //Move to the right.
        currentNode.right.addGhost(); //The node on the right should have a ghost.
        currentNode = currentNode.right; //Get new node.
      }
    }
  }
}
