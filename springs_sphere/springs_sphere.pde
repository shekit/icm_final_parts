import toxi.physics.constraints.SphereConstraint;
import toxi.physics.*;
import toxi.geom.*;
import toxi.physics.behaviors.*;

VerletPhysics physics;
float strength = 0.001;
Cluster cluster;
boolean showConnections = true;
float diam = 100;
int nu = 30;
float angle;

void setup(){
   size(800,600,P3D);
   physics = new VerletPhysics();
   cluster = new Cluster(new Vec3D(0,0,0), diam, nu);  
}

void draw() {
  physics.update();
  
  background(0);
  translate(width/2, height/2,0);
  rotateY(angle);
  if(showConnections == true) {
     cluster.showConnections(); 
  }
  
  cluster.display();
  
  
  
  angle+=0.05;
}

void keyPressed() {
   if(keyCode == ' '){
      showConnections = !showConnections; 
   }
  
}

void mousePressed(){
     //cluster.applyForce(new Vec3D(0,0,0.2)); 
     //diam += 4;
     //cluster.setLength(diam);
     strength += 0.05;
     cluster.setStrength(strength);
  }
