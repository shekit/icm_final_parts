import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

String[] lines;
ArrayList<PathParticle> vectors;

Path path;
ArrayList<Vehicle> vehicles;
int count = 0;
float angle = 0;

Vehicle car1;
Vehicle car2;

boolean debug = true;

void setup(){
size(800,800,P3D);
vectors = new ArrayList<PathParticle>();
lines  = loadStrings("seam_points_in_order.txt");
for(String s : lines) {
   s.trim();
   float[] numbers = float(s.split(","));
   //println(numbers.length);
   PathParticle p = new PathParticle(new Vec3D(numbers[0], numbers[1], numbers[2]));
   p.scaleSelf(200);
   //p.rotateY(radians(270));
   vectors.add(p);
}

newPath();

vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 200; i++) {
    newVehicle(random(width),random(height), 0);
  }
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  //rotateZ(radians(270));
  //rotateX(angle);
  //path.display();
  for (Vehicle v : vehicles) {
      // Path following and separation are worked on in this function
      v.applyBehaviors(vehicles,path);
      // Call the generic run method (update, borders, display, etc.)
      v.run();
    }
  
    // for(PathParticle p : vectors) {
    //    p.display();
    // }
//angle+=0.01;
}

void newPath() {
   path = new Path();
   for(PathParticle v : vectors) {
     path.addPoint(v);
   }
}

void newVehicle(float x, float y, float z) {
  float maxspeed = random(2,4);
  float maxforce = 0.3;
  vehicles.add(new Vehicle(new Vec3D(x,y,z),maxspeed,maxforce));
}
