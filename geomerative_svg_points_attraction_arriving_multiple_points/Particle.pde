class Particle extends VerletParticle2D {
  
  
  
  Particle(Vec2D pos) {
      super(pos);
      
  } 
  
  void display() {
     noFill();
     stroke(0,150,0);
     ellipse(x,y,5,5);
  }
  
  void addAttraction() {
      physics.addBehavior(new AttractionBehavior(this, width, 0.5));
  }
 
}
