class Maze {
  Node start; 
  Node up;
  Node left;
  Maze() {
    String[] lines = loadStrings("Map.txt");
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
          } else if (j != 31) {
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = n;
          } else {
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
          }
        } else {
          if (j == 0) {
            n = new Node(up, null, null, null, walk);
            up.setDown(n);
            up = up.right();
            left = n;
          } else if (j != 31) {
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            up = up.right();
            left = n;
          } else {
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            Node search = n.left();
            while (search.hasLeft()) {
              search = search.left();
            }
            up = search;
          }
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) != 'P' && lines[i].charAt(j) != ' ') {
          Dot d = new Dot(n);
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'P') {
          Pacman p = new Pacman(n);
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'G') {
          Ghost g = new Ghost(n, "ghost" + ((int)random(4) + 1) + ".png");
        }
      }
    }
  }
  Node start() {
    return start;
  }
}
