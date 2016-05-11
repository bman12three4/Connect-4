class ChildApplet extends PApplet{
  public ChildApplet(){
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings(){
    size(200, 500);
  }
  
  public void setup(){
    background(255,255,255);
    fill(0,0,0);
    textSize(24);
    text("Turn: ", 20, 40);
    text("Ping: ", 20, 60);
  }
  
  public void draw(){
    fill(255,255,255);
    rect(0,0,100,20);
    fill(0,0,0);
    text(int(fps) + " fps", 20, 20);
  }
}