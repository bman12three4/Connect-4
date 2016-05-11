class ChildApplet extends PApplet{
  public ChildApplet(){
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  void settings(){
    size(200, 500);
  }
  
  void setup(){
    stroke(255,255,255);
    surface.setTitle("Stats");
    background(255,255,255);
    fill(0,0,0);
    textSize(24);
    text("Turn: ", 20, 40);
    text("Ping: ", 20, 60);
    text("Host: ", 20, 80);
  }
  
  void draw(){
    fill(255,255,255);
    rect(0,0,200,20);
    fill(0,0,0);
    text(fps + " fps", 20, 20);
    textSize(12);
    text(ip, 80, 80);
    textSize(24);
  }
  
  void keyPressed() {
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