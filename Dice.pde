//Helen Zhang, Block 1, Dice
int diceTotal, monHealth=3000, remHealth=300, turnNum=0;
void setup() {
  size(405+400, 405);
  noLoop();
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(20);
}
void draw() {
  background(#24354B);
  diceTotal=0;
  for (int x=5; x<401; x+=50) {
    for (int y = 5; y < 401; y += 50) {
      Die bob = new Die(x, y);
      bob.show();
      diceTotal=diceTotal+bob.diceNum;
    }
  }
  monHealthBar();
  scoreCount();
  monster();
}
void restart() {
  monHealth=3000;
  turnNum=-1;
}
void mousePressed() {
  if (turnNum>12||remHealth<0) {
    restart();
  }
  turnNum+=1;
  redraw();
}
void monster() {
  fill(250);
  rect(480, 90, 250, 160, 40);
  triangle(520, 60, 490, 100, 550, 100);
  triangle(690, 60, 660, 100, 720, 100);
  fill(50);
  textSize(50);
  if (remHealth>0||turnNum>13) {
    ellipse(520, 150, 20, 20);
    ellipse(730-40, 150, 20, 20);
  } else {
    text("x", 520, 140);
    text("x", 690, 140);
  }
  text(" ^", 600, 180);
}
void monHealthBar() {
  remHealth=(int)(monHealth/10);
  fill(50);
  rect(455, 300, 300, 10);
  if (remHealth>0) {
    fill(250);
    rect(455, 300, remHealth, 10); 
    if (turnNum==13) {
      textSize(20);
      text("Y O U  L O S E :(", 600, 335);
    }
  } else {
    fill(250);
    textSize(20);
    text("Y O U  W I N  :)", 600, 335);
  }
}
void scoreCount() {
  fill(250);
  textSize(20);
  if(turnNum==-1){
    text("T U R N : 12",600,275);
  }else{
    text("T U R N : "+turnNum, 600, 275);
  }
  text("R O L L : "+diceTotal, 600, 370);
  monHealth-=diceTotal;
}
class Die {
  int diceNum, diceX, diceY;
  Die(int x, int y) {
    roll();
    diceX = x;
    diceY = y;
  }
  void roll() {
    diceNum = (int)(Math.random()*6+1);
  }
  void show() {
    fill(250);
    rect(diceX, diceY, 40, 40, 10);
    fill(50);
    if (diceNum==1||diceNum==3) {
      ellipse(diceX+20, diceY+20, 5, 5);
      if (diceNum==3) {
        ellipse(diceX+10, diceY+10, 5, 5);
        ellipse(diceX+30, diceY+30, 5, 5);
      }
    } else {
      ellipse(diceX+10, diceY+10, 5, 5);
      ellipse(diceX+30, diceY+30, 5, 5);
      if (diceNum==4||diceNum==5||diceNum==6) {
        ellipse(diceX+30, diceY+10, 5, 5);
        ellipse(diceX+10, diceY+30, 5, 5);
        if (diceNum==5) {
          ellipse(diceX+20, diceY+20, 5, 5);
        } else if (diceNum==6) {
          ellipse(diceX+10, diceY+20, 5, 5);
          ellipse(diceX+30, diceY+20, 5, 5);
        }
      }
    }
  }
}
