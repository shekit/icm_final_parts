import toxi.physics.constraints.SphereConstraint;
import toxi.physics2d.constraints.CircularConstraint;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

Particle p1;
Particle p2;
Particle p3;
Particle p4;
Line l;
Line l1;

void setup(){
    size(800,600);
    
    p1 = new Particle(new Vec2D(0,0));
    p2 = new Particle(new Vec2D(100,100));
    l = new Line(p1,p2);
    
    p3 = new Particle(new Vec2D(150,150));
    p4 = new Particle(new Vec2D(300,400));
    l1 = new Line(p3,p4);
    
}

void draw() {
   background(0); 
  
  p1.display();
  p2.display();
  
  l.display();
  
  p3.display();
  p4.display();
  
  l1.display();
}
