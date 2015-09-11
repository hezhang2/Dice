//Helen Zhang, Block 1, Dice
int diceTotal, monHealth=3000, remHealth=300;
boolean first = true;
void setup(){
  size(405+400,405);
  noLoop();
  noStroke();
  textAlign(CENTER,CENTER);
}
void draw(){
  first = false;
  background(#24354B);
  diceTotal=0;
  System.out.println(monHealth);
  for(int x=5; x<401; x+=50){
    for(int y = 5; y < 401; y += 50){
      Die bob = new Die(x,y);
      bob.show();
      diceTotal=diceTotal+bob.diceNum;
      System.out.println(diceTotal);
    }
  }
  monHealthBar();
  scoreCount();
  monster();
}
void mousePressed(){
  redraw();
}
void monster(){
  fill(250);
  rect(480,90,250,160,40);
  triangle(520,60,490,100,550,100);
  triangle(690,60,660,100,720,100);
  fill(20);
  textSize(50);
  if(remHealth>0){
    ellipse(520,150,20,20);
    ellipse(730-40,150,20,20);
  }else{
    text("x",520,140);
    text("x",690,140);
  }
  text(" ^",600,180);
}
void monHealthBar(){
  System.out.println(monHealth);
  remHealth=(int)(monHealth/10);
  fill(20);
  rect(455,300,300,10);
  if(remHealth>0){
    fill(250);
    rect(455,300,remHealth,10);  
  }else{
    fill(230);
    textSize(20);
    text("Y O U  W I N  :)", 600, 335);
    System.out.println("Win");

  }
}
void scoreCount(){
  fill(230);
  textSize(20);
  if(first==true){
    text("C L I C K",600,370);
  }else{
    text("R O L L : "+diceTotal,600,370);
    monHealth-=diceTotal;
  }
}
class Die {
  int diceNum, diceX, diceY;
  Die(int x, int y){
    roll();
    diceX = x;
    diceY = y;
  }
  void roll(){
    diceNum = (int)(Math.random()*6+1);
  }
  void show(){
    fill(250);
    rect(diceX,diceY,40,40,10);

    if (diceNum == 1 ){
      println(1);
    }else if (diceNum == 2){
      println(2);
    }else if (diceNum == 3){
      println(3);
    }else if (diceNum == 4){
      println(4);
    }else if (diceNum == 5){
      println(5);
    }else{
      println(6);
    }
    fill(50);
    if(diceNum==1||diceNum==3){
      ellipse(diceX+20,diceY+20,5,5);
      if(diceNum==3){
        ellipse(diceX+10,diceY+10,5,5);
        ellipse(diceX+30,diceY+30,5,5);
      }
    }else{
      ellipse(diceX+10,diceY+10,5,5);
      ellipse(diceX+30,diceY+30,5,5);
      if(diceNum==4||diceNum==5||diceNum==6){
        ellipse(diceX+30,diceY+10,5,5);
        ellipse(diceX+10,diceY+30,5,5);
        if(diceNum==5){
          ellipse(diceX+20,diceY+20,5,5);
        }else if(diceNum==6){
          ellipse(diceX+10,diceY+20,5,5);
          ellipse(diceX+30,diceY+20,5,5);
        }
      }
    }
  }
}
