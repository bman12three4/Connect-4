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
    text("Turn: ", 20, 20);
    text("This is a test", 50, 50);
  }
  
  public void draw(){
    
  }
}