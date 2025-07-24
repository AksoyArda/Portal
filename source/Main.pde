cPortal p1;
cPortal p2;
boolean isPortalA;
Particle[] particles;
int particleCount;

void setup() {
  size(960, 540);
  colorMode(RGB);
  p1 = new cPortal(50, 100, color(250, 100, 0, 150));
  p2 = new cPortal(300, 200, color(0, 150, 250, 150));
  isPortalA = true;
  particleCount = 30;
  particles = new Particle[particleCount];
  for (int i = 0; i < particleCount; i++) {
    particles[i] = new Particle(p1, p2);
  }
}

void draw() {
  background(20);
  p1.display();
  p2.display();
  for (int i = 0; i < particleCount; i++) {
    Particle myParticle = particles[i];
    myParticle.update();
    myParticle.checkEdges();
    myParticle.display();
  }
}

void mousePressed() {
  if (isPortalA) {
    p1.setPosition(mouseX, mouseY);
  } else {
    p2.setPosition(mouseX, mouseY);
  }
  isPortalA = !isPortalA;
}
