import toxi.physics.constraints.SphereConstraint;
import toxi.physics.*;
import toxi.geom.*;
import toxi.physics.behaviors.*;


//Physics Variables
VerletPhysics physics;
Vec3D worldCenter = new Vec3D(0,0,0);

//Core Cluster
CoreCluster coreCluster;
float coreStrength = 0.001;
float coreDiameter = 100;
float coreNumParticles = 30;

//SphereConstraintBall
SphereConstraintBall outerSphere;
float outerNumParticles = 3000;
float outerDiameter = 140;
boolean constraint = true;

float angle = 0;




void setup() {
   size(displayWidth, displayHeight, P3D);

   
   physics = new VerletPhysics(); 
   
   coreCluster = new CoreCluster(worldCenter, coreDiameter, coreStrength, coreNumParticles);
   
   outerSphere = new SphereConstraintBall(worldCenter, outerDiameter, outerDiameter + 2, outerNumParticles);



}

void draw() {
   background(0);
   physics.update();
   lights();
   
   
   translate(width/2, height/2, 0);
   rotateY(angle);
   
   coreCluster.display();
   if(constraint) {
      outerSphere.applyConstraint(); 
   }
   
   outerSphere.display();
   
   angle += 0.02;
   
   if(mousePressed) {
      //coreCluster.applyForce(new Vec3D(0,0,0.3)); 
      outerSphere.applyForce(new Vec3D(0,0,0.4));
   }

}

void keyPressed(){
  if(key == ' '){
   constraint = !constraint; 
  }
}
