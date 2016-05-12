class ChildApplet extends PApplet {
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(200, 500);
  }

  public void setup() {
    stroke(255, 255, 255);
    surface.setTitle("Stats");
    background(255, 255, 255);
    fill(0, 0, 0);
  }

  public void draw() {
    background(255, 255, 255);
    textSize(24);
    text("Turn: ", 20, 40);
    text("Ping: ", 20, 60);
    if (counter % 2 == 0) {
      text("Yellow", 100, 40);
    } else {
      text("Red", 100, 40);
    }
    text(int(fps) + " fps", 20, 20);
  }
}