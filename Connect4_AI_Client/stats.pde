class ChildApplet extends PApplet {
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  void settings() {
    size(200, 500);
  }

  void setup() {
  }

  public void settings() {
    size(200, 500);
  }

  public void setup() {
    stroke(255, 255, 255);
    surface.setTitle("Stats");
    background(255, 255, 255);
    fill(0, 0, 0);
    textSize(24);
    text("Turn: ", 20, 40);
    text("Ping: ", 20, 60);
    text("Host: ", 20, 80);
  }

  void draw() {
    //draw fps
    fill(255, 255, 255);
    rect(0, 0, 200, 20);
    fill(0, 0, 0);
    text(int(fps) + " fps", 20, 20);
    //draw the turn
    fill(255, 255, 255);
    stroke(255, 255, 255);
    rect(100, 20, 20, 20);
    stroke(255, 255, 255);
    fill(0, 0, 0);
    text((counter % 2), 100, 40);
    //draw the host IP
    textSize(12);
    fill(255, 255, 255);
    rect(80, 60, 200, 20);
    fill(0, 0, 0);
=======
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
>>>>>>> origin/experimental
    text(ip, 80, 80);
    //draw the button to enter the IP
    drawButton(200,200,200);
  }

<<<<<<< HEAD
  void keyPressed() {
=======
  public void keyPressed() {
>>>>>>> origin/experimental
    if (keyCode == BACKSPACE) {
      if (ip.length() > 0) {
        ip = ip.substring(0, ip.length()-1);
      }
    } else if (keyCode == DELETE) {
      ip = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      ip = ip + key;
<<<<<<< HEAD
    }
  }

  void mousePressed() {
    if (mouseX > 20 && mouseX < 200) {
      if (mouseY > 100 && mouseY < 140) {
        ipEntered = true;
        drawButton(150,150,150);
      }
    }
  }

  void drawButton(int r, int g, int b) {
    
    textSize(24);
    fill(r, g, b);
    stroke(100, 100, 100);
    rect(20, 100, 160, 40);
    fill(0, 0, 0);
    text("Enter IP", 80, 120);
    stroke(255, 255, 255);
  }
=======
    }
  }
>>>>>>> origin/experimental
}