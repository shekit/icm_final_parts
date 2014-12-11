class Particle extends VerletParticle {
  
  float maxspeed = 5;
  float maxforce = 0.1;
  Vec3D target;
  
  Particle(Vec3D pos, Vec3D _target) {
     super(pos);
     target = _target;
     physics.addParticle(this);
  }
  
  void display() {
     
     pushMatrix();
       translate(x,y,z);
       pushStyle();
       stroke(255);
       strokeWeight(1.5);
       
       point(0,0);
       popStyle();
     popMatrix();
    
  }
  
  void setTarget(Vec3D v) {
     target = v; 
  }
  
  void arrive() {
     Vec3D desired = target.sub(this); 
     float d = desired.magnitude();
     
     if(d<100) {
       float m = map(d, 0 ,100,0,maxspeed);
       desired.normalizeTo(m);
     } else {
        desired.normalizeTo(maxspeed); 
     }
     
     Vec3D steer = desired.sub(this.getVelocity());
     steer.limit(maxforce);
     addForce(steer);
  }
  
  
}
