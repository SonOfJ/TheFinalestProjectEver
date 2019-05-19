interface Displayable {
  void display();
}
interface Moveable {
  void move();
}
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
void setup() {
  size(1000, 800);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
}
  
