class PathParticle extends VerletParticle {
  
  color c = color(255,0,0);
  
  PathParticle(Vec3D pos){
    super(pos);
  }
  
  void display(){
    pushMatrix();
      //rotateZ(radians(270));
         translate(x,y,z);
         noStroke();
         fill(c);
         ellipse(0,0,5,5);
       popMatrix();
  }
  
  void setColor(color _c){
     c = _c; 
  }
  
}
