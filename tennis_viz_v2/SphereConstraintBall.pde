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
