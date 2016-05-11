class ChildApplet extends PApplet{
  public ChildApplet(){
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings(){
    size(200, 500);
    background(255,255,255);
  }
  
  public void draw(){
    
  }
}