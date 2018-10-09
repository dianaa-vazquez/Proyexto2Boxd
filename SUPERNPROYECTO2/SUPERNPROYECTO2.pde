import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;
Minim gestor;
AudioPlayer musica_fondo;

Box2DProcessing box2d;

meteoros dos;
estrella una;
Supernova sn;
float orb;

ArrayList <estrella> estrellas;
ArrayList <meteoros> meteoros;


PImage supernova;
//PImage ga;




void setup(){
  size(800,600);
  gestor = new Minim (this);
  musica_fondo = gestor.loadFile("outherspace.wav");
  musica_fondo.setGain(-10);
  musica_fondo.loop();
  
  
  
  box2d = new Box2DProcessing(this);
  supernova=loadImage("supernova.png");
 // ga=loadImage("fg2.jpg");

  
  box2d.createWorld();
  box2d.setGravity(0,-9.8);
  una = new estrella(200,200,5,5);
  estrellas = new ArrayList<estrella>(600);
  meteoros = new ArrayList<meteoros>(400);
  sn= new Supernova(420,240,20,20);
  

}

void draw(){
  background(0);
  box2d.step();
  //image(ga,0,0); 
  sn.supernova();
  fill(random (255), random(255),random(255));
  textSize(40);
  text("SUPERNOVA",300,50);
  fill(255);
  textSize(20);
  text("Presiona el botón derecho del mouse para que caigan estrellas",10,510);
  text("Presiona el botón izquierdo del mouse para que caigan meteoros",10,530);
  text("Pasa el mouse en medio de la supernova para que caigan estrellas",10,550); 
  
  una.display();
  if(mouseButton==RIGHT){
    
    
    estrellas.add(new estrella(mouseX,mouseY,5,5));
  }
  
  for (estrella e:estrellas){
    e.display();
  }
  una.display();

 
  if(mouseButton==LEFT){
    
    
    meteoros.add(new meteoros(mouseX,mouseY,5,5));
  }
  
  for (meteoros r:meteoros){
    r.display();
  }
  

}

 
