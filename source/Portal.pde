class cPortal {
  private float pos_x;
  private float pos_y;
  private color portalColor;

  cPortal() {
    this.pos_x = random(0, width);
    this.pos_y = random(0, height);
    this.portalColor = color(100);
  }

  cPortal(float px, float py) {
    this.pos_x = px;
    this.pos_y = py;
    this.portalColor = color(100);
  }

  cPortal(float px, float py, color c) {
    this.pos_x = px;
    this.pos_y = py;
    this.portalColor = c;
  }

  void display() {
    stroke(0);
    fill(portalColor);
    ellipse(pos_x, pos_y, 20, 40);
  }

  public float[] getPosition() {
    float[] positions = {pos_x, pos_y};
    return positions;
  }

  public void setPosition(float px, float py) {
    this.pos_x = px;
    this.pos_y = py;
  }

  public void setColor(color c) {
    this.portalColor = c;
  }

  public color getColor() {
    return portalColor;
  }
}
