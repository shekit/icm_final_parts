class SpringBall {
   
  ArrayList<Particle> particles;
  ArrayList<VerletSpring> springs;
  float diameter;
  float strength;
  Attractor centerParticle;
  float repulsion = -20;
  
  SpringBall(Vec3D center, float tempDiameter, float numberOfParticles, float tempStrength) {
     
    diameter = tempDiameter;
    strength = tempStrength;
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring>();
    centerParticle = new Attractor(center);
    
    physics.addParticle(centerParticle);
    centerParticle.lock();
    physics.addBehavior(new AttractionBehavior(centerParticle, diameter-10, repulsion));
    
    
    for(int i=0;i<numberOfParticles;i++){
       Vec3D position = Vec3D.randomVector(); 
       position.scaleSelf(100);
       Particle p = new Particle(position);
       particles.add(p);
    }
     
    for(Particle p : particles) {
       physics.addParticle(p);
       VerletSpring s = new VerletSpring(centerParticle, p, diameter, strength);
       physics.addSpring(s);
       springs.add(s);
       physics.addBehavior(new AttractionBehavior(p,5,-1));
    }
  }
  
  void display() {
     for(Particle p : particles){
       p.display();
     }  
  }
  
  void displayCenterParticle() {
     centerParticle.display(); 
  }
  
  void showConnections() {
     stroke(0,150,0);
     strokeWeight(0.5);
     
     for(Particle p : particles) {
       line(centerParticle.x, centerParticle.y, centerParticle.z, p.x, p.y, p.z);
    }
    
  }
  
  void setLength(float l){
     for(VerletSpring s : springs){
         s.setRestLength(l);

     }
  }
  
  void moveOnZ(Vec3D f){
    for(Particle p : particles){
        p.addForce(f);
    }  
  }
  
  
}
