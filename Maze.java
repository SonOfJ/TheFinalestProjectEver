import java.util.*;
import java.io.*;
class Maze {
  Node up;
  Node left;
  Maze() throws FileNotFoundException {
    File text = new File("Map.txt");
    Scanner inf = new Scanner(text);
    int height = 0;
    while (inf.hasNextLine()) {
      String line = inf.nextLine();
      height = height + 1;
    }
    inf = new Scanner("Map.txt");
    for (int i = 0; i < height; i = i + 1) {
      String line = inf.nextLine();
      for (int j = 0; j < line.length(); j = j + 1) {
        if (line.charAt(j) != ' ') {
          boolean walk = true;
        } else {
          boolean walk = false;
        }
        if (i == 0) {
          if (j == 0) {
            Node n = new Node(null, null, null, null, walk);
            up = n;
            left = n;
          } else {
            Node n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = n;
          }
        } else {
          if (j == 0) {
            Node n = new Node(up, null, null, null, walk);
            up.setDown(n);
            up = up.right();
            left = n;
          } else {
            Node n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            up = up.right();
            left = n;
          }
        }
      }
    }
