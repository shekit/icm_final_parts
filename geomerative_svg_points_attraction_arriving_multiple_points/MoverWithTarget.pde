class MoverWithTarget extends VerletParticle2D {
  
  float maxspeed = 5;
  float maxforce = 0.1;
  Vec2D target;
  PImage img;
  
  MoverWithTarget(PImage _img,Vec2D pos, Vec2D _target) {
    super(pos);
    target = _target;
    img = _img;
  }

  void display() {
    imageMode(CENTER);
     image(img, x,y);
  } 
  
  void setTarget(Vec2D v){
     target = v; 
  }

  void arrive() {
    println(target);
    fill(255,255,0);
    ellipse(target.x,target.y,2,2);
    Vec2D desired = target.sub(this);  // A Vec2D targettor pointing from the location to the target
    float d = desired.magnitude();
    // Scale with arbitrary damping within 100 pixels
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.normalizeTo(m);
    } else {
      desired.normalizeTo(maxspeed);
    }

    // Steering = Desired minus Velocity
    Vec2D steer = desired.sub(this.getVelocity());
    steer.limit(maxforce);  // Limit to maximum steering force
    println(steer);
    addForce(steer);
  }
}
