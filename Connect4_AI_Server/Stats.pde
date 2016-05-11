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
  }
  
  void draw(){
    fill(255,255,255);
    rect(0,0,200,20);
    fill(0,0,0);
    text(int(fps) + " fps", 20, 20);
  }
}