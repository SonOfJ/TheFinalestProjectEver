int points = 10;

void setup(){
  size(600,600);
  background(0,0,0);
}

void draw(){
  textSize(32);
  fill(0,0,0);
  rect(100,100, 100, 100);
  fill(255,255,255);
  text(points, 150, 150);
  text("points", 100, 100);
}

void keyPressed(){
  if(keyCode == 'A'){
    points += 1;
  }
}