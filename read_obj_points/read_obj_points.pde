import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

String[] lines;
ArrayList<Vec3D> vectors;

void setup(){
size(800,600,P3D);
vectors = new ArrayList<Vec3D>();
lines  = loadStrings("seam_points.txt");
for(String s : lines) {
   s.trim();
   float[] numbers = float(s.split(","));
   //println(numbers.length);
   Vec3D v = new Vec3D(numbers[0], numbers[1], numbers[2]);
   v.scaleSelf(140);
   vectors.add(v);
}

}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
for(Vec3D v : vectors) {
   pushMatrix();
   rotateZ(radians(270));
     translate(v.x,v.y,v.z);
     noStroke();
     fill(255,0,0);
     ellipse(0,0,5,5);
   popMatrix();
}
}
