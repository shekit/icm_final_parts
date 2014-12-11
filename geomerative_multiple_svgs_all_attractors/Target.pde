class Target extends VerletParticle {
  
  Target(Vec3D pos) {
     super(pos); 
     physics.addParticle(this);
     this.lock();
  }
  
  void display() {
    noFill();
    stroke(0,150,0);
    ellipse(x,y,5,5);
  }
  
}
