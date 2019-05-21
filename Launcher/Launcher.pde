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
  String[] lines = loadStrings("Map.txt");
  int count = 1; 
  for (int i = 0; i < lines.length; i = i + 1) {
    for (int j = 0; j < lines[i].length; j = j + 1) {
      if (lines[i].charAt(j) != ' ') {
        Node n = new Node(count, null, null, null, null);
        if (lines[i].charAt(j) == 'P') {
          Pacman p = new Pacman(n, 3);
        } else {
          Dot d = new Dot(n, true);
        }
        if (lines[i].charAt(j) == 'G') {
          Ghost g = new Ghost(n, "ghost" + (int)random(5) + ".png");
        }
      }
      count = count + 1;
    }
  }
  for (int i = 0; i < lines.length; i = i + 1) {
    for (int j = 0; j < lines[i].length; j = j + 1) {
      if (lines[i].charAt(j) != ' ') {
        if (j != 0) {
          n.set
}
  
