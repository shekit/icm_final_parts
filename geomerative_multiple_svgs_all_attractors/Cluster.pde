class Cluster {
  
  ArrayList<Target> particles;
  
  Cluster(int numParticles, float diameter){
    
    particles = new ArrayList<Target>();
    
    for(int i=0;i<numParticles;i++){
       Vec3D v = Vec3D.randomVector();
       v.scaleSelf(diameter);
       Target t = new Target(v); 
       particles.add(t);
    }
  }
  
  void display(){
      
     for(Target t : particles){
        t.display(); 
     }
     
  }
    
}
