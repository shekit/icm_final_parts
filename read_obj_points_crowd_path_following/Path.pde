class Path {
   
  ArrayList<Vec3D> points;
  float radius;
  
  Path() {
     radius = 20;
     points = new ArrayList<Vec3D>();
  }
  
  void addPoint(Vec3D v){
     points.add(v); 
  }
  
  Vec3D getStart(){
     return points.get(0); 
  }
  
  Vec3D getEnd() {
     return points.get(points.size()-1); 
  }
  
  void display() {
    //pushMatrix();
    //rotateZ(radians(270));
     for(Vec3D v : points) {
        pushStyle();
        stroke(255,0,0);
        strokeWeight(3);
          point(v.x, v.y, v.z);
          
        popStyle();
     }
     stroke(0);
     strokeWeight(1);
     noFill();
     beginShape();
     for(Vec3D v : points) {
        vertex(v.x, v.y,v.z); 
     }
     endShape();
    //popMatrix();
  }
  
}
