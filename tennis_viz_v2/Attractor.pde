class Attractor extends VerletParticle {
    
  Attractor(Vec3D pos){
    super(pos);
    this.lock();
    physics.addParticle(this);
  }
  
  void display() {
     noFill();
     pushMatrix();
     translate(x,y,z);
     stroke(0,150,0);
     ellipse(0,0,5,5);
     popMatrix();
  }
    
}
