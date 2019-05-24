int points = 10;

void setup(){
  size(600,600);
}

void draw(){
  clear();
  textSize(32);
  text("points " + points, 100, 100);
}

void keyPressed(){
  if(keyCode == 'A'){
    points += 1;
  }
}