import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

String[] lines;
ArrayList<PathParticle> vectors;
Path path;
int count = 0;
float angle = 0;

Vehicle car1;
Vehicle car2;

boolean debug = true;

void setup() {
  size(800, 800, P3D);
  vectors = new ArrayList<PathParticle>();
  lines  = loadStrings("seam_points_in_order.txt");
  for (String s : lines) {
    s.trim();
    float[] numbers = float(s.split(","));
    //println(numbers.length);
    PathParticle p = new PathParticle(new Vec3D(numbers[0], numbers[1], numbers[2]));
    //print(p.x);
    p.rotateZ(radians(270));
    //println("," + p.x);
    p.scaleSelf(140);
    vectors.add(p);
  }

  newPath();

  car1 = new Vehicle(new Vec3D(0, 0, 0), 5, 0.3);
  car2 = new Vehicle(new Vec3D(0, 0, 0), 5, 0.3);
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  //rotateZ(radians(270));
  rotateX(angle);
  rotateY(angle*0.3);
  path.display();
  car1.follow(path);
  car2.follow(path);

  car1.run();
  car2.run();

  // for(PathParticle p : vectors) {
  //    p.display();
  // }
  angle+=0.01;
}

void newPath() {
  path = new Path();
  for (PathParticle v : vectors) {
    path.addPoint(v);
  }
}
