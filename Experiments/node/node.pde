void setup(){
 size(1000,1000); 
 noLoop();
}

int xcor = 100;
int ycor = 100;
Node node1;

void link(){
  node1 = new Node();
  //node1.display();
  Node node2 = new Node();
  Node node3 = new Node();
  Node node4 = new Node();
  Node node5 = new Node();
  Node node6 = new Node();
  //Node node7 = new Node();
  node1.setRight(node2);
  node2.setRight(node3);
  node3.setDown(node4);
  node4.setDown(node5);
  node5.setDown(node6);
}

void draw(){
  /*
  Node node1 = new Node();
  //node1.display();
  Node node2 = new Node();
  Node node3 = new Node();
  Node node4 = new Node();
  Node node5 = new Node();
  Node node6 = new Node();
  //Node node7 = new Node();
  node1.setRight(node2);
  node2.setRight(node3);
  node3.setDown(node4);
  node4.setDown(node5);
  node5.setDown(node6);
  //node1.setDown(node7);
  */
  link();
  node1.display(xcor, ycor);
  //if(node1.hasRight()){
  //  node1.right().display(xcor + 200, ycor + 200);
  //}
  Node current = node1;
  while(current.hasUp() || current.hasDown() || current.hasLeft() || current.hasRight()){
    if(current.hasUp()){
      current = current.up();
      ycor -= 100;
      current.display(xcor, ycor);
      fill(255,255,0);
      current.dot.display(xcor + 50, ycor + 50);
      fill(255,255,255);
    } else if(current.hasDown()){
      current = current.down();
      ycor += 100;
      current.display(xcor, ycor);
      fill(255,255,0);
      current.dot.display(xcor + 50, ycor + 50);
      fill(255,255,255);
    } else if(current.hasRight()){
      current = current.right();
      xcor += 100;
      current.display(xcor, ycor);
      fill(255,255,0);
      current.dot.display(xcor + 50, ycor + 50);
      fill(255,255,255);
    } else if(current.hasDown()){
      current = current.down();
      xcor -= 100;
      current.display(xcor, ycor);
      fill(255,255,0);
      current.dot.display(xcor + 50, ycor + 50);
      fill(255,255,255);
    }
  }
}



class Node {
  Node up;
  Node down;
  Node left;
  Node right;
  boolean path;
  boolean hasDot;
  boolean pacmanHere;
  boolean ghostHere;
  Dot dot;
  Node(Node newUp, Node newDown, Node newLeft, Node newRight, boolean patState) {
    //data = newData;
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
    path = patState;
    if (patState) {
      hasDot = true;
    } else {
      hasDot = false;
    }
    pacmanHere = false;
    ghostHere = false;
    dot = new Dot(this);
  }
  Node(){
    dot = new Dot(this);
  }
  boolean hasDot(){
    return hasDot;
  }
  void removeDot(){
    dot = null;
    hasDot = false;
  }
  boolean hasUp() {
    return up != null;
  }
  boolean hasDown() {
    return down != null;
  }
  boolean hasLeft() {
    return left != null;
  }
  boolean hasRight() {
    return right != null;
  }
  Node up() {
    return up;
  }
  Node down() {
    return down;
  }
  Node left() {
    return left;
  }
  Node right() {
    return right;
  }
  boolean pacmanHere(){
    return pacmanHere;
  }
  void addPacman(){
    pacmanHere = true;
  }
  void removePacman(){
    pacmanHere = false;
  }
  boolean ghostHere() {
    return ghostHere;
  }
  void addGhost() {
    ghostHere = true;
  }
  void removeGhost() {
    ghostHere = false;
  }
  void setUp(Node other) {
    up = other;
  }
  void setDown(Node other) {
    down = other;
  }
  void setLeft(Node other) {
    left = other;
  }
  void setRight(Node other) {
    right = other;
  }
  boolean canWalk() {
    return path;
  }
  void display(int x, int y){
    rect(x, y, 100, 100);
  }
  
}



class Dot {
  Node currentNode;
  boolean there;
  Dot(Node newCurrent) {
    currentNode = newCurrent;
    there = true;
  }
  void eat() {
    there = false;
  }
  boolean getState() {
    return there;
  }
  void display(int x, int y) {
    //fill(255, 255, 0); //Set to yellow.
    ellipse(x, y, 10, 10);
  }
}
