class Attractor extends VerletParticle {
   
  Attractor(Vec3D pos) {
    super(pos);
  }
  
  void display() {
     pushMatrix();
     translate(x,y,z);
     fill(255,0,0); 
     ellipse(0,0,15,15);
     popMatrix();
  }
}
