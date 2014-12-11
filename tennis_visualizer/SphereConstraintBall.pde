class SphereConstraintBall {
   
  ArrayList<Particle> particles;
  SphereConstraint sphere;
  float constraint;
  boolean in_out = true;
  
  SphereConstraintBall(Vec3D center, float tempConstraintDiameter, float numberOfParticles){
      
    constraint = tempConstraintDiameter;
    
    sphere = new SphereConstraint(center, constraint, in_out);
    
    particles = new ArrayList<Particle>();
    
    for(int i=0;i<numberOfParticles;i++){
       Vec3D position = Vec3D.randomVector(); 
       position.scaleSelf(constraint-10);
       Particle p = new Particle(position);
       particles.add(p);
    }
    
    for(Particle p : particles){
       physics.addParticle(p);
    }
  }
  
  void display() {
     for(Particle p : particles) {
        p.display();
        sphere.apply(p);
     }
  }
  
  void display2() {
     for(Particle p : particles) {
       p.move(); 
       p.display2();
        sphere.apply(p);
        
     }
  }
  
  void applyRotation(Vec3D f){
      for(Particle p : particles) {
         p.applyForce(f); 
      }
  }
  
}
