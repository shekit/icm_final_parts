class SphereConstraintBall {
   
  ArrayList<Particle> particles;
  SphereConstraint outerSphere;
  SphereConstraint innerSphere;
  float innerConstraint;
  float outerConstraint;
  boolean in_out = true;
  
  SphereConstraintBall(Vec3D center, float _innerConstraint, float _outerConstraint, float numParticles) {
     innerConstraint = _innerConstraint;
     outerConstraint = _outerConstraint;
     
     innerSphere = new SphereConstraint(center, innerConstraint, !in_out);
     outerSphere = new SphereConstraint(center, outerConstraint, in_out);
     
     
     particles = new ArrayList<Particle>();
     
     for(int i=0; i<numParticles; i++){
        Vec3D position = Vec3D.randomVector();
        position.scaleSelf((innerConstraint + outerConstraint)/2);
        Particle p = new Particle(position);
        particles.add(p);
     }
     
    
  }
  
  void display() {
     for(Particle p: particles){
        p.display();
        innerSphere.apply(p);
        outerSphere.apply(p);
     }
     
     for(int i=0; i <particles.size()-1; i++) {
       Particle pi = particles.get(i);
       for(int j=i+1;j<particles.size();j++){
         Particle pn = particles.get(j);
         
         float d = pi.distanceTo(pn);
         float strokeWeightVar = map(d, 0, outerDiameter+2, 0,1);
         if(d>75) {
           stroke(255,10);
           strokeWeight(0.2);
         } else if(d>50 && d <= 75) {
           stroke(255,90);
            strokeWeight(0.6); 
         } else if(d>25 && d<=50) {
           stroke(255,150);
            strokeWeight(1); 
         }
          //stroke(255);
          line(pi.x,pi.y,pi.z,pn.x,pn.y,pn.z);
       }
    }
    
    for(Particle p : particles){
       if(p.z >= 0 && p.z < 50){
          p.addForce(new Vec3D(0,0,0.02)); 
       } else {
          p.addForce(new Vec3D(0,0,-0.03)); 
       }
       
       // just put to test the distance from the center
       if(p.distanceTo(worldCenter) < 143) {
         p.changeColor(color(255,0,0));
       }
    }
  }
  
  void applyConstraint(){
    for(Particle p: particles){
        //p.display();
        innerSphere.apply(p);
        outerSphere.apply(p);
     }
  }
  
  void applyForce(Vec3D f){
     for(Particle p : particles) {
        p.addForce(f); 
     }
  }
  
}
