import toxi.physics.constraints.SphereConstraint;
import toxi.physics.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics.behaviors.*;

//Physics variables
VerletPhysics physics;
AABB world;
SphereConstraint sphere;
int sphereConstraint = 120;

//particle variables
ArrayList<Particle> particles;
int numberOfParticles = 200;
Vec3D center = new Vec3D(0,0,0);

//Spring Ball
SpringBall springBall;
float diameter = 150;
float strength = 0.0005;
boolean showConnections = false;

//Sphere Constraint Ball
SphereConstraintBall sphereBall;
boolean showTrail = false;


boolean showSpringBall = false;
boolean showSphereBall = false;

Particle p = new Particle(new Vec3D(0,0,0));


void setup() {
   size(800,600,P3D);
   
   physics = new VerletPhysics();
   world = new AABB(new Vec3D(0,0,0), width/2);
   physics.setWorldBounds(world);
   
   springBall = new SpringBall(center, diameter, numberOfParticles, strength);
   
   sphereBall = new SphereConstraintBall(center, diameter, numberOfParticles);
}

void draw() {
   background(255);
   physics.update();
   translate(width/2, height/2);
   
   p.display2();
   p.move();
   
   //SPHERE BALL
   if(showSphereBall){ 
     if(showTrail){
       sphereBall.display2();    
     } else {
       sphereBall.display();
     }  
   }
   
   
   //SPRING BALL
   if(showSpringBall){
     springBall.display();
     
     if(showConnections){
        springBall.showConnections();
        springBall.displayCenterParticle();
     }
   }
   
   if(mousePressed) {
     sphereBall.applyRotation(new Vec3D(0.4,0,0)); 
     springBall.moveOnZ(new Vec3D(0,0,0.5));
   }
   
}

void keyPressed(){
   if(key == ' '){
      showConnections = !showConnections; 
      showTrail = !showTrail;
   }
   
   if(key == '1'){
       showSpringBall = true;
       showSphereBall = false;
   }
   
   if(key == '2'){
      showSpringBall = false;
      showSphereBall = true;
   }
   
}
