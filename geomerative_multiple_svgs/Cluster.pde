class Cluster {
  
  ArrayList<Particle> particles;
  
  Cluster(int numParticles, float diameter){
    
    particles = new ArrayList<Particle>();
    
    for(int i=0;i<numParticles;i++){
       Vec3D v = Vec3D.randomVector();
       v.scaleSelf(diameter);
       Particle p = new Particle(v, v); 
       particles.add(p);
    }
  }
  
  void setTarget(ArrayList<Target> targets){
     for(Particle p: particles){
         int randomNumber = int(random(targets.size()));
         Target t = targets.get(randomNumber);
         p.setTarget(t);
     }
  }
  
  void arrive() {
     for(Particle p: particles) {
        p.arrive(); 
     }
  }
  
  void display(){
      
     for(Particle p : particles){
        p.display(); 
     }
     
     // for(int i =0;i<particles.size()-1;i++){
     //    Particle p1 = particles.get(i);
     //    for(int j=i+1;j<particles.size();j++){
     //       Particle p2 = particles.get(j);
     //       float dist = p1.distanceTo(p2);
     //       if(dist < 10) {
     //         stroke(255,50);
     //         strokeWeight(0.5);
     //         line(p1.x,p1.y,p1.z, p2.x,p2.y,p2.z);
     //       } 
           
     //    }
     // }
  }
    
}
