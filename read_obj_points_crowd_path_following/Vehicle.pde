class Vehicle extends VerletParticle {
   
  Vec3D location;
  Vec3D velocity;
  Vec3D acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Vehicle(Vec3D pos, float ms, float mf){
    super(pos);
    location = pos;
    r = 10.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new Vec3D(0,0,0);
    velocity = new Vec3D(maxspeed, 0,0);
  }
  
   void applyBehaviors(ArrayList vehicles, Path path) {
    // Follow path force
    Vec3D f = follow(path);
    // Separate from other boids force
    Vec3D s = separate(vehicles);
    // Arbitrary weighting
    f.scaleSelf(3);
    s.scaleSelf(1);
    // Accumulate in acceleration
    applyForce(f);
    applyForce(s);
  }
  
  public void run() {
     update();
     display();
  }
  
  Vec3D follow(Path p) {
    Vec3D predict = velocity.copy();
    predict.normalize();
    predict.scaleSelf(50);
    Vec3D predictLoc = location.add(predict);
    
    Vec3D normal = null;
    Vec3D target = null;
    float worldRecord = 1000000;
    
    for(int i=0;i<p.points.size() - 1;i++) {
       Vec3D a = p.points.get(i);
       Vec3D b = p.points.get((i+1)%p.points.size());
       
       Vec3D normalPoint = getNormalPoint(predictLoc, a,b);
       
       Vec3D dir = b.sub(a);
       
       if(normalPoint.x < minOf(a.x,b.x) || normalPoint.x > maxOf(a.x,b.x) || normalPoint.y < minOf(a.y,b.y) || normalPoint.y > maxOf(a.y,b.y)) {
          normalPoint = b.copy();
          
          a = p.points.get((i+1)%p.points.size());
          b = p.points.get((i+2)%p.points.size());  // Path wraps around
          dir = b.sub(a);
       }
       
       float distance = predictLoc.distanceTo(normalPoint);
       
       if(distance < worldRecord) {
          worldRecord = distance;
          
          normal = normalPoint;
          
          dir.normalize();
          
          dir.scaleSelf(25);
          target = normalPoint.copy();
          target.addSelf(dir);
       }
    }
       
       if(worldRecord > p.radius) {
          return seek(target); 
       } else {
          return new Vec3D(0,0,0); 
       }
       
  }
  
    Vec3D getNormalPoint(Vec3D p, Vec3D a, Vec3D b) {
    // Vector from a to p
    Vec3D ap = p.sub(a);
    // Vector from a to b
    Vec3D ab = b.sub(a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.scaleSelf(ap.dot(ab));
    Vec3D normalPoint = a.add(ab);
    return normalPoint;
  }
  
  Vec3D separate (ArrayList boids) {
    float desiredseparation = r*2;
    Vec3D steer = new Vec3D(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Vehicle other = (Vehicle) boids.get(i);
      float d = location.distanceTo(other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        Vec3D diff = location.sub(other.location);
        diff.normalize();
        diff.scaleSelf(1/d);        // Weight by distance
        steer.addSelf(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.scaleSelf((float)(1/count));
    }

    // As long as the vector is greater than 0
    if (steer.magnitude() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.scaleSelf(maxspeed);
      steer.subSelf(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }


  // Method to update location
  void update() {
    // Update velocity
    velocity.addSelf(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.addSelf(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.scaleSelf(0);
  }

  void applyForce(Vec3D force) {
    // We could add mass here if we want A = F / M
    acceleration.addSelf(force);
  }


  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  Vec3D seek(Vec3D target) {
    Vec3D desired = target.sub(location);  // A vector pointing from the location to the target

    // If the magnitude of desired equals 0, skip out of here
    // (We could optimize this to check if x and y are 0 to avoid mag() square root
    //if (desired.magnitude() == 0) return;

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.scaleSelf(maxspeed);
    // Steering = Desired minus Velocity
    Vec3D steer = desired.sub(velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

      return steer;
  }

  void display() {

    stroke(0);
    strokeWeight(3);
    pushMatrix();
    translate(location.x, location.y, location.z);
    point(0,0);
    popMatrix();
  }
  
  float minOf(float _a, float _b) {
     if(_a > _b) {
        return _b; 
     }
     return _a;
  }
  
  float maxOf(float _a, float _b) {
     if(_a > _b) {
        return _a; 
     }
     return _b;
  }
  
}
