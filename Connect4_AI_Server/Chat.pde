class Chat extends PApplet {
  public Chat() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  void settings(){
    size(400, 100);
  }
  
  void setup(){
    background(255,255,255);
  }
}