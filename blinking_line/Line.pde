class Line {
   
  Particle p;
  Particle p1;
  int count = int(random(0,20));
  
  Line(Particle _p, Particle _p1){
    p = _p;
    p1 = _p1;
  }
  
  void display(){
    stroke(255);
    pushMatrix();
    if(count >= 0 && count < 5){
      strokeWeight(3);
    } else if(count >= 5 && count < 10){
       strokeWeight(2); 
    } else if(count >= 10 && count <= 15) {
       strokeWeight(1); 
    } else if(count>15 && count <= 20){
       strokeWeight(0); 
    }
    
    line(p.x, p.y, p1.x, p1.y);
    popMatrix();
    count++;
    
    if(count > 20) {
       count = 0; 
    }
  }
  
}
