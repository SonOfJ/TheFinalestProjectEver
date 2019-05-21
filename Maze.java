import java.util.*;
import java.io.*;
class Maze {
  Node start;

  Maze(Node newUp, Node newDown, Node newLeft, Node newRight) {
    upNode = newUp;
    downNode = newDown;
    leftNode = newLeft;
    rightNode = newRight;
  }

  display() {
  }

  addNode(Node newNode, String direction) {
    if(direction.equals("up")){
      upNode = newNode;
    }
    if(direction.equals("down")){
      downNode = newNode;
    }
    if(direction.equals("left")){
      leftNode = newNode;
    }
    if(direction.equals("right")){
      rightNode = newNode;
    }

  }
}
