import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import toxi.physics.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.SphereConstraint;

ArrayList<Particle> particles;
VerletPhysics physics;
Minim minim;
AudioPlayer groove;
int len = 100;
AABB world;
SphereConstraint sphere;
float angle = 0;
int w;

void setup() {
   size(800,600, P3D);
   physics = new VerletPhysics();
   minim = new Minim(this);
   world = new AABB(new Vec3D(0,0,0), width/2);
   //physics.setWorldBounds(world);
   groove = minim.loadFile("groove.mp3", 1024);
   groove.loop();
   particles = new ArrayList<Particle>();
   for(int i=0;i<len;i++) {
     Vec3D pos = Vec3D.randomVector();
     pos.scaleSelf(100);
      Particle p = new Particle(pos);
      particles.add(p);
   }
   w = width;
   sphere = new SphereConstraint(new Vec3D(0,0,0), 120, true);
   for(Particle p : particles){
      physics.addParticle(p); 
      //physics.addBehavior(new AttractionBehavior(p, 100, -0.2));
   }
}

void draw() {
  background(255);
  physics.update();
  
  beginCamera();
    camera();
    rotateY(-angle);
  endCamera();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  translate(width/2,height/2);
  rotateY(angle);
  angle += 0.01;
  
  
  for(Particle p : particles) {
     p.display(); 
     sphere.apply(p);
     //p.addForce(new Vec3D(0,0,0.3));
  }
  
  for(int i=0;i<particles.size();i++){
     if(i%2==0) {
       particles.get(i).z = lerp(groove.left.level()*1, groove.left.level()*300, 0.5); 
       // particles.get(i).z = groove.left.level()*200; 
     }
  }
  println(groove.left.level());
  
  w+=5;
  
}
