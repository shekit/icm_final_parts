class Particle extends VerletParticle {
  
   Particle(Vec3D pos) {
      super(pos);
      physics.addParticle(this);
   }
   
   void display() {
      pushMatrix();
        translate(this.x,this.y,this.z);
        //noStroke();
        //fill(255,0,0);
        //ellipse(0,0,5,5);
        stroke(255);
        strokeWeight(2);
        //line(0,0,5,0);
        point(0,0);
      popMatrix();
     
   }
   
}
