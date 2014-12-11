class Particle extends VerletParticle2D {
    
  Particle(Vec2D pos){
     super(pos); 
  }
  
  void display() {
     fill(255,0,0);
     noStroke();
     ellipse(x,y,16,16);
  }
  
}
