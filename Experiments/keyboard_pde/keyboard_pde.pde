//looked at this tutorial
//https://happycoding.io/tutorials/processing/input#keyboard-input-functions

float circleX = 100;
float circleY = 100;

void setup(){
  size(600, 600);
}

void draw() {
  background(200);  
  ellipse(circleX, circleY, 100, 100);
}

void keyPressed() {
  if (keyCode == 'W') {
    circleY -= 10;
  }
  else if (keyCode == 'S') {
    circleY += 10;
  }
  else if (keyCode == 'A') {
    circleX -= 10;
  }
  else if (keyCode == 'D') {
    circleX += 10;
  }
}