class Chat extends PApplet {
  public Chat() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  void settings() {
    size(400, 100);
  }

  void setup() {
    fill(0, 0, 0);
    background(255, 255, 255);
  }

  void draw() {
    textSize(20);
    for (int i= 0; i < 5; i++) {
      text(chatMessages[i], 10, (20*i)+15);
      System.out.println(chatMessages[i]);
    }
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

  void shiftChat() {
    chatTemp[0] = chatMessages[0];
    chatMessages[0] = chatType;
    chatTemp[1] = chatMessages[1];
    chatMessages[1] = chatTemp[0];
    chatTemp[0] = chatMessages[2];
    chatMessages[2] = chatTemp[1];
    chatTemp[1] = chatMessages[3];
    chatMessages[3] = chatTemp[0];
    chatTemp[0] = chatMessages[4];
    chatMessages[4] = chatTemp[1];
  }
}