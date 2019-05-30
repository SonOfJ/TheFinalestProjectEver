boolean startGame;

void setup(){
 size(600,600); 
 startGame = false;
}

void draw(){
  print(startGame);
  if(!startGame){
    startText();
  } else{
    clear();
  }
}

void startText(){
 textSize(50);
 fill(255,255,255);
 text("start", 100, 100);
}

void mouseClicked(){
 startGame = false; 
}


void keyPressed(){
 if(key == ' '){
   startGame = true;
 }
}