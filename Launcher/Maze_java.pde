class Maze {
  Node start; 
  Node up;
  Node left;
  Maze() {
    String[] lines = loadStrings("Map.txt");
    int x = 0;   
    int y = 0;
    for (int i = 0; i < 18; i = i + 1) {
      for (int j = 0; j < 32; j = j + 1) {
        boolean walk;
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) != ' ') {
          walk = true;
        } else {
          walk = false;
        }
        Node n;
        if (i == 0) {
          if (j == 0) {
            n = new Node(null, null, null, null, walk);
            start = n;
            up = n;
            left = n;
            x = x + 50;
          } else if (j != 31) {
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = n;
            n.setX(x);
            x = x + 50;
          } else {
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
            n.setX(x);
            x = 0;
            y = y + 50;
          }
        } else {
          if (j == 0) {
            n = new Node(up, null, null, null, walk);
            up.setDown(n);
            up = up.right();
            left = n;
            n.setY(y);
            x = x + 50;
          } else if (j != 31) {
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            up = up.right();
            left = n;
            n.setX(x);
            n.setY(y);
            x = x + 50;
          } else {
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            n.setX(x);
            n.setY(y);
            x = 0;
            y = y + 50;
            Node search = n.left();
            while (search.hasLeft()) {
              search = search.left();
            }
            up = search;
          }
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) != 'P' && lines[i].charAt(j) != ' ') {
          n.makeDot(n.getX() + 25, n.getY() + 25);
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'P') {
          n.removeDot();
          n.addPacman();
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'G') {
          n.addGhost();
        }
      }
    }
  }
  Node start() {
    return start;
  }
}
