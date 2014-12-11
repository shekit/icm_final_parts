class ParticleSystem {
   
  ArrayList<Particle> particles;
  
  ParticleSystem(int numParticles) {
     particles = new ArrayList<Particle>();
     
     for(int i=0;i<numParticles;i++) {
        Vec3D v = Vec3D.randomVector();
        v.scaleSelf(width+10);
        Particle p = new Particle(v,v); 
        particles.add(p);
     }
  }
  
  void setTarget(ArrayList<Target> targets) {
      for(Particle p: particles) {
         int randomNumber = int(random(targets.size()));
         Target t = targets.get(randomNumber);
         p.setTarget(t);
      }
  }
  
  void arrive() {
     for(Particle p : particles) {
         p.arrive();
     }
  }
  
  void display() {
     for(Particle p : particles){
        p.display(); 
     }
  }
}
