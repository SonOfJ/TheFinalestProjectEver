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
