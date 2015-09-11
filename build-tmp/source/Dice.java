import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Dice extends PApplet {

//Helen Zhang, Block 1, Lightning
int diceTotal, monHealth=10000, remHealth=300;
boolean first = true;
public void setup(){
	size(405+400,405);
	noLoop();
	noStroke();
}
public void draw(){
	first = false;
	background(0xff24354B);
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
}
public void mousePressed(){
	redraw();
}
public void monHealthBar(){
	System.out.println(monHealth);
	//remHealth=(int)(monHealth/333);
	fill(100,0,0);
	rect(455,300,300,10);
	fill(0,100,0);
	rect(455,300,remHealth,10);
}
public void scoreCount(){
	fill(20);
	textAlign(CENTER,CENTER);
	textSize(20);
	if(first==true){
		text("C L I C K",600,370);
	}else{
		text("T O T A L : "+diceTotal,600,370);
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
	public void roll(){
		diceNum = (int)(Math.random()*6+1);
	}
	public void show(){
		fill(255);
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
		fill(0);
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Dice" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
