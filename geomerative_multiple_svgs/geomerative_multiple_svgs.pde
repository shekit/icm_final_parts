import geomerative.*;
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

RShape star;
RShape rect;
RShape circle;

RPoint[] starPoints;
RPoint[] rectPoints;
RPoint[] circlePoints;

ArrayList<Target> starTargets;
ArrayList<Target> rectTargets;
ArrayList<Target> circleTargets;

VerletPhysics physics;

Cluster cluster;

int numParticles = 1500;
int diam = 100;
float angle = 0.0;

boolean foundTarget = false;

boolean displayTargets = true;

boolean wimbledon = false;
boolean french = false;
boolean _2014 = false;
boolean _2013 = false;

float[] wimbledonBtn = {0,0,70,20};
float[] frenchBtn = {0,0,70,40};
float[] _2014Btn = {0,60,70,80};
float[] _2013Btn = {0,80,70,100}; //add second value to fourth value to get correct boundary points

void setup(){
   size(800,600,P3D);
   physics = new VerletPhysics();
   
   RG.init(this);
   
   //star shape
   star = RG.loadShape("star.svg");
   star = RG.centerIn(star,g);
   starPoints = star.getPoints();
   starTargets = new ArrayList<Target>();
   
   for(int i=0;i<starPoints.length;i++){
      if(i%5==0){
         Target t = new Target(new Vec3D(starPoints[i].x, starPoints[i].y, 0));
         starTargets.add(t);
      }
   }
   println(starPoints[1].x, starPoints[1].y);
   
   //rect shape
   rect = RG.loadShape("rect.svg");
   rect = RG.centerIn(rect,g);
   rectPoints = rect.getPoints();
   rectTargets = new ArrayList<Target>();
   
   for(int i=0;i<rectPoints.length;i++){
      if(i%5==0){
         Target t = new Target(new Vec3D(rectPoints[i].x, rectPoints[i].y, 0));
         t.scaleSelf(0.5);
         rectTargets.add(t);
      }
   }
   
   //circle shape
   circle = RG.loadShape("circle.svg");
   circle = RG.centerIn(circle,g);
   circlePoints = circle.getPoints();
   circleTargets = new ArrayList<Target>();
   
   for(int i=0;i<circlePoints.length;i++){
      if(i%5==0){
         Target t = new Target(new Vec3D(circlePoints[i].x, circlePoints[i].y, 0));
         t.scaleSelf(0.5);
         circleTargets.add(t);
      }
   }
   
   
   cluster = new Cluster(numParticles,diam);
}

void draw() {
    physics.update();
    pushMatrix();
    translate(width/2, height/2);
    
    background(0);
    
    cluster.display();
    if(displayTargets){
        
      for(Target t : starTargets){
         t.display(); 
      }
      
      for(Target t : rectTargets){
         t.display(); 
      }
      
      for(Target t : circleTargets){
         t.display(); 
      }
      
    }
    
    if(foundTarget) {
        cluster.arrive();
    }
    popMatrix();
       angle += 0.1;
    
    fill(255,0,0);
    rect(wimbledonBtn[0], wimbledonBtn[1], wimbledonBtn[2], wimbledonBtn[3]-wimbledonBtn[1]);
    
    fill(0,255,0);
    rect(frenchBtn[0],frenchBtn[1],frenchBtn[2],frenchBtn[3]-frenchBtn[1]);
    
    fill(0,0,255);
    rect(_2014Btn[0],_2014Btn[1],_2014Btn[2],_2014Btn[3]-_2014Btn[1]);
    
    fill(0,255,255);
    rect(_2013Btn[0],_2013Btn[1],_2013Btn[2],_2014Btn[3]-_2014Btn[1]);
}

void keyPressed() {
   if(key == ' '){
      displayTargets = !displayTargets; 
   }
   
   if(key == '1'){
       foundTarget = true;
       cluster.setTarget(starTargets);
   }
   
   if(key == '2'){
       foundTarget = true;
       cluster.setTarget(rectTargets);
   }
   
   if(key == '3'){
      foundTarget = true;
      cluster.setTarget(circleTargets);
   }
   

}

void mousePressed() {
   // if(mouseX > 0 && mouseX < 70 && mouseY > 0 && mouseY < 20){
   //    foundTarget = true; 
   //    cluster.setTarget(circleTargets);
   // }
   
   if(clicked(wimbledonBtn)){
      wimbledon = true;
      french = false;
      println("Clicked wimbledon button");
      println("Wimbledon: "+wimbledon);
      println("French: "+french);
   }
   
   
   
   if(clicked(_2014Btn)){
      _2014 = true;
      _2013 = false;
      println("2014: "+ _2014);
   }
   
   if(wimbledon && _2014){
      foundTarget = true;
      cluster.setTarget(circleTargets);
   }

}

boolean clicked(float[] button){
    if(mouseX > button[0] && mouseX < button[2] && mouseY > button[1] && mouseY < button[3]){
        return true;
    }
    
    return false;
}
