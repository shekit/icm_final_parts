import toxi.physics.*;
import toxi.geom.*;
import toxi.physics.behaviors.*;

PImage img;
ArrayList<Vec2D> points;

void setup() {
   size(900,800);
   img = loadImage("novak.png");
   points = new ArrayList<Vec2D>();
   
   img.loadPixels();
   for(int x = 0;x<img.width;x++){
      for(int y=0;y<img.height;y++){
        int loc1 = x+ y*img.width;
        float b = brightness(img.pixels[loc1]);
        
        if(b==255){
            //println("adding pixel");
            Vec2D v = new Vec2D(x,y);
            points.add(v);
        }
      }
   }
}

void draw() {
   background(0);
   translate(width/2, height/2);
   println(points.size());
   //println(points.get(1));
   stroke(255);
   strokeWeight(2);
   for(Vec2D v : points) {
      point(v.x, v.y); 
   }
   noLoop();
   
}
