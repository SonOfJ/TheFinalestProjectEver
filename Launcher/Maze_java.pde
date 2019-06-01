class Maze {
  Node start; //Need a starting point to begin displaying.
  Node up; //Check the nodes before.
  Node left; //Check the nodes before.
  Maze() {
    String[] lines = loadStrings("Map.txt");
    float x = 0;   
    float y = 0;
    for (int i = 0; i < 18; i = i + 1) {
      for (int j = 0; j < 32; j = j + 1) {
        boolean walk; //Change according to whether or not the node is walkable.
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) != ' ') { //As long as there is a letter...
          walk = true; //The node is walkable.
        } else { //If not...
          walk = false; //It isn't.
        }
        Node n;
        if (i == 0) { //First row.
          if (j == 0) { //First column
            n = new Node(null, null, null, null, walk);
            start = n;
            up = n;
            left = n;
            x = x + 37.5;
          } else if (j != 31) { //Every column other than the first and last.
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
            left = n;
            n.setX(x);
            x = x + 37.5;
          } else { //The last column.
            n = new Node(null, null, left, null, walk);
            left.setRight(n);
            n.setX(x);
            x = 0;
            y = y + 37.5;
          }
        } else { //The rest of the rows.
          if (j == 0) { //First column.
            n = new Node(up, null, null, null, walk);
            up.setDown(n);
            up = up.right;
            left = n;
            n.setY(y);
            x = x + 37.5;
          } else if (j != 31) { //Every column other than the first and last. 
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            up = up.right;
            left = n;
            n.setX(x);
            n.setY(y);
            x = x + 37.5;
          } else { //The last column.
            n = new Node(up, null, left, null, walk);
            up.setDown(n);
            left.setRight(n);
            n.setX(x);
            n.setY(y);
            x = 0;
            y = y + 37.5;
            Node search = n.left; //Goes back to the first column when a whole row is made.
            while (search.hasLeft()) {
              search = search.left;
            }
            up = search;
          }
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) != 'P' && lines[i].charAt(j) != ' ') { //If there isn't a Pac-Man and the node is walkable...
          n.makeDot(n.x + 18.75, n.y + 18.75); //There should be a dot.
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'P') { //If there is a Pac-Man...
          n.removeDot(); //There shouldn't be a dot.
          n.addPacman(); //There should be a Pac-Man.
        }
        if (lines.length > i && lines[i].length() > j && lines[i].charAt(j) == 'G') { //If there is a ghost...
          n.addGhost(); //There should be a ghost.
        }
      }
    }
  }
}
