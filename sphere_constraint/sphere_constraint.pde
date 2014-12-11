import toxi.physics.constraints.SphereConstraint;
import toxi.physics.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics.behaviors.*;

VerletPhysics physics;
ArrayList<Particle> particles;
int len = 200;
AABB world;

int constraint = 100;

float angle = 0;
SphereConstraint sphere;
boolean in_out = true;

void setup() {
   size(800,600,P3D);
   physics = new VerletPhysics();
   world = new AABB(new Vec3D(0,0,0), width/2);
   physics.setWorldBounds(world);
   particles = new ArrayList<Particle>();
   
   
   for(int i =0 ;i < len;i++){
      Vec3D pos = Vec3D.randomVector();
       pos.scaleSelf(100);
      Particle p = new Particle(pos); 
      particles.add(p);
   }
   
   for(Particle p : particles){
      physics.addParticle(p); 
      physics.addBehavior(new AttractionBehavior(p, 10, -0.2));
   }
   
   
 }

void draw() {
    background(255);
    physics.update();
    sphere = new SphereConstraint(new Vec3D(0, 0, 0), constraint , in_out);
    
    translate(width/2, height/2);
    rotateY(angle);
    
    for(Particle p : particles) {
      //blendMode(ADD);
       p.display();
       sphere.apply(p); 
    }
    
    angle += 0.01;
    
    if(!mousePressed) {
        for(Particle p : particles) {
            p.addForce(new Vec3D(Vec3D.randomVector().scaleSelf(0.02)));
        }
    }
    
    if(mousePressed) {
        for(Particle p : particles) {
            p.addForce(new Vec3D(0.2,0.6,-0.6));
        }
    }
      
    
}

void keyPressed() {
   if(key == ' '){
      constraint = 80; 
   }
   else if(key == 'a') {
      constraint = 100; 
   }
   
   else if(key == 'b') {
      in_out = !in_out; 
   }
}
