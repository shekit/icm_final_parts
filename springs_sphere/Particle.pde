class Particle extends VerletParticle {
  
   Particle(Vec3D pos) {
      super(pos); 
      physics.addParticle(this);
   }
   
   void display() {
      pushMatrix();
      translate(x,y,z);
      noStroke();
      fill(0);
      ellipse(0,0,2,2);
      popMatrix();
     
   }
  
}
