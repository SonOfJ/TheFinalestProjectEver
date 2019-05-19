import java.util.*;
import java.io.*;
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
  try {
    File text = new File("Map");
    Scanner inf = new Scanner(text);
    int height = 0;
    int length = 0;
    while (inf.hasNextLine()) {
    String line = inf.nextLine();
    length = line.length();
    height = height + 1;
  }
  inf = new Scanner(text);
  int row = 0;
  while (inf.hasNextLine()) {
    String line = inf.nextLine();
    for (int i = 0; i < line.length(); i = i + 1) {
      
  } catch (FileNotFoundException e) {
  }

}
  
