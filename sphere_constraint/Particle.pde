class Particle extends VerletParticle {
    
  Particle(Vec3D pos) {
    super(pos);
  }  
  
  void display() {
     pushMatrix();
     translate(x,y,z);
     noStroke();
     fill(0);
     ellipse(0,0,4,4);
     popMatrix();
  }
  
}
