class meteoros{
  float x, y,h,w;
  Body b;

  
  meteoros(float x_,float y_,float h_,float w_){
 
    x=x_;
    y=y_;
    h=h_;
    w=w_;

    
    
     // construir una definición de cuerpo;
    BodyDef bd = new BodyDef();
    // existe tipo dinámico, tipo estático y tipo kinestético; 
    bd.type = BodyType.DYNAMIC;
    Vec2 posicionTransformada = box2d.coordPixelsToWorld(x,y);
    bd.position.set(posicionTransformada);
    
    // Construir el cuerpo
    b = box2d.createBody(bd);
    
    // Definir el polígono, o su contorno
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW,box2dH);
    
    // Definir su fixture o sus características
    FixtureDef fd = new FixtureDef();
    fd.shape =  sd;
    //parametros : densidad, fricción y rebote;
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;
    
    // agregar todo al body;
    b.createFixture(fd);
    b.setAngularVelocity(500);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    // modificar el metod display;
    noStroke();
    fill(random(255),random(255), random (255));
    ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-angulo);
    ellipse(0,0,10,10);
    popMatrix();
  }
}
