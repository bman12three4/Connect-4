class Chat extends PApplet {
  public Chat() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  void settings() {
    size(400, 120);
  }

  void setup() {
    fill(0, 0, 0);
    background(255, 255, 255);
  }

  void draw() {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    rect(0, 0, 400, 120);
    fill(0, 0, 0);
    textSize(20);
    for (int i= 4; i >= 0; i--) {
      text(chatMessages[i], 10, (20*i)+5);
    }
    text(chatType, 10, 105);
    fill(200, 200, 200);
    stroke(150, 150, 150);
    rect(width-20, height-20, 20, 20);
    fill(0, 0, 0);
    stroke(255, 255, 255);
  }

  void keyPressed() {
    if (keyCode == BACKSPACE) {
      if (chatType.length() > 0) {
        chatType = chatType.substring(0, chatType.length()-1);
      }
    } else if (keyCode == DELETE) {
      chatType = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      chatType = chatType + key;
    }
  }

  void mouseClicked() {
      if (mouseX > width-20 && mouseX < width) {
        if (mouseY > height-20 && mouseY < height) {
          shiftChat();
        }
      }
  }

  void shiftChat() {
    chatTemp[0] = chatMessages[4];
    chatMessages[4] = chatType;
    chatType = "";
    chatTemp[1] = chatMessages[3];
    chatMessages[3] = chatTemp[0];
    chatTemp[0] = chatMessages[2];
    chatMessages[2] = chatTemp[1];
    chatTemp[1] = chatMessages[1];
    chatMessages[1] = chatTemp[0];
    chatTemp[0] = chatMessages[0];
    chatMessages[0] = chatTemp[1];
  }
}