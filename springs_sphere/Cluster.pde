class Cluster {
   ArrayList<Particle> particles;
   ArrayList<VerletSpring> springs;
   float diameter;
   int count = 0;
   
   Cluster(Vec3D center, float d, float num) {
       diameter = d;
       particles = new ArrayList<Particle>();
       springs = new ArrayList<VerletSpring>();
       
       for(int i=0;i<num;i++){
          particles.add(new Particle(center.add(Vec3D.randomVector()))); 
       }
       
       for(int i=0;i<particles.size() - 1;i++){
          VerletParticle ni = particles.get(i);
          for(int j = i+1; j<particles.size(); j++){
             VerletParticle nj = particles.get(j);
             VerletSpring s = new VerletSpring(ni,nj,diameter,strength);
             physics.addSpring(s);
             springs.add(s);
          }
       }
   }
   
   void setLength(float l) {
       for(int i =0;i<springs.size(); i+=5) {
          springs.get(i).setRestLength(l);
       }
     
   }
   
   void setStrength(float s){
      for(int i=0;i<springs.size();i+=10){
         springs.get(i).setStrength(s); 
      }
   }
   
   void display() {
      for(Particle p: particles){
         p.display(); 
      }
   }
   
   void showConnections() {
      stroke(255,255,255);
      //strokeWeight(0.5);
      for(int i=0;i<particles.size() - 1;i++){
         VerletParticle pi = particles.get(i);
         for(int j=i+1;j<particles.size();j++){
            VerletParticle pj = particles.get(j);
            if(pi.distanceTo(pj) < 50){
              println(pi.distanceTo(pj));
              count++;
              if(count == 0) {
                 strokeWeight(3);
              } else if (count == 1)  {
                 strokeWeight(2); 
              } else if (count == 2) {
                 strokeWeight(1); 
              } else if (count == 3) {
                 strokeWeight(0.5); 
              }
              
              if(count > 3 ){
                 count = 0; 
              }
              
              line(pi.x,pi.y,pi.z, pj.x,pj.y,pj.z);
            }
         }
        
        
      }
     
   }
   
   void applyForce(Vec3D v) {
     for(Particle p: particles) {
        p.addForce(v); 
     }
   }
  
}
