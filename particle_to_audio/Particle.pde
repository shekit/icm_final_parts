class Particle extends VerletParticle {
  
  Vec3D position;
  
  Particle(Vec3D pos) {
    super(pos);
    //position = pos.copy();
  }  
  
  void display() {
     pushMatrix();
     translate(x,y,z);
     //rotateY(-angle);
     //stroke(255,255,0);
     fill(255,255,0);
     ellipse(0,0,10,10);
     popMatrix();
  }
  
}
