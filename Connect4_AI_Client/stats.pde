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
    text("Turn: ", 20, 40);
    text("Ping: ", 20, 60);
    text("Host: ", 20, 80);
    text(fps + " fps", 20, 20);
    if (counter % 2 == 0) {
      text("Yellow", 100, 40);
    } else {
      text("Red", 100, 40);
    }
    text(ip, 80, 80);
    textSize(24);
  }

  public void keyPressed() {
    if (keyCode == BACKSPACE) {
      if (ip.length() > 0) {
        ip = ip.substring(0, ip.length()-1);
      }
    } else if (keyCode == DELETE) {
      ip = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      ip = ip + key;
    }
  }
}