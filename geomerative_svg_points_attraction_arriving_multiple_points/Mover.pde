class Mover extends VerletParticle2D {
  
  float maxspeed = 5;
  float maxforce = 0.1;
  
  Mover(Vec2D pos) {
    super(pos);
  }

  void display() {
    fill(0);
    noStroke();
    ellipse(x,y,4,4);
  } 

  void arrive(Vec2D target) {
    Vec2D desired = target.sub(this);  // A vecVec2D targettor pointing from the location to the target
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
    addForce(steer);
  }
}
