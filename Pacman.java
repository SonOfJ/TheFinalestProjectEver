public class Pacman{
  Node currentNode;
  int lives;

  public Pacman(Node newCurrent, int numLives){
    currentNode = newCurrent;
    lives = numLives;
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
    if(direction.equals("up")){//move up
      if(currentNode.hasUp()){//check if there is Node there
        currentNode = currentNode.up();//set currentNode to the new Node
      }
    }
    if(direction.equals("down")){//move down
      if(currentNode.hasDown()){//check if there is Node there
        currentNode = currentNode.down();//set currentNode to the newNode
      }
    }
    if(direction.equals("left")){//move left
      if(currentNode.hasLeft()){//check if there is Node there
        currentNode = currentNode.left();//set currentNode to the newNode
      }
    }
    if(direction.equals("right")){//move right
      if(currentNode.hasRight()){//check if there is Node there
        currentNode = currentNode.right();//set currentNode to the newNode
      }
    }
  }

  public void eat(){
    if(currentNode.hasDot()){//if there is a Dot at the node
      currentNode.removeDot();//remove the Dot
    }
  }
}
