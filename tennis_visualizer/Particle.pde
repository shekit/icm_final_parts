class Particle extends VerletParticle {
  
  ArrayList<Vec3D> history;
  
  Particle(Vec3D pos) {
     super(pos);
     history = new ArrayList<Vec3D>();
  }
  
  void display(){
     pushMatrix();
     translate(x,y,z);
     stroke(0);
     strokeWeight(3);
     fill(0);
     ellipse(0,0,6,6);
     popMatrix();
  }
  
  void display2() {
     pushMatrix();
       translate(x,y,z);
       noFill();
       stroke(255);
       beginShape();
       for(Vec3D v : history) {
         vertex(0,0,0);
         x += random(-1,1);
         y += random(-1,1);
       }
       endShape();
     popMatrix();
  }
  
  void move() {
     history.add(new Vec3D(x,y,z)); 
     x += random(-10,10);
     y += random(-10,10);
     
     if(history.size() > 30) {
        history.remove(0); 
     }
  }
  
  void applyForce(Vec3D f){
     this.addForce(f); 
  }
  
}
