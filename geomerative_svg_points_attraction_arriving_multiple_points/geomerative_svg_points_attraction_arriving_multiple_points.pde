import geomerative.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

RShape star;
RPoint[] points;
VerletPhysics2D physics;
PImage photo;

ArrayList<Particle> particles;
ArrayList<Mover> movers;
ArrayList<MoverWithTarget> moversWithTarget;
int len = 300;
boolean display = true;
boolean arrive = true;

void setup() {
   size(800,600);
   RG.init(this);
   
   
   photo = loadImage("dot.png");
   physics = new VerletPhysics2D();
   //physics.setWorldBounds(new Rect(-width/2,-height/2,width,height));
   star = RG.loadShape("star.svg");
   star = RG.centerIn(star, g);
   points = star.getPoints();
   
   particles = new ArrayList<Particle>();
   movers = new ArrayList<Mover>();
   moversWithTarget = new ArrayList<MoverWithTarget>();
   
   for(int i =0;i<points.length;i++){
      if(i%5==0){
          Particle p = new Particle(new Vec2D(points[i].x, points[i].y));
          particles.add(p);
      }
   }
   
   for(Particle p : particles) {
       p.lock();
       physics.addParticle(p);
     
   }
   
   for(int i=0;i<len;i++){
      Mover m = new Mover(new Vec2D(i*10,0));
      //movers.add(m);
      int index = int(random(particles.size()));
      Vec2D target = particles.get(index);
      println(target.x, target.y, index, particles.size());
      
      MoverWithTarget mt = new MoverWithTarget(photo, new Vec2D(i*10,5), target);
      moversWithTarget.add(mt);  
      physics.addParticle(mt); 

 }
   
   for(Mover m : movers) {
      //physics.addParticle(m); 
   }
   
   
   
   //physics.addBehavior(new AttractionBehavior(particles.get(20), width, 0.10));
}

void draw() {
    physics.update(); 
  background(255);
   translate(width/2, height/2);
   //RG.shape(star);
   
   
   
   fill(0);
   stroke(0);
   for(int i=0; i<points.length;i++) {
      point(points[i].x, points[i].y); 
   }
   
   if(display) {
     for(Particle p : particles){
        p.display(); 
     }
   }
   
   for(Mover m : movers) {
      m.display(); 
   }
   
   for(MoverWithTarget m : moversWithTarget) {
      m.display(); 
   }
   
   
   if(arrive){
     
   for(Mover m : movers){
      m.arrive(particles.get(int(random(particles.size())))); 
   }
   
   for(MoverWithTarget m : moversWithTarget){
     //println("not arriving");
      m.arrive(); 
   }
   
   
    //println(particles.get(int(random(particles.size()))));
   }
}

void keyPressed() {
   if(key == ' '){
      display = !display; 
   }
   
   if(key == 'f') {
     arrive = !arrive;
   }
}

void mousePressed() {
   for(MoverWithTarget m : moversWithTarget){
      m.setTarget(particles.get(int(random(particles.size())))); 
   }
}
