class Particle {
  float pos_x;
  float pos_y;
  float vel_x;
  float vel_y;
  float size_x;
  float size_y;
  color c;

  cPortal p1, p2;
  int lastTeleportTime;

  Particle(cPortal p1, cPortal p2) {
    this.p1 = p1;
    this.p2 = p2;
    pos_x = random(0, width);
    pos_y = random(0, height);
    vel_x = random(-5, 5);
    vel_y = random(-5, 5);
    size_x = random(3, 7);
    size_y = random(3, 7);
    c = color(random(255), random(255), random(255));
    lastTeleportTime = millis();
  }

  void update() {
    float G = 1000;
    float[] p1Pos = p1.getPosition();
    applyGravity(p1Pos[0], p1Pos[1], G);
    float[] p2Pos = p2.getPosition();
    applyGravity(p2Pos[0], p2Pos[1], G);
    pos_x += vel_x / 2;
    pos_y += vel_y / 2;
  }

  void applyGravity(float targetX, float targetY, float G) {
    float dx = targetX - pos_x;
    float dy = targetY - pos_y;
    float rSquared = dx * dx + dy * dy;
    float minDistance = 25;
    if (rSquared < minDistance) {
      rSquared = minDistance;
    }
    float r = sqrt(rSquared);
    float force = G / rSquared;
    float fx = force * (dx / r);
    float fy = force * (dy / r);
    vel_x += fx;
    vel_y += fy;
  }

  void checkEdges() {
    if (pos_x < 0 || pos_x > width) {
      vel_x *= -0.8;
    }
    if (pos_y < 0 || pos_y > height) {
      vel_y *= -0.8;
    }

    int now = millis();
    if (now - lastTeleportTime > 100) {
      float[] pos1 = p1.getPosition();
      float[] pos2 = p2.getPosition();

      float distToP1 = dist(pos_x, pos_y, pos1[0], pos1[1]);
      float distToP2 = dist(pos_x, pos_y, pos2[0], pos2[1]);

      float teleportRadius = 15;

      if (distToP1 < teleportRadius) {
        pos_x = pos2[0];
        pos_y = pos2[1];
        lastTeleportTime = now;
      } else if (distToP2 < teleportRadius) {
        pos_x = pos1[0];
        pos_y = pos1[1];
        lastTeleportTime = now;
      }
    }
  }

  void display() {
    stroke(0);
    fill(c);
    rect(pos_x, pos_y, size_x, size_y);
  }
}
