import java.util.*;
import java.io.*;
class Maze {
  Node start; 
  Node up;
  Node left;
  Maze() {
    String[] lines = loadStrings("Map.txt");
    for (int i = 0; i < lines.length; i = i + 1) {
      for (int j = 0; j < lines[i].length(); j = j + 1) {
        if (lines[i].charAt(j) != ' ') {
          boolean walk = true;
        } else {
          boolean walk = false;
        }
        if (i == 0) {
          if (j == 0) {
            Node n = new Node(null, null, null, null, walk);
            start = n;
            up = n;
            left = n;
          } else if (j != lines[i].length() - 1) {
            Node n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = n;
          } else {
            Node n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = null;
          }
        } else {
          if (j == 0) {
            Node n = new Node(up, null, null, null, walk);
            up.setDown(n);
            up = up.right();
            left = n;
          } else if (j != lines[i].length() - 1) {
            Node n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            up = up.right();
            left = n;
          } else {
            Node n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            Node search = n.left();
            while (search.hasLeft()) {
              search = search.left();
            }
            up = search;
            left = null;
          }
        }
        if (lines[i].charAt(j) != 'P' && lines[i].charAt(j) != ' ') {
          Dot d = new Dot(n);
        }
        if (lines[i].charAt(j) == 'P') {
          Pacman p = new Pacman(n);
        }
        if (lines[i].charAt(j) == 'G') {
          Ghost g = new Ghost(n, "ghost" + ((int)Math.random(4) + 1) + ".png");
        }
      }
    }
  }
  Node start() {
    return start;
  }
}
