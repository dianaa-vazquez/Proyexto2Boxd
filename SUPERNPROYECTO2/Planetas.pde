class Supernova{
  float x,y,w,h;
  Body b;
  
  Supernova(float x_, float y_, float w_, float h_){
    x= x_;
    y =y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    Vec2 posicionTransformada = box2d.coordPixelsToWorld(x,y);
    bd.position.set(posicionTransformada);
    b = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW,box2dH);
    
    b.createFixture(sd,1);
    
    
    
  }
  
  void display(){
    noStroke();
    Vec2 pos = box2d.getBodyPixelCoord(b);  
    ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    fill(255,0,0);
    imageMode(CENTER);
    image(supernova,0,0);
    popMatrix();
  } 
  
  
  
  void supernova(){
   imageMode(CENTER);
    supernova.resize(180,180);
    image(supernova,400,200);
    
    if( (mouseX> x -5) && (mouseX< x +5) && (mouseY> y -5) && (mouseY< y +5)){
           estrellas.add(new estrella(mouseX,mouseY,5,5));
    }
  }
}
